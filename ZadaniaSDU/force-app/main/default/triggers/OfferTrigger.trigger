trigger OfferTrigger on Offer__c (before insert, after insert) {
    
    if(Trigger.isBefore && Trigger.isInsert) {
        OfferTriggerHandler.checkIsMoreThanOnePhysicalOfferForVehicle(Trigger.New);
        
    }
    //MLR: remove part that you're not using
    
    if(Trigger.isAfter && Trigger.isInsert) {
       // OfferTriggerHandler.sendEmailAboutNewOffers(Trigger.New);
        
    // trigger getId on Offer__c (after insert){// Use your custom object name in place of Account
   // Set<Id> allInsertedIds = trigger.newMap.keySet();
}
    }