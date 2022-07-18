public with sharing class ShowroomController {
    @AuraEnabled (cacheable=true)
    public static List<Showroom__c> getShowroom(String  accountId){
        return [
            SELECT Showroom_Name__c, Id
            FROM Showroom__c
            WHERE Account__c = :account.Id
            ORDER BY Showroom_Name__c
            ];
    }
}
