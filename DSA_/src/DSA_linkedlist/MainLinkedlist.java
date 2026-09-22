package DSA_linkedlist;

//import java.util.LinkedList;

public class MainLinkedlist {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		LinkedList num = new LinkedList();

		num.add(8);
		num.add(6);
		num.add(7);

		num.addfirst(9);
		num.print();
		num.delete(6);
		num.print();

	}

}
