#include <stdio.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <string.h>
#include <stdlib.h>
#include <netdb.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <time.h>
#define SIZE 1024
time_t timep;

int main(int argc, char *argv[])
{
    pid_t pid;
    int sockfd,confd;
    char buffer[SIZE],buf[SIZE];
    char buffert[SIZE];
    struct sockaddr_in server_addr;
    struct sockaddr_in client_addr;
    struct hostent *host;
    short port;
    char *name;

    if(argc!=4)
    {
        fprintf(stderr,"Usage:%s hostname \a\n",argv[0]);
        exit(1);
    }

    if((host=gethostbyname(argv[1]))==NULL)
    {
        fprintf(stderr,"Gethostname error\n");
        exit(1);
    }
    port=atoi(argv[2]);
    name=argv[3];

    if((sockfd=socket(AF_INET,SOCK_STREAM,0))==-1)
    {
        perror("Socket error!");
        exit(1);
    }
    else
        printf("Socket successful!\n");
    
    bzero(&server_addr,sizeof(server_addr));
    server_addr.sin_family=AF_INET; 
    server_addr.sin_port=htons(port);
    server_addr.sin_addr=*((struct in_addr *)host->h_addr);

    if(confd=connect(sockfd,(struct sockaddr *)(&server_addr),sizeof(struct sockaddr))==-1)
    {
        perror("Connect error!");
        exit(1);
    }
    else
        printf("Connect successful!\n");

    send(sockfd,name,20,0);

    pid = fork();
    while(1)
    {
        if(pid > 0)
        {
            struct tm *p;
            time(&timep);
            p = localtime(&timep);
            memset(buffer, 0, sizeof(buffer));
            strftime(buffert, sizeof(buffert), " %H:%M:%S\n", p);
            strcat(buffer,name);
            strcat(buffer,buffert);
            memset(buf,0,SIZE);
            fgets(buf,SIZE,stdin);

            if(strncmp("e",buf,1)==0)
            {
                printf("log out...\n");
                strcat(buffer,"log out.");
                if((send(sockfd,buffer,SIZE,0)) <= 0)
                {
                    perror("Send error!");
                    exit(1);
                }
                close(sockfd);
                sockfd = -1;
                exit(0);
            }
            else
            {
                strncat(buffer,buf,strlen(buf)-1);
                strcat(buffer,"\n");
                if((send(sockfd,buffer,SIZE,0)) <= 0)
                {
                    perror("Send error!");
                    exit(1);
                }
            }
        }
        else if(pid == 0)
        {
            memset(buffer,0,SIZE);
            if(sockfd > 0)
            {
                if((recv(sockfd,buffer,SIZE,0)) <= 0)
                {
                    close(sockfd);
                    exit(1);
                }
                printf("%s\n",buffer);
            }
        }
    }
    close(sockfd);
    return 0;
}