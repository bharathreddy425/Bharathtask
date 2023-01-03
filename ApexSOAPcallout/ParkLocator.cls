/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-03-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class ParkLocator 
{
    public static string[] country (string country)
    {
        parkService.ParksImplPort parks = new parkService.ParksImplPort();
        String[] parksname = parks.byCountry(country);
        return parksname;
    }
}