/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-06-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class WarehouseCalloutService implements Queueable {
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    @future(callout=true)
    public static void runWarehouseEquipmentSync(){
        Http http = new Http();
        // creating a request to get data
        HttpRequest request = new HttpRequest();  
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        // creating the response to get data from the request url where we given as endpoint
        HttpResponse response = http.send(request);
        
        List<Product2> warehouselist = new List<Product2>();// creating a new product list
        
        if (response.getStatusCode() == 200){
            // here the data we get will be in the form of json so we store it in object
            // again we use list<object> after equal to is to avoid the typecast error which wont allow to save the file 
            List<Object> jsonResponse = (List<Object>)JSON.deserializeUntyped(response.getBody());
            
            for (Object eq : jsonResponse){// ittrating the response records and creating the new product records
                Map<String,Object> mapJson = (Map<String,Object>)eq;
                Product2 myEqlist = new Product2();
                myEqlist.Replacement_Part__c = (Boolean) mapJson.get('replacement');
                myEqlist.Name = (String) mapJson.get('name');
                myEqlist.Maintenance_Cycle__c = (Integer) mapJson.get('maintenanceperiod');
                myEqlist.Lifespan_Months__c = (Integer) mapJson.get('lifespan');
                myEqlist.Cost__c = (Integer) mapJson.get('cost');
                myEqlist.Warehouse_SKU__c = (String) mapJson.get('sku');
                myEqlist.Current_Inventory__c = (Double) mapJson.get('quantity');
                myEqlist.ProductCode = (String) mapJson.get('_id');
                warehouselist.add(myEqlist);
            }
            
            if (warehouselist.size() > 0)
            {
                upsert warehouselist;
            }
        }
    }
    public static void execute (QueueableContext context){
        runWarehouseEquipmentSync();
    }
    
}