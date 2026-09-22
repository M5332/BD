package sorting;

import java.util.Scanner;

public class prime_no {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
Scanner sc = new Scanner(System.in);
		
		int v = sc.nextInt();
		int c=0;
		long startTime = System.nanoTime();
		if(v==0)
		{
			System.out.println("not prime");
		}
		for(int i=1;i<=v;i++)
		{
			if(v%i==0)
			{
				c++;
			}
		}

	if (c<=2)
	{
		System.out.println(" prime"+ c);
	}
	else
	{
		System.out.println("not prime"+c);
	}
	long endTime = System.nanoTime();


    System.out.println("\nTime taken (nanoseconds): " + (endTime - startTime));

}}
