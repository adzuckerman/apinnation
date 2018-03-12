@isTest(seeAlldata=true)
private class ApinationWebhookTestCase {
    static @isTest void testJsonContent() {
        List<sObject> orders = [select Id from Order limit 2];
        string userName = 'apps@apination.com';
        string objectName = 'order';
        string content = ApinationWebhook.jsonContent(orders, objectName, userName);
        System.assert(content != null);
    }
}
