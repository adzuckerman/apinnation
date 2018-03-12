@isTest
private class ApinationChargentOrderTriggerTestCase {
    static @isTest void testCreateChargentOrderTrigger() {
        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());
        RecordType RT =  new RecordType();
        RT = [Select ID, Name from RecordType where Name  = 'Business Account'];
        
        Account A = new Account();
        A.Name = 'Test';
        A.RecordTypeID = RT.ID;
        insert A;
        
        Opportunity opportunity = new Opportunity(CloseDate = date.today(), Name = 'TestOpportunity', 
                AccountID = A.ID, StageName = 'Needs Analysis', Terms__c='DUR', Rep__c='CTRACEY', Class_Field__c='MDSS',Customer_Email__c = 'test@mail.com');
        insert opportunity;
        
        ChargentOrders__ChargentOrder__c order = new ChargentOrders__ChargentOrder__c(Opportunity__c = opportunity.id, ChargentOrders__Account__r = A);
        insert order;
    }
    
    static @isTest void testUpdateChargentOrderTrigger() {
        if (test.isRunningTest()) Test.setMock(HttpCalloutMock.class, new ApinationWebhookMock());
        RecordType RT =  new RecordType();
        RT = [Select ID, Name from RecordType where Name  = 'Business Account'];
        
        Account A = new Account();
        A.Name = 'Test';
        A.RecordTypeID = RT.ID;
        insert A;
        
        Opportunity opportunity = new Opportunity(CloseDate = date.today(), Name = 'TestOpportunity', 
                AccountID = A.ID, StageName = 'Needs Analysis', Terms__c='DUR', Rep__c='CTRACEY', Class_Field__c='MDSS',Customer_Email__c = 'test@mail.com');
        insert opportunity;
        
        ChargentOrders__ChargentOrder__c order = new ChargentOrders__ChargentOrder__c(Opportunity__c = opportunity.id, ChargentOrders__Account__r = A);
        insert order;
        
        order.ChargentOrders__Status__c = 'Complete';
        update order;
    }
}
