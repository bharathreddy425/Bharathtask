/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger MaintenanceRequest on Case (before update, after update) {
    // ToDo: Call MaintenanceRequestHelper.updateWorkOrders
      if(trigger.isAfter){
        MaintenanceRequestHelper.updateWorkOrders();    
    }
}