/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-30-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public sharing  class AccountProcessor 
{
     @future
    public static void countContacts(list <id> recordid)
    {
        list<account> acclist = [select id, Name,Number_Of_Contacts__c, (select id from contacts) from account where id =: recordid];
        for(account ac : acclist)
        {
            list<contact> conlist = ac.contacts;
                ac.Number_Of_Contacts__c = conlist.size();
        }
        update acclist;
    }
}