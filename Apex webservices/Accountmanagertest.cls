/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-03-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@IsTest
private class AccountManagerTest {
    @isTest static void testAccountManager() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://gmailcomlearner-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+ recordId +'/Contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account acc = AccountManager.getAccount();
        // Verify results
        System.assert(acc != null);
        
    }
    // Helper method
   private static Id createTestRecord() {
        // Create test record
        Account AccTest = new Account(
            Name='Test Name');
        insert AccTest;
       
        Contact conTest = new Contact(
            
            LastName='Test lastName',
            AccountId = AccTest.Id);
        insert conTest;
       
        return AccTest.Id;
    }          
}