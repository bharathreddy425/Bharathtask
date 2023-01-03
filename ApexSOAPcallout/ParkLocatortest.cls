/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-03-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class ParkLocatorTest {
    @isTest sharing static void test() {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] parks = parkLocator.country('India');
       
    }
}