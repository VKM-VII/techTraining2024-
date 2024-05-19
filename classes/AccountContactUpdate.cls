public class AccountContactUpdate {
    Public Static void ACUpdate(){
        List<Account> acc = [SELECT AnnualRevenue FROM Account WHERE Name = 'New Tech Inc'];
        acc[0].AnnualRevenue=3000000;
        update acc;
        List<Contact> con = [SELECT Email FROM Contact WHERE Name = 'Emily Johnson'];
        con[0].Email ='emily.johnson.updated@example.com';
        update con;
    }
}