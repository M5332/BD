package DSA_stack;

//import java.util.Stack;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Stack s= new Stack();
		
		s.push(10);
		s.push(9);
		s.push(20);
		s.pop();
		s.push(10);
		s.peek();
		s.push(9);
		s.push(20);
//		System.out.println(s);
//		s.pop();
//		System.out.println(s);
		s.printstack();
	}

}
