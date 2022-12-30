/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-30-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@istest
public class  AccountProcessorTest
{
    @istest
    public sharing static void testAccountProcessorTest(){
    account acc=new account();
    acc.Name='test name';
    insert acc;
    
    contact con = new contact();
    con.AccountId = acc.Id;
    con.FirstName = 'test first name';
    con.LastName = 'test last name';
    insert con;
        
        list<id> listid = new list<id>();
        listid.add(acc.Id);
        
        test.startTest();
         AccountProcessor.countContacts(listid);
        test.stopTest();
    } 
}