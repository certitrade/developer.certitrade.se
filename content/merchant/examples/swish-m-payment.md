---
title: "Swish M Payment"
date: "2019-01-28"
weight: 120
menu: 
    main:
        parent: merchant-examples
        name: Swish M
---
# Create Payment

#### Request
```json
{
    "amount": "500",
    "currency": "SEK",
    "return_url": "http://returnurl.com",
    "callback_url": "http://callbackurl.com",
    "method": "SWISH_M",
    "reference": "54321",
    "description": "MApp purchase"
}
```
#### Response
```json
{
    "id": "10909",
    "created": "2013-06-28 09:21:38",
    "state": "PENDING",
    "reference": "54321",
    "description": "MApp purchase",
    "amount": "500",
    "authorized_amount": "0",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "SWISH_M",
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
            "created": "2013-06-28 09:21:38",
            "result": "0",
            "method": "SWISH_M",
            "data": {
                "SWISH_M": {
                    "desc": "WAITING_FOR_SWISH_RESULT",
                    "swish_payment_reference": "",
"swish_payment_request_token" : "EjE7pT1HQC6oEkIlu25kr…",
                    "swish_error_code": "",
                    "swish_error_message": "",
                    "swish_additional_information": "",
                    "swish_status": "",
                    "swish_date_created": "",
                    "swish_date_paid": "",
                }
            }
        }
    ],
    "data": {
        "SWISH_M": {
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
