/*
  Receives a list of Object Id's from a trigger, then selects fields from that
  object via a SOQL query, and sends that information as JSON to Apination

  This generic class can be used for any SalesForce object. 'Object' is used
  throughout this class, please change 'Object' to the specific SalesForce object.
  I.E. ApinationObjectSync --> ApinationOpportunitySync
*/

global class ApinationObjectSync {
    webservice static Void sync(List<Id> objectIds) {
        String apinationURL = System.Label.Apination_API_URL;

        String username =  System.Label.Apination_Username;

        // Query for object fields that the user want's to send to API Nation
        List<Object> object = [SELECT Id, Name, Etc from Object WHERE Id in:objectIds];

        // Replace this string with the object's name in lowercase (i.e. 'opportunity')
        String objectName = '';

        // Build a JSON object that is consumable by API Nation
        String content = ApinationWebhook.jsonContent(opportunities, objectName, username);

        // Send data to API Nation
        ApinationWebhook.callout(apinationURL, content);
    }
}
