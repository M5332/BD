package DSA_stack;

public class Stack {

	private int[] a = new int [5];
	int top =-1;
	int size ;
	
	//Stack s= new Stack();
		
	public Stack()
	{
		size = a.length;
		top = -1;
	}
	
	public void push(int i ) {
	
		top++;
		if(top<size) {
		
		a[top]=i;
		}
		else {
			
		 
		System.out.println( "stack overflow");
		}
		
	}
	public void printstack()
	{
		for(int n:a)
		{
			System.out.print(n + " ");
		}
		System.out.println();
	}

	public int  pop() {
		// TODO Auto-generated method stub
		if (top> -1) {
		return top-- ;
		}
		else {
			System.out.println("stack under flow ");
		}
		return 0;
	}

	public int peek() {
		// TODO Auto-generated method stub
		return top ;
		
	}
}
