/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class MaintenanceRequestHelper 
{
    public static void updateWorkOrders() 
    {
        // create the new list for casses
        List<case> newCaseList = new List<case>();
        Integer avgAmount=10000;
        // creating new equipment maintance item list to add items
        List<Equipment_Maintenance_Item__c> newEMI = new List<Equipment_Maintenance_Item__c>();
        // geting the list of cases records where ststus is closed and type maybe repair or routine maintenance
        List<case> caseList = [SELECT id,Vehicle__c,Subject,ProductID,Product__c, 
                               (SELECT id from Equipment_Maintenance_Items__r) 
                               from case where status='closed' and Type IN ('Repair', 'Routine Maintenance') and ID IN :Trigger.new LIMIT 200];
        
        Map<id,Equipment_Maintenance_Item__c> equip = new map<id,Equipment_Maintenance_Item__c>
                                                     ([Select ID, Equipment__c, Quantity__c,Equipment__r.id,Equipment__r.Maintenance_Cycle__c 
                                                       from Equipment_Maintenance_Item__c ]);
        
        for(case c: caseList){/* ittrating a the caselist and creating a new case when a case is closed and creating a new case with same type of 
                               closed case*/
            case newCase = new Case(); // creating a new case 
            newCase.Type = 'Routine Maintenance';
            newCase.Status = 'New';
            newCase.Vehicle__c = c.Vehicle__c;
            newCase.Subject =   'Routine Maintenance Request';
            newCase.Date_Reported__c = Date.today();
            newCase.ProductId = c.ProductId;
            newCase.Product__c = c.Product__c;
            newCase.parentID = c.Id;            
            // ittrating the Equipment_Maintenance_Item list by using the case 
            for(Equipment_Maintenance_Item__c emi : c.Equipment_Maintenance_Items__r )
            {
              // 
                avgAmount = Math.min(avgAmount,Integer.valueOf(equip.get(emi.id).Equipment__r.Maintenance_Cycle__c));
                // creating a new Equipment_Maintenance_Item__c record and adding to new list 
                newEMI.add(new Equipment_Maintenance_Item__c(
                    Equipment__c = equip.get(emi.id).Equipment__c,
                    Maintenance_Request__c = c.id,
                    Quantity__c = equip.get(emi.id).Quantity__c));
            }
            Date dueDate = date.TODAY().adddays(avgAmount);
            newCase.Date_Due__c =dueDate;
            newCaseList.add(newCase);// add a newly created case to caselist
        }
        
        
        if(newCaseList.size()>0){
            Database.insert(newCaseList);    
        }
         
        for(Case c2: newCaseList){
            for(Equipment_Maintenance_Item__c emi2 : newEmi){
                if(c2.parentID == emi2.Maintenance_Request__c){
                    emi2.Maintenance_Request__c = c2.id;    
                }
            }
        }
        
        if(newEmi.size()>0){
            Database.insert(newEmi);    
        }     
    }        
}