package multithearding;

public class app extends Thread{
	
	private String task;
	
	app(String task )
	{
		this.task = task;
	}
	
	public void run() {
		System.out.println( task + "thread running " + Thread.currentThread().getName());
		
		
	}
	
	public synchronized void run2() {
		System.out.println( task + "thread running  main" + Thread.currentThread().getName());
	}
	
}



