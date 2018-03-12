{!REQUIRESCRIPT("/soap/ajax/26.0/connection.js")}
{!REQUIRESCRIPT("/soap/ajax/26.0/apex.js")}

sforce.apex.execute('ApinationOrderSync', 'sync', {orderIds: ['{!Order.Id}']});
alert('Successful Synced');
