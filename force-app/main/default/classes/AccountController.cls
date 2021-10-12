public with sharing class AccountController {
  
  public static List<Account> getAllActiveAccounts() {
    try {
      List<Account> accounts;
      if(Account.getSObjectType().getDescribe().isAccessible()){
        accounts = [SELECT Id,Name,Active__c FROM Account WHERE Active__c = 'Yes' WITH SECURITY_ENFORCED];
      }
      return accounts;
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }

}