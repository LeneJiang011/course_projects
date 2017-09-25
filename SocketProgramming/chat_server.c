#include<stdio.h>
#include<stdlib.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<netinet/in.h>
#include<sys/socket.h>
#include<string.h>
#include<unistd.h>
#include<signal.h>
#include<sys/ipc.h>
#include<errno.h>
#include<sys/shm.h>
#include<time.h>
#include<pthread.h>

#define PORT 5678
#define SIZE 1024
#define SIZE_SHMADD 2048
#define BACKLOG 3
int sockfd;
int fd[BACKLOG] ={-1};
int i=0;
struct sockaddr_in server_addr;

int get_sockfd()
{
    if((sockfd=socket(AF_INET,SOCK_STREAM,0))==-1)
    {
        perror("Socket error!");
        exit(1);
    }
    else
        printf("Socket successful!\n");
    bzero(&server_addr,sizeof(struct sockaddr_in));
    server_addr.sin_family=AF_INET;
    server_addr.sin_addr.s_addr=htonl(INADDR_ANY);
    server_addr.sin_port=htons(PORT);

    if(bind(sockfd,(struct sockaddr *)(&server_addr),sizeof(struct sockaddr))==-1)
    {
        perror("Bind error!");
        exit(1);
    }
    else
        printf("Bind successful!\n");

    if(listen(sockfd,BACKLOG)==-1)
    {
        perror("Listen error!");
        exit(1);
    }
    else
        printf("Listening.....\n");
    return sockfd;
}

int shmid_create()
{
    int shmid;
    if((shmid = shmget(IPC_PRIVATE,SIZE_SHMADD,0777)) < 0)
    {
        perror("Shmid error!");
        exit(1);
    }
    else
        printf("Shmid successful!\n");
    return shmid;
}

int main(int argc, char *argv[])
{
    char shmadd_buffer[SIZE_SHMADD],buffer[SIZE];
    struct sockaddr_in client_addr;
    int sin_size;
    pid_t ppid,pid;
    int new_fd;
    int shmid;
    char *shmadd;

    shmid = shmid_create();
    shmadd = shmat(shmid, 0, 0);

    int sockfd = get_sockfd();

    while(1)
    {
        sin_size=sizeof(struct sockaddr_in);
        if((new_fd=accept(sockfd,(struct sockaddr *)(&client_addr),&sin_size))==-1)
        {
            perror("Accept error!");
            exit(1);
        }
        else
            printf("Accept successful!\n");
        fd[i++] = new_fd;

        memset(buffer,0,SIZE);
        strcpy(buffer,"\n CHAT ROOM \n");
        send(new_fd,buffer,SIZE,0);

        ppid = fork();
        if(ppid == 0)
        {
            int j;
            recv(new_fd,buffer,SIZE,0);
            strcat( buffer," is connected.");
            for(j=0;j<BACKLOG;j++)
            {
                if(fd[j]!=-1)
                   send(fd[j],buffer,strlen(buffer),0); 
            }
            pid = fork();
            while(1)
            {
                if(pid > 0)
                {
                    memset(buffer,0,SIZE);
                    if((recv(new_fd,buffer,SIZE,0)) <= 0)
                    {
                        close(new_fd);
                        exit(1);
                    }
                    memset(shmadd, 0, SIZE_SHMADD);
                    strncpy(shmadd, buffer, SIZE_SHMADD);
                    printf(" %s\n",buffer);
                }
                if(pid == 0)
                {
                    sleep(1);
                    if(strcmp(shmadd_buffer,shmadd) != 0)
                    {
                        strcpy(shmadd_buffer,shmadd);
                        if(new_fd  > 0)
                        {
                            if(send(new_fd,shmadd,strlen(shmadd),0) == -1)
                            {
                                perror("Send error!");
                                exit(1);
                            }
                            memset(shmadd, 0, SIZE_SHMADD);
                            strcpy(shmadd,shmadd_buffer);
                        }
                    }
                }
            }
        }
    }
    free(buffer);
    close(new_fd);
    close(sockfd);
    return 0;
}