/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-30-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AddPrimaryContact implements Queueable{
    Contact con;
    String state;
    
    public AddPrimaryContact(Contact con, String state){
        this.con = con;
        this.state = state;
    }
    public void execute(QueueableContext qc){
        List<Account> acclist = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        
        List<Contact> acclist = new List<Contact>();
        for(Account acc : acclist){
            Contact conInst = con.clone(false,false,false,false);
            conInst.AccountId = acc.Id;
        
            acclist.add(conInst);
        }
        
        INSERT acclist;
    }
}