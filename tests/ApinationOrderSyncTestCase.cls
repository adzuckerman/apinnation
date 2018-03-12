@isTest
private class ApinationOrderSyncTestCase {
    static @isTest void testSync() {
        Account account = new Account(Name = 'TestAccount');
        insert account;

        Order order = new Order(AccountId = account.Id, EffectiveDate = date.today(), Status = 'test');
        insert order;

        List<Id> orderIds = new List<Id>();
        orderIds.add(order.Id);
        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());
        ApinationOrderSync.sync(orderIds);

    }

}
