global class ApinationOrderSync {
    webservice static Void sync(List<Id> orderIds) {
        String url = 'https://webapp-stg.apination.com/api/connectors/apps/cn_sf/save_object/';
        String username = 'apps@apination.com';


        List<Order> orders = [SELECT Id, OrderNumber, Owner.Name, account.Phone, account.BillingStreet, account.BillingCity, account.ShippingStreet, account.ShippingCity, account.Fax, account.ShippingState, account.ShippingPostalCode, account.BillingState, account.BillingPostalCode, account.id, account.QB_ID__c, account.name, account.Description, EffectiveDate, Payment_Type__c, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, (SELECT Quantity, UnitPrice, Description, PricebookEntry.Product2.QB_ID__c FROM OrderItems) FROM Order WHERE Id in:orderIds];


        String objectName = 'order';
        String content = ApinationWebhook.jsonContent(orders, objectName, username);

        ApinationWebhook.callout(url, content);
    }

}
