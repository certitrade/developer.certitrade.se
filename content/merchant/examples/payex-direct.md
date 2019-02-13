---
title: "PayEx Direct Payment"
date: "2019-01-28"
weight: 60
menu: 
    main:
        parent: merchant-examples
        name: PayEx Direct
---

# Create Payment

To create a PayEx direct payment you also need to include the bank to which the payment is to be made. A direct payment to Svenska Handelsbanken (SHB) is shown below.

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
    "method": "DIRECT_PAYEX",
    "reference": "54321",
    "language": "sv",

"data" : {

        "DIRECT_PAYEX" : {
            "bank": "SHB"
        }
    }
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
    "method": "DIRECT_PAYEX",
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
        "DIRECT_PAYEX" : {
            "bank": "SHB"
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
