global class EmailSenderSchedulable implements Schedulable{
    global void execute(SchedulableContext SC) {
        
        String soql = 'SELECT Id, CreatedDate FROM Offer__c WHERE CreatedDate = TODAY';
//        EmailSenderBatch batch = new EmailSenderBatch(soql);
//       Database.executebatch(batch);
        System.schedule('EmailSenderBatch', '0 59 23 * * ?', new EmailSenderSchedulable());
        
    }
}