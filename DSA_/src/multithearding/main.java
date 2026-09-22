package multithearding;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		app n1=new app("self ");
		app n2=new app(" enagine start");
		n1.start();
		n2.start();
		
		n1.run2();
		n2.run2();
	}

}
