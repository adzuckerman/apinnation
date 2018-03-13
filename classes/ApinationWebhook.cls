public class ApinationWebhook {

    // Creates a API Nation consumable JSON string from a SalesForce object
    public static String jsonContent(List<sObject> objects, String objectName, String username) {
        String objectsJson = '[';
        if (objects != null) {
            for (sObject instance : objects) {
                String content = JSON.serialize(instance);
                objectsJson += '{\"meta\": {\"object_name\":\"' + objectName + '\", \"id\": \"' + instance.get('Id') + '\", \"key\": \"' + username + '\"}, \"' + objectName + '\":' + content + '},';
            }
            objectsJson = objectsJson.substring(0, objectsJson.length() - 1);
        }
        objectsJson += ']';
        return objectsJson;
    }

    // Send SalesForce data to API Nation
    @future(callout=true)
    public static void callout(String url, String content) {
        Http h = new Http();

        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setHeader('Authorization', System.Label.Apination_API_Token);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(content);

        h.send(req);
    }

}
