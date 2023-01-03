/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-03-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AnimalLocator 
{
    public static string getAnimalNameById(Integer id)
    {
        Http h = new Http();
        // request
        Httprequest req = new Httprequest();
        //string endpoint = 'https://th-apex-http-callout.herokuapp.com/animals/'+id;
        //req.setEndpoint(endpoint);
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        req.setMethod('get');
        // response
        Httpresponse res = h.send(req);
        String strresp = '';// we need our values in the form of string 
        if(res.getStatusCode() == 200){
        // here the data will be in json format so we will extract the data using map 
        Map<string, object> results = (Map<string, object>)JSON.deserializeUntyped(res.getBody());
            // we are using again map because to rectify type casting error
        Map<string, object> animals = (Map<string, object>) results.get('animal');
        strresp = string.valueOf(Animals.get('name'));
        }
        return strresp;
        
    }
}