/*
  This generic test case can be used for any SalesForce object. 'Object' is used
  throughout this test case, please change 'Object' to the specific SalesForce object.
  I.E. ApinationObjectTriggerTestCase --> ApinationOpportunityTriggerTestCase
*/

@isTest
private class ApinationObjectTriggerTestCase {
    static @isTest void testCreateObjectTrigger() {
        Object object = new Object(Name = 'Test');
        insert object;

        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());
    }

    static @isTest void testUpdateObjectTrigger() {
        Object object = new Object(Name = 'Test');
        insert object;

        Object.Name = 'Updated Test';
        update Object;

        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());
    }
}
