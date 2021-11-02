package signUp.signUpModules;
import java.util.Scanner;
import user.user;
import login.loginPage;
import signUp.registrationPage;
public class customerSignUp
//done
{
	public boolean addCustomerToDb(user u)
	{
		//write sql for inserting a new brand into the database
		return true;
	}
	public String generateWalletId(user usr)
	{
		//write query to return wallet id for the corresponding user
		return null;
	}
	public void customerFunct()
	{
		System.out.println("Enter the customer Id:");
		System.out.println("Enter the customer name");
		System.out.println("Enter the password");
		System.out.println("Address");
		System.out.println("Phone number");
		Scanner sc=new Scanner(System.in);
		String customerId=sc.nextLine();
		String customerName=sc.nextLine();
		String address=sc.nextLine();
		String phoneNumber=sc.nextLine();
		user usr=new user();
		usr.setUserId(customerId);
		usr.setUsername(customerName);
		usr.setAddress(address);
		usr.setPhoneNumber(phoneNumber);
		//generate wallet id for user
		String walletId=generateWalletId(usr);
		usr.setWalletId(walletId);
		customerSignUp currentUsr=new customerSignUp();
		boolean userAdded=currentUsr.addCustomerToDb(usr);
		//if customer is added successfully navigate to login page
		if(userAdded)
		{
			loginPage lg=new loginPage();
			lg.display();
		}
	}
	public void display()
	{
		Scanner sc=new Scanner(System.in);
		System.out.println("1.Sign Up");
		System.out.println("2.Go Back");
		int choice=sc.nextInt();
		switch(choice)
		{
		case 1:
			customerFunct();
			break;
		case 2:	
			//to go back to the registration page
			registrationPage regObj=new registrationPage();
			regObj.display();
			break;
		}
	}
}