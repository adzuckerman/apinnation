/*
  Test for ApinationWebhook.cls
*/

@isTest(seeAlldata=true)
private class ApinationWebhookTestCase {
    static @isTest void testJsonContent() {
        // Replace object with a SalesForce object.
        List<sObject> object = [select Id from Object limit 2];

        // Replace username with SalesForce username linked to API Nation.
        string username = '';

        // Replace objectName with a valid test object i.e. 'opportunity'.
        string objectName = '';

        string content = ApinationWebhook.jsonContent(object, objectName, username);
        System.assert(content != null);
    }
}
