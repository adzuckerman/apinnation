@isTest
private class ApinationOrderBatchTriggerTestCase {
    static @isTest void testCreateOrderTrigger() {
        Account account = new Account(Name = 'TestAccount');
        insert account;

        Order order = new Order(AccountId = account.Id, EffectiveDate = date.today(), Status = 'test',
				Paid_in_Full__c = true, Payment_Method__c = 'ACH');
        insert order;
        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());

    }

    static @isTest void testUpdateOrderTrigger() {
        Account account = new Account(Name = 'TestAccount');
        insert account;

        Order order = new Order(AccountId = account.Id, EffectiveDate = date.today(), Status = 'test');
        insert order;

        order.Paid_in_Full__c = true;
        order.Payment_Method__c = 'ACH';
        update order;

        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());

    }

}
