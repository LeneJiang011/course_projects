package compositeTest;
import java.util.ArrayList;

class Group extends Element{
	private String name;
	private ArrayList<Element> children;
	
	public Group(String n)
	{
		name = n;
		children = new ArrayList<Element>();
	}

	public long getCost() 
	{
		long sum = 0;
		for(Element e: children)
		{
			sum += e.getCost();
		}
		System.out.println(name + "のコストは" + sum); //コストを燕幣する
		return sum;
	}

	public void add(Element e) 
	{
		children.add(e);
	}

	public void remove(Element e) 
	{
		children.remove(e);
	}

	public Element getElement(int i) 
	{
		return children.get(i);
	}

	public int numberOfElements() 
	{
		return children.size();
	}
}
