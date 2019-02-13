---
title: "Swish E Payment"
date: "2019-01-28"
weight: 110
menu: 
    main:
        parent: merchant-examples
        name: Swish E
---
# Create Payment

#### Requests
```json
{
    "amount": "500",
    "currency": "SEK",
    "return_url": "http://returnurl.com",
    "callback_url": "http://callbackurl.com",
    "method": "SWISH_E",
    "reference": "54321",
    "description": "Eshop checkout",
    "data": {
        "SWISH_E": {
      "payer_phone_number": "4670123456",
        }
    }
}
```
#### Response
```json
{
    "id": "10909",
    "created": "2013-06-28 09:21:38",
    "state": "CREATED",
    "reference": "54321",
    "description": "Eshop checkout",
    "amount": "500",
    "authorized_amount": "0",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "SWISH_E",
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
    "data": {
        "SWISH_E": {
      "payer_phone_number": "4670123456"
        }
    },
    "_links": {
        "self": {
            "href": "https://ctpsp/ws/2.0/payment/10909"
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
