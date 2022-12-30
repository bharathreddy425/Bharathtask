/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-30-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public sharing class DailyLeadProcessor implements schedulable{
    
    public void execute(schedulableContext sc) {
        List<lead> lelist = new List<lead>();
        List<lead> leadlst = new List<lead>([select id, leadsource from lead where leadsource = null]);
        for(lead le : leadlst) {
            le.leadsource = 'Dreamforce';
            lelist.add(le);
        }
        update lelist;
    }

}