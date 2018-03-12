global class ApinationChargentOrderSync {
    webservice static Void sync(List<Id> orderIds) {
        String url = 'https://my.apination.com/api/connectors/apps/cn_sf/save_object/';
        String username = 'steven.gim@strategicdentistry.com';

        List<ChargentOrders__ChargentOrder__c> orders = [SELECT Id, Opportunity__r.PriceBook2.Name, ChargentOrders__Account__r.LastName, ChargentOrders__Account__r.MiddleName, ChargentOrders__Account__r.FirstName, ChargentOrders__Payment_Method__c, ChargentOrders__Payment_Start_Date__c, ChargentOrders__Payment_Status__c, ChargentOrders__PO_Number__c, ChargentOrders__Total__c from ChargentOrders__ChargentOrder__c WHERE Id in:orderIds];


        String objectName = 'chargentorder';
        String content = ApinationWebhook.jsonContent(orders, objectName, username);

        ApinationWebhook.callout(url, content);
    }
}
