trigger VehicleTrigger on Vehicle__c (before delete) {
    
    if(Trigger.isDelete) {
        
        VehicleTriggerHandler.createNewRecordOfDeletedVehicle(Trigger.Old);
    }
    
    
}