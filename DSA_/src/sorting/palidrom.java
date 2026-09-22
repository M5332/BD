package sorting;

import java.util.*;

public class palidrom {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		String s = sc.next();
		
		String s2 = new StringBuilder(s).reverse().toString();
		
		if (s2.equals(s))
		{
			System.out.println("palidrom");
		}
		else
		{
			System.out.println("na");
		}
		

	}

}
