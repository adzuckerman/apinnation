trigger ApinationChargentOrderSyncTrigger on ChargentOrders__ChargentOrder__c (before insert, after update) {
    List<Id> orderIds = new List<Id>();

    for (ChargentOrders__ChargentOrder__c order: Trigger.new) {
        orderIds.add(order.Id);
    }


    if (!orderIds.isEmpty()) {
        ApinationChargentOrderSync.sync(orderIds);
    }
}
