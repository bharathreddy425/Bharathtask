/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
v@isTest
private class WarehouseCalloutServiceTest {   
    @isTest  
    static void testWareHouseCallout(){
        Test.startTest();
        // implement mock callout test here
        Test.setMock(HTTPCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();
        System.assertEquals(1,[SELECT count() FROM Product2]);
    }     
}