public with sharing class AccountController {
    public String accountId{get;set;}
    public Account actObj{get;set;}
    public AccountController(){
        actObj = new Account();
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Name
            FROM Account
            ORDER BY Name
        ];
    }
   

}