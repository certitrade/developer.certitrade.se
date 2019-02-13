---
title: "Refund"
date: "2019-01-28"
weight: 80
menu: 
    main:
        parent: merchant-examples
        identifier: refund-example
---
# Create Refund

Let’s assume that we want to refund 10.00 SEK from payment 11114. We then create a new refund resource with the above amount as argument. The currency is automatically the same as that in which the payment was made.

#### Request
```http
POST /payment/11114/refund HTTP/1.1
{
    "amount": "1000"
}
```
#### Response
```http
HTTP/1.1 201 Created   
Content-Type: application/hal+json

{
    "id": "1",
    "created": "2013-06-28 12:44:15 PM",
    "amount": "1000",
    "state": "PENDING",
    "_links": {
        "self": {
            "href": "https://ctpsp/ws/2.0/payment/11114/refund/1"
        },
        "payment": {
            "href": "https://ctpsp/ws/2.0/payment/11114"
        }
    },
    "_embedded": [],
}
```
