public class EmailSenderBatch implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext bc) {
        
        return Database.getQueryLocator('SELECT Id, CreatedDate FROM Offer__c WHERE CreatedDate = TODAY');  
         
    }
    public void execute(Database.BatchableContext bc, List<Offer__c> newOffers){ 
        
        try{
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {'justyna.witkowska@accenture.com'}); 
            mail.setReplyTo('justyna.witkowska@accenture.com');
            mail.setSenderDisplayName('New Offers');
            mail.setSubject('Check new offers');
            mail.setPlainTextBody('Check new offers');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
        } catch (Exception e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        
    }
    public void finish(Database.BatchableContext bc){
        System.debug('Email has been sent');
        
    }
}