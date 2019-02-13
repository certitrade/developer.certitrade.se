---
title: "One Click Payment"
date: "2019-01-28"
weight: 20
menu: 
    main:
        parent: merchant-examples
        name: One Click
---
First a `CARD` payment is created and made as described in [Card Payment](../card-payment).

A payment_account is then created that we link to the payment.

#### Request
```http
POST /payment_account HTTP/1.1

{
   "type": "ONE_CLICK",
   "payment": "11112"
}
```

#### Response
```http
HTTP/1.1 201 Created
Content-Type: application/hal+json

{
    "id": "40260868824",
    "created": "2/22/2015 3:16:33 PM",
    "state": "ACTIVE",
    "merchant": "12345",
    "type": "ONE_CLICK",
    "expiry_date": "04/20",
    "masked_cardno": "xxxxxxxxxxxx2300",
    "bin": "123456",
    "_links": {
        "self": {
            "href": "https://ctpsp/ws/2.0/payment_account/40260868824"
        },
        "merchant": {
            "href": "https://ctpsp/ws/2.0/merchant/12345"
        }
    },
    "_embedded": [],
}
```
Now this payment_account can be used to create ONE_CLICK payments.

#### Request
```http
POST payment HTTP/1.1

{
    "amount": "1234",
    "currency": "SEK",
    "method": "ONE_CLICK",
    "reference": "54321",

"data" : {

        "ONE_CLICK" : {
            "payment_account": "40260868824"
        }
    }
}
```

#### Response
```http
HTTP/1.1 201 Created
Content-Type: application/hal+json

{
    "id": "11113",
    "created": "2/22/2015 3:16:33 PM",
    "state": "READY_FOR_CAPTURE",
    "reference": "54321",
    "description": "",
    "amount": "1234",
    "authorized_amount": "1234",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "ONE_CLICK",

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
            "created": "2/22/2015 3:16:33 PM",
            "result": "1",
            "method": "ONE_CLICK",
            "data": {
                "ONE_CLICK": {
                    "desc": "ONE_CLICK_AUTH",
                    "authcode": "123456",
                    "respcode": "00",
                    "masked_cardno": "xxxxxxxxxxx2300",
                    "bin": "123456",
                    "cardholder_name": ""
                }
            }
        }
    ],

"data" : {

        "ONE_CLICK" : {
            "payment_account": "40260868824",
        }
    },
    "_links": {
        "self": {
            "href": "https://ctpsp/ws/2.0/payment/11113"
        },
        "merchant": {
            "href": "https://ctpsp/ws/2.0/merchant/12345"
        },
        "payment_account": {
            "href": "https://ctpsp/ws/2.0/payment_account/40260868824"
        },
    },
    "_embedded": [],
}
```

Such a payment has no link to a payment window since none is required.

The payment state shows that authorization has been given. There is also a payment attempt with a successful result.
