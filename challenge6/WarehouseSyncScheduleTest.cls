/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
public class WarehouseSyncScheduleTest {  
    public static String CRON_EXP = '0 0 1 * * ?';
    
    @isTest
    static void testExecute(){
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        
        Test.startTest();
        String jobId = System.schedule('WarehouseSyncScheduleTest', CRON_EXP, new WarehouseSyncSchedule());
        Test.stopTest();
        
        System.assertEquals(1, [SELECT count() FROM CronTrigger WHERE CronJobDetail.Name = 'WarehouseSyncScheduleTest']);
    }

}