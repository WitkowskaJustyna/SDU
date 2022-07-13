trigger ShowromTrigger on Showroom__c (after update) {
    
    if(Trigger.isUpdate) {
        
 //       ShowroomTriggerHandler.createListOfCases(trigger.newMap, trigger.oldMap);
    }
        

}