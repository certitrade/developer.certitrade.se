---
title: "Recurring Payment"
date: "2019-01-28"
weight: 40
menu: 
    main:
        parent: merchant-examples
        name: Recurring
---

# Initialize Account

First you create a `payment_account`.

##### Request
```http
POST /payment_account HTTP/1.1

{
   "type": "RECURRING"
}
```
#### Response
```http
HTTP/1.1 201 Created
Content-Type: application/hal+json

{
    "id": "40260868824",
    "created": "2013-06-28 11:32:53 AM",
    "state": "UNINITIALIZED",
    "merchant": "12345",
    "type": "RECURRING",
    "expiry_date": "",
    "masked_cardno": "",
    "bin": "",
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

Then you create a payment to initialize it.

#### Request
```http
POST /  payment HTTP/1.1
Authorization: CertiTrade m12345:f3dcba298804

{
    "amount": "1234",
    "currency": "SEK",
    "return_url": "http://returnurl.com",
    "callback_url": "http://callbackurl.com",
    "method": "RECURRING",
    "reference": "54321",
    "language": "sv",
    "data" : {
        "RECURRING" : {
            "initialize": "1",
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
    "method": "RECURRING",
    "payment_account": "40260868824",

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

        "RECURRING" : {

"initialize" : "1",

            "payment_account": "40260868824",
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
        },
        "payment_account": {
            "href": "https://ctpsp/ws/2.0/payment_account/40260868824"
        }
    },
    "_embedded": [],
}
```

The customer is then forwarded using the paywin link, which is retrieved from `_links`. If the payment is successful, the `payment_account` linked to the payment can be used to make `RECURRING` payments.

# `RECURRING` and closed `payment_account`

In the event of attempted fraud a payment_account that was previously valid may be suspended. In such cases a new initializing payment must be made before further RECURRING payments can be made from the payment_account.

Let’s assume that the payment_account has been initialized and make a RECURRING payment that will be marked as fraud:

#### Request
```http
POST payment HTTP/1.1

{
    "amount": "1234",
    "currency": "SEK",
    "method": "RECURRING",
    "reference": "54321",
"data" : {
        "RECURRING" : {
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
    "created": "2013-06-28 12:27:12 PM",
    "state": "FAILED",
    "reference": "54321",
    "description": "",
    "amount": "1234",
    "authorized_amount": "0",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "RECURRING",
    "payment_account": "40260868824",
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
            "created": "2013-06-28 12:27:13 PM",
            "result": "0",
            "method": "RECURRING",
            "data": {
                "RECURRING": {
                    "desc": "ACCOUNT_TERMINATED",
                    "authcode": "",
                    "respcode": "43",
                    "masked_cardno": "xxxxxxxxxxx0002",
                    "bin": "123456",
                    "cardholder_name": ""
                }
            }
        }
    ],
"data" : {
        "RECURRING" : {
"initialize" : "0",
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

The payment has failed and the description of the payment attempt is `ACCOUNT_TERMINATED`, showing that the payment_account used has been closed due to fraud.

When we retrieve the payment_account in question below, we see that it has been suspended:

#### Request
```http
GET payment_account/40260868824 HTTP/1.1

```
#### Response
```http
HTTP/1.1 200 OK
Content-Type: application/hal+json

{
    "id": "40260868824",
    "created": "5/21/2013 2:12:12 PM",
    "state": "SUSPENDED",
    "merchant": "12345",
    "type": "RECURRING",
    "expiry_date": "02/17",
    "masked_cardno": " xxxxxxxxxxx0002",
    "bin": "112345",
    "_links": {
        "self": {
            "href": "https://ctpsp/ws/2.0/payment_account/40260868824"
        },
        "merchant": {
            "href": "https://ctpsp/ws/2.0/merchant/12345"
        },
    },
    "_embedded": [],
}
```

To continue making `RECURRING` payments using the above `payment_account` a new initializing payment must be made using it.


# Create Payment

Let’s assume the `payment_account` has been initialized. A payment is then created directly.

#### Request
```http
POST payment HTTP/1.1

{
    "amount": "1234",
    "currency": "SEK",
    "method": "RECURRING",
    "reference": "54321",

"data" : {

        "RECURRING" : {
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
    "created": "2013-06-28 12:27:12 PM",
    "state": "READY_FOR_CAPTURE",
    "reference": "54321",
    "description": "",
    "amount": "1234",
    "authorized_amount": "1234",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "RECURRING",
    "payment_account": "40260868824",

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
            "created": "2013-06-28 12:27:13 PM",
            "result": "1",
            "method": "RECURRING",
            "data": {
                "RECURRING": {
                    "desc": "RECURRING_AUTH",
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

        "RECURRING" : {

"initialize" : "0",

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

Such a payment has no link to a payment window.

The payment state shows that authorization has been given. There is also a payment attempt with a successful result.
