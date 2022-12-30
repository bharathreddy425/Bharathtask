/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-30-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class AddPrimaryContactTest{
    @testSetup
    static void setup(){
        List<Account> acclist = new List<Account>();
        for(Integer i = 1; i <= 100; i++){
            if(i <= 50)
                acclist.add(new Account(name='AC'+i, BillingState = 'NY'));
            else
                acclist.add(new Account(name='AC'+i, BillingState = 'CA'));
        }
        
        insert acclist;
    }

    static testmethod void testAddPrimaryContact(){
        Contact con = new Contact(LastName = 'TestCont');
        AddPrimaryContact addPCIns = new AddPrimaryContact(CON ,'CA');
        
        Test.startTest();
        System.enqueueJob(addPCIns);
        Test.stopTest();
    }
}