/**
     * @author name <justyna.witkowska@accenture.com>
     * @date 30/06/2022
     * @description The method is preparing new record in custom object (Deleted_Vehicle__c), when record of custom object Vehicle__c is deleted.  
	*@history {ticket reference}, {date}, name <name@accenture.com>, {purpose}??
     **/

public class VehicleTriggerHandler {
    
    public static void createNewRecordOfDeletedVehicle(List<Vehicle__c> vehicleList) {
        
        List<DeletedVehicle__c> deletedVehicleList = new List<DeletedVehicle__c>();
        
        for(Vehicle__c vehicle: vehicleList){
            
        deletedVehicleList.add(new DeletedVehicle__c(Subject__c = 'Deleted vehicle', Serial_Number__c = vehicle.Serial_Number__c  ));
        }
        
        if (deletedVehicleList.size() > 0) {
        insert deletedVehicleList;
    	}
    }
     
	     
    }
        
	
  //  private static void checkDuplicate (List<Offer__c> listOfPhysicalOffers) {
        
 //   	
 //       listOfPhysicalOffers.stream().filter(o -> Collections.frequency(listOfPhysicalOffers, o) > 1)
 //               			.collect(Collectors.toSet())