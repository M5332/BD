package DSA_linkedlist;

public class LinkedList {

	Node head = null;

	public void add(int i) {
		// TODO Auto-generated method stub

		Node c = head;
		Node n = new Node(i);
		if (head == null) {
			head = n;
		} else {
			while (c.next != null) {
				c = c.next;
			}
			c.next = n;
		}

	}

	public void print() {
		// TODO Auto-generated method stub
		Node c = head;

		while (c != null) {
			System.out.print(c.data + " ");
			c = c.next;

		}
		System.out.println();

	}

	public void addfirst(int i) {
		// TODO Auto-generated method stub

		Node n = new Node(i);
		n.next = head;
		head = n;
	}

	public void delete(int i) {
		// TODO Auto-generated method stub
		Node c = head;
		while (c.next != null && c.next.data != i) {
			c = c.next;
		}
		if (c.next != null) {
			c.next = c.next.next;
		}
	}

}
