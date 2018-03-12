{!REQUIRESCRIPT("/soap/ajax/26.0/connection.js")}
{!REQUIRESCRIPT("/soap/ajax/26.0/apex.js")}

sforce.apex.execute('ApinationChargentOrderSync', 'sync', {orderIds: ['{!ChargentOrders__ChargentOrder__c.Id}']});
alert('Successful Synced');
