package compositeTest;

public class Client {
	public static void main(String[] args){
		
		System.out.println("削除前：");
		Element bmember1 = new Member("販売課員",7000); //members at the base layer
		Element bmember2 = new Member("販売課員",7000);
		Element bmember3 = new Member("販売課長",10000);
		Element group1 = new Group("販売課");
		group1.add(bmember1);
		group1.add(bmember2);
		group1.add(bmember3);
		System.out.println("販売課に２番目の要数は：" + group1.getElement(2));
		System.out.println("販売課の人数は：" + group1.numberOfElements());
		//group1.getCost(); //販売課のコストを計算
		
		Element bmember4 = new Member("企画課員",6000);
		Element bmember5 = new Member("企画課長",9000);
		Element group2 = new Group("企画課");
		group2.add(bmember4);
		group2.add(bmember5);
		//group2.getCost(); //企画課のコストを計算
		
		Element bmember6 = new Member("製造課員",5000);
		Element bmember7 = new Member("製造課員",5000);
		Element bmember8 = new Member("製造課長",8000);
		Element group3 = new Group("製造課");
		group3.add(bmember6);
		group3.add(bmember7);
		group3.add(bmember8);
		//group3.getCost(); //製造課のコストを計算
		
		Element mmember1 = new Member("営業部長",11000); //members at the medium layer
		Element mgroup1 = new Group("営業部");
		mgroup1.add(mmember1);
		mgroup1.add(group1);
		mgroup1.add(group2);
		//mgroup1.getCost(); //営業部のコストを計算
		
		Element mmember2 = new Member("開発部長",6000);
		Element mgroup2 = new Group("開発部");
		mgroup2.add(mmember2);
		mgroup2.add(group3);
		//mgroup2.getCost(); //開発部のコストを計算
		
		Element lmember1 = new Member("社長",12000);
		Element supergroup = new Group("会社");
		supergroup.add(lmember1);
		supergroup.add(mgroup1);
		supergroup.add(mgroup2);
		supergroup.getCost(); //会社のコストを計算
		System.out.println();
		
		System.out.println("削除後：");
		group1.remove(bmember2);
		supergroup.getCost();
		
	}

}
