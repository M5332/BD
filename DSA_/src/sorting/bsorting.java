package sorting;

import java.lang.reflect.Array;
import java.util.Arrays;

public class bsorting {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int[] a = {10,6,70,30,60};
		int t ;
		
		 long startTime = System.nanoTime();
		for( int i =0 ; i < a.length-1 ;i++)
		{
			for (int j =0; j<a.length-1; j++)
			{
				if (a[j]>a[j+1]) {
				t=a[j];
				a[j]=a[j+1];
				a[j+1]=t;}
			}
			
		}
		Arrays.stream(a).forEach(i -> System.out.print(i + " "));
		
		long endTime = System.nanoTime();


        System.out.println("\nTime taken (nanoseconds): " + (endTime - startTime));
		

	}

}
