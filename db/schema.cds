
using { managed } from '@sap/cds/common';

namespace sales;

entity SalesOrderHeaders: managed {
  key id: UUID;
    customer: Association to Customers;
    totalAmount: Decimal(15,2);
    items: Composition of many SalesOrderItems on items.header = $self;
}

entity SalesOrderItems: managed {
  key id: UUID;
    header: Association to SalesOrderHeaders;
    product: Association to Products;
    quantity: Integer;
    price: Decimal(15,2);
}

entity Customers:managed {
  key id: UUID;
    firstname: String(20);
    lastname: String(20);
    email: String(255);
   
}

entity Products: managed {
  key id: UUID;
    name: String(255);
    price: Decimal(15,2);
}