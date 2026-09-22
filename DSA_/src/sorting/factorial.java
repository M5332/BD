package sorting;
import java.util.*;
public class factorial {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		int v = sc.nextInt();
		int r =1;
		
		for( int i =1 ; i<=v;i++)
		{
			r= r*i;
		}
		System.out.println(r);

	}

}
