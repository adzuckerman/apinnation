global class ApinationOpportunitySync {
    webservice static Void sync(List<Id> opportunityIds) {
        String url = 'https://my.apination.com/api/connectors/apps/cn_sf/save_object/';
        String username = 'steven.gim@strategicdentistry.com';

        List<Opportunity> opportunities = [SELECT Id, StageName, D_Mber_Cancel__c, D_Mber_Start__c, RecordType.Name, D_Renewal__c,
        PriceBook2.Name, Account.Name, Account.FirstName, Account.LastName, Account.MiddleName, Account.BillingStreet, Account.BillingState, Account.BillingCity, Account.BillingPostalCode,
        Account.BillingCountry, Account.ShippingState, Account.ShippingStreet, Account.ShippingPostalCode, Account.ShippingCity,
        Account.QBID_DOCS__c, Account.QBID_MDSS__c, Account.QBID_KC__c, Account.ShippingCountry, CloseDate, (select Product2.Id,
        Quantity, Product2.QBID_DOCS__c, Product2.QBID_KC__c, Product2.QBID_MDSS__c, Product2.Account__c, Product2.Name, ServiceDate,
        TotalPrice from OpportunityLineItems), Class_Field__c, P_O_Number__c, Terms__c, Rep__c, IsWon, IsClosed from Opportunity WHERE Id in:opportunityIds];


        String objectName = 'opportunity';
        String content = ApinationWebhook.jsonContent(opportunities, objectName, username);

        ApinationWebhook.callout(url, content);
    }

}
