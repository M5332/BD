package pp;

import java.util.Scanner;

public class pratcie {
	
	public static void main(String arg[])
	{
		
		System.out.println("hello");
		int[] m = new int[5];
		
		Scanner sc = new Scanner(System.in);
		for (int i=0; i<5;i++) {
			m[i]=sc.nextInt();
			
		}
		for (int i=0; i<5;i++) {
			
			System.out.println(m[i]);
			
		}
		
	}

}
