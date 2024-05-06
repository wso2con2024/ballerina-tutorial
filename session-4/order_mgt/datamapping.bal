function transformOrder(OrderWithRelations ord, GetOrderedItemWithRelations[] items) returns OrderResponse => let var prices = (from GetOrderedItemWithRelations item in items
        let decimal value = <decimal>item.quantity * item.item.unit_price
        select value), var total = decimal:sum(...prices).round(2)
    in {
        id: ord.orderID,
        customer: {
            id: ord.customer.customerID,
            name: ord.customer.firstName + " " + ord.customer.lastName,
            email: ord.customer.email,
            loyalty: ord.customer.premiumCustomer ? "Premium" : "Regular",
            optedInNewsLetter: ord.customer.optInEmail
        },
        items: from var itemsItem in items
            select {
                id: itemsItem.item.itemId,
                name: itemsItem.item.name,
                quantity: itemsItem.quantity,
                price: itemsItem.item.unit_price + <decimal>itemsItem.quantity
            },
        total: total
    };
