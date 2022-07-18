public class TestDataFactory {
   
    public static Vehicle__c getVehicle (String serialNumber){
        
        Vehicle__c vehicle = new Vehicle__c (Serial_number__c = serialNumber, Brand__c = 'BMW', Model__c = 'E46', Power__c = 100, Type_of_vehicle__c = 'sport', 
                                             Condition__c = 'new', Fuel_consumption__c = 5, Load_capacity__c = 750);  
        return vehicle;
    }
    
    public static Account getAccount() {
        
        Account account = new Account (Name = 'Test'); 
        return account;
    }
    
    public static Showroom__c getShowroom(Account account, String showroomName){
        
        Showroom__c showroom = new Showroom__c(Type__c = 'personal cars', Account__c = account.Id, Showroom_Name__c = showroomName);
        return showroom;
    }
    
    public static Offer__c getOffer(Showroom__c showroom, Vehicle__c vehicle, String typeOfOffer){
        
        Offer__c offer= new Offer__c (Showroom__c = showroom.Id, Vehicle__c = vehicle.Id, Type_of_offer__c = typeOfOffer);
        
        return offer;
        
    }
    
    public static Telemetry__c getTelemetry(Vehicle__c vehicle){
        
        Telemetry__c telemetry = new Telemetry__c (Vehicle__c = vehicle.Id, Component__c = 'brake disc', Value__c = 120 );
        
        return telemetry;
    }
    
    public static User getStandartUser(String email, String username){
        
         Profile profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        
        User user = new User(LastName = 'LIVESTON',
                           FirstName='JASON',
                           Alias = 'jliv',
                           Email = email,
                           Username = username,
                           ProfileId = profileId.id,
                           TimeZoneSidKey = 'GMT',
                           LanguageLocaleKey = 'en_US',
                           EmailEncodingKey = 'UTF-8',
                           LocaleSidKey = 'en_US'
                           );
        return user;
    }
     public static Case getRenovationCase(Showroom__c showroom){
        
        Case newCase =  new Case(Subject=('Renovation Case' + showroom.Showroom_Name__c), Showroom__c = showroom.Id);
        
        return newCase;
    }
    public static Showroom__c getShowroomWithStatus(Account account, String showroomName, String status){
        
        Showroom__c showroom = new  Showroom__c (Type__c = 'personal cars', Account__c = account.Id, Showroom_Name__c = showroomName, Status__c = status);
        return showroom;
        
    } 
    
         
 }