package compositeTest;

abstract class Element {
	public abstract long getCost();
	public abstract void add(Element e);
	public abstract void remove(Element e);
	public abstract Element getElement(int i);
	public abstract int numberOfElements();
}

class Member extends Element{
	private String name;
	private long salary; //コスト
	
	public Member(String n,long s)
	{
		name = n;
		salary = s;
	}
	
	public long getCost()
	{
		return salary;
	}
	
	/*Leafは徨オブジェクトを隔たない*/
	public void add(Element e) 
	{
		System.out.println("you can't add a component to a object!");
	}
	
	public void remove(Element e)
	{
		System.out.println("you can't remove component to a program object");
	}

	public Element getElement(int i) 
	{
		System.out.println("you can't get other component from a single object!");
		return null;
	}

	public int numberOfElements() 
	{
		System.out.println("you can't count the number from a single object!");
		return 0;
	}
}
