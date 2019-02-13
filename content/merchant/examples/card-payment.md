---
title: "Card Payment"
date: "2019-01-28"
weight: 10
menu: 
    main:
        parent: merchant-examples
        name: Card Payment
---

# Create Payment

To create a payment resource a POST is made to the collection payment.

#### Request
```http
POST payment HTTP/1.1
Authorization: CertiTrade m12345:f3dcba298804
Date: Mon, 12 Nov 2013 14:52:37 GMT
Content-Type: application/json

{
    "amount": "1234",
    "currency": "SEK",
    "return_url": "http://returnurl.com",
    "callback_url": "http://callbackurl.com",
    "method": "CARD",
    "reference": "54321",
    "language": "sv"
}
```

#### Response
```http
HTTP/1.1 201 Created
Content-Type: application/hal+json

{
    "id": "11112",
    "created": "2013-06-28 09:21:38",
    "state": "CREATED",
    "reference": "54321",
    "description": "",
    "amount": "1234",
    "authorized_amount": "0",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "CARD",

"customer" : {

        "security_number": "",
        "name": "",
        "company_name": "",
        "address1": "",
        "address2": "",
        "address3": "",
        "zip_code": "",
        "city": "",
        "region": "",
        "country": "",
        "email": "",
        "phone": ""
    },
    "products": [],
    "payment_attempts": [],

"data" : {

        "CARD" : {

        }
    },
    "_links": {
        "self": {
            "href": "https://ctpsp/ws/2.0/payment/11112"
        },
        "merchant": {
            "href": "https://ctpsp/ws/2.0/merchant/12345"
        },
        "paywin": {
            "href": "https://ctpsp/paywin/cc66c3217cc47aedf6ef1979038de79f"
        }
    },
    "_embedded": [],
}
```
The customer is then forwarded using the paywin link, which is retrieved from `_links`.

# Aprove for Capture

Approving a card payment (CARD / RECURRING) means that it will be forwarded for capture during the coming night. To do this, we reset the state to `READY_FOR_CAPTURE`.

If the operation can be carried out, the status code is 200. The new state is also reflected in the payment representation that is returned.

#### Request
```http
PUT payment/11114 HTTP/1.1

{
    "state": "READY_FOR_CAPTURE"
}
```
#### Response
```http
HTTP/1.1 200 OK
Content-Type: application/hal+json

{
    "id": "11114",
    "created": "6/24/2013 4:43:43 PM",
    "state": "READY_FOR_CAPTURE",
    "reference": "54321",
    "description": "",
    "amount": "1234",
    "authorized_amount": "1234",
    "currency": "SEK",
    "merchant": "12345",
    "language": "sv",
    "method": "CARD",
"customer" : {
        "security_number": "",
        "name": "",
        "company_name": "",
        "address1": "",
        "address2": "",
        "address3": "",
        "zip_code": "",
        "city": "",
        "region": "",
        "country": "",
        "email": "",
        "phone": ""
    },
    "products": [],
    "payment_attempts": [
        {
            "created": "6/24/2013 4:43:51 PM",
            "result": "1",
            "method": "CARD",
            "data": {
                "CARD": {
                    "desc": "SSL_AUTH",
                    "authcode": "688407",
                    "respcode": "00",
                    "masked_cardno": "xxxxxxxxxxx2300",
                    "bin": "123456",
                    "cardholder_name": ""
                }
            }
        }
    ],
"data" : {
        "CARD" : {
        }
    },
    "_links": {
        "self": {
            "href": "https://ctpsp/ws/2.0/payment/11114"
        },
        "merchant": {
            "href": "https://ctpsp/ws/2.0/merchant/12345"
        },
        "paywin": {
            "href": "https://ctpsp/paywin/481986da07b6a2a2ebea3dbf303f6263"
        }
    },
    "_embedded": [],
}
```
