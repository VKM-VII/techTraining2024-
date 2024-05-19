public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> accList){
        for(Account acc : accList){
            if(acc.Industry!= null && acc.Industry=='Media')
            	acc.Rating='Hot';
        }
    }
}