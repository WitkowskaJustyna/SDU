/**
     * @author name <justyna.witkowska@accenture.com>
     * @date 04/07/2022
     * @ method check if is more than one physical offer for vehicle    
	*@history {ticket reference}, {date}, name <name@accenture.com>, {purpose}??
     **/

public class OfferTriggerHandler {
    
    public static void checkIsMoreThanOnePhysicalOfferForVehicle (List<Offer__c> newOffers ) {
        
        Set <Offer__c> duplicatesNewPhysicalOffers = checkIfIsMoreThanonePhysicalOfferPerVehicleInNewOffers(newOffers); 
        
        if(duplicatesNewPhysicalOffers.size() > 0) {
            
           // duplicatesNewPhysicalOffers.addError('There is more than one physical offer for the vehicle' + duplicatesNewPhysicalOffers );
        
        } else {        
                  
        List<Offer__c> oldOffers = [SELECT id, Vehicle__c, Showroom__r.Showroom_Name__c, Type_of_offer__c FROM Offer__c WHERE Type_of_offer__c ='physical']; 
        
        for (Offer__c newOffer : newOffers) { 
            
            for(Offer__c oldOffer : oldOffers ) { 
            
            	if(newOffer.Vehicle__c == oldOffer.Vehicle__c && newOffer.Type_of_offer__c == 'physical' )
            
					newOffer.addError('Vehicle can have only one physical offer. Vehicle is aviable in showroom ' + oldOffer.Showroom__r.Showroom_Name__c);            
            } 
        }
                
        }
    }
    
    public static Set<Offer__c> checkIfIsMoreThanonePhysicalOfferPerVehicleInNewOffers(List<Offer__c> newOffers) {
        
        Set<Id>vehicleIdsWithphysicalNewOffer = new Set<Id>();
        Set<Offer__c> duplicates = new Set<Offer__c>();
        
        for (Offer__c newOffer : newOffers) {
            
         if(newOffer.Type_of_offer__c == 'physical' && !(vehicleIdsWithphysicalNewOffer.add(newOffer.Vehicle__c)))
               duplicates.add(newOffer);    
    	}
        
        return duplicates;
    }

   
}