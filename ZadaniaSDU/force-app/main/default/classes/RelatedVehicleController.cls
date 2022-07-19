/*public with sharing class RelatedVehicleController {
    @AuraEnabled (cacheable=true)
    public static List<Showroom__c> getRelatedVehicles(String  showroomId){
        
       return [
            SELECT Id, Brand, Model
            FROM Vehicle_Showroom__c
            WHERE Account__c = :showroomId
            ORDER BY Brand
            ];
    }
}
*/