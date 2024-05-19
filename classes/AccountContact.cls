public class AccountContact {
    public static Void AccountContactInsertion(){
        List<Account> accList = new List<Account>{
            new Account(Name='New Tech Inc', Industry ='Technology', AnnualRevenue = 2000000)
        };
        insert accList;
        
        
        List<Contact> conList = new List<Contact>{
            new Contact(FirstName='Emily', LastName='Johnson',Email = 'emily.johnson@example.com',AccountId = accList[0].Id)	
        };
		insert conList;
        
        
        
    }
    /*
    public static void InsertAcc(){
        List<Account> accList = New List<Account>();
         Account acc = new Account();
            acc.Name = 'New Tech Inc';
            acc.Industry = 'Technology'; 
            acc.AnnualRevenue = 2000000;
            accList.add(acc);   
        insert accList;
    }
*/
}