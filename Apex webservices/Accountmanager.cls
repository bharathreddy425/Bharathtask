/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-03-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping ='/Accounts/*/contacts')
//make sure while creating webservice and make your class global then we can acces out side of system
global with sharing class AccountManager 
{
    @Httpget
    // make sure to the static to acces out side
    global static Account getAccount()
    {
        RestRequest req = RestContext.request;

        String accId = req.requestURI.substringBetween('Accounts/','/contacts');
       Account Acc =  [SELECT Id, Name, (select Id, Name,AccountId from contacts) from Account where Id =: accId];                 
        return Acc;
    }
}