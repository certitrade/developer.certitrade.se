---
title: "Examples"
date: "2019-01-28"
weight: 50
menu: 
    main:
        parent: merchant-reference
---

Here are some concrete examples of common operations in the API. Certain details, e.g. header fields, may have been omitted, in which case this is shown by “”.

# Create card payment

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

# `ONE_CLICK` payment

First a `CARD` payment is created and made as described in 4.1.

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

# Initialize an account for RECURRING payments

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

# Make a `RECURRING` payment

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

# Create SveaFaktura invoice payment

To create a SveaFaktura invoice payment a `POST` is made to the collection payment.

#### Request
```http
POST payment HTTP/1.1
Authorization: CertiTrade m12345:f3dcba298804
Date: Mon, 12 Nov 2013 14:52:37 GMT
Content-Type: application/json

{
    "currency": "SEK",
    "return_url": "http://returnurl.com",
    "callback_url": "http://callbackurl.com",
    "method": "INVOICE_SVEA",
    "reference": "54321",
    "language": "sv",
    "products": [
        {
		"line_ordering": "1",
		"product_reference": "1",
		"product_name": "Produkt ett",
"price": "100",
		"quantity": "5",
		"vat_rate": "12.00",
		"vat_included": "0",
        }
    ],

"data" : {

        "INVOICE_SVEA" : {
            "order_id": "123456789"
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
    "amount": "560",
    "authorized_amount": "0",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "INVOICE_SVEA",
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
    "products": [
        {
		"line_ordering": "1",
		"product_reference": "1",
		"product_name": "Produkt ett",
"price": "100",
		"quantity": "5",
		"vat_rate": "12.00",
		"vat_included": "0",
        }
    ],
    "payment_attempts": [],
"data" : {
        "INVOICE_SVEA" : {
            "order_id": "123456789",
            "order_number": "",
            "authorize_id": "",
            "invoice_number": "",
            "capture_rejection_code": "",
            "due_date": "",
            "expiration_date": "",
            "customer_id": "",
            "will_buy_invoices": "",
            "customer_legal_name": "",
            "customer_security_number": "",
            "customer_phone_number": "",
            "customer_address1": "",
            "customer_address2": "",
            "customer_post_code": "",
            "customer_post_area": "",
            "customer_business_type": ""
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

# Create a PayEx direct payment

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

# Approve card payment for capture

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

# Approve SveaFaktura payment for capture

When you approve a SveaFaktura payment an invoice will be created in Svea’s system. There must be automatic approval of invoices in Svea’s system in order for this to happen.

To approve a SveaFaktura payment we reset the state to "CAPTURED".

If the operation can be carried out, the status code is 200. The new state is also reflected in the payment representation that is returned.

#### Request
```http
PUT payment/11114 HTTP/1.1

{
    "state": "CAPTURED"
}
```
#### Response
```http
HTTP/1.1 200 OK
Content-Type: application/hal+json

{
    "id": "11114",
    "created": "2013-06-28 09:21:38",
    "state": "CAPTURED",
    "reference": "54321",
    "description": "",
    "amount": "560",
    "authorized_amount": "560",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "INVOICE_SVEA",
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
    "products": [
        {
		"line_ordering": "1",
		"product_reference": "1",
		"product_name": "Produkt ett",
"price": "100",
		"quantity": "5",
		"vat_rate": "12.00",
		"vat_included": "0",
        }
    ],
    "payment_attempts": [
        {
            "created": "6/24/2013 4:43:51 PM",
            "result": "1",
            "method": "INVOICE_SVEA",
            "data": {
                "INVOICE_SVEA": {
                    "rejection_code": ""
                }
            }
        }
    ],
"data" : {
        "INVOICE_SVEA" : {
            "order_id": "123456789",
            "order_number": "123456789",
            "authorize_id": "123456789",
            "invoice_number": "123456789",
            "capture_rejection_code": "",
            "due_date": "10/21/2014 11:00:00 PM",
            "expiration_date": "12/21/2014 11:00:00 PM",
            "customer_id": "123456789",
            "will_buy_invoices": "1",
            "customer_legal_name": "Test namn",
            "customer_security_number": "1234561111",
            "customer_phone_number": "08-1111111",
            "customer_address1": "Testgatan 1",
            "customer_address2": "",
            "customer_post_code": "12345",
            "customer_post_area": "Stan",
            "customer_business_type": "Person"
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

# Cancel a payment
Cancelling a payment means that the authorization is reversed and the payment is not forwarded for capture. To do this, the state is reset to `CANCELLED`.

If the operation can be carried out, the status code returned is 200. The new state is reflected in the payment representation that is returned.

Cancellation can only be carried out for payments with a state of either `WAITING_FOR_APPROVAL` or `READY_FOR_CAPTURE`.

#### Request
```http
PUT payment/11114 HTTP/1.1

{
    "state": "CANCELLED"
}
```
#### Response
```http
HTTP/1.1 200 OK
Content-Type: application/hal+json

{
    "id": "11114",
    "created": "6/24/2013 4:43:43 PM",
    "state": "CANCELLED",
    "reference": "54321",
    "description": "",
    "amount": "1234",
    "authorized_amount": "1234",
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
    "payment_attempts": [
        {
            "created": "6/24/2013 4:43:51 PM",
            "result": "1",
            "method": "CARD",
            "data": {
                "desc": "SSL_AUTH",
                "authcode": "566706",
                "respcode": "00",
                "masked_cardno": "xxxxxxxxxxx2300",
                "bin": "123456",
                "cardholder_name": ""
            }
        }
    ],

"data" : {

        "CARD" : {

        }
    }
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
# Create a refund

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
# Create a PayEx invoice payment

#### Request
```http
POST payment HTTP/1.1
Authorization: CertiTrade m12345:f3dcba298804
Date: Mon, 12 Nov 2013 14:52:37 GMT
Content-Type: application/json

{
    "currency": "SEK",
    "return_url": "http://returnurl.com",
    "callback_url": "http://callbackurl.com",
    "method": "INVOICE_PAYEX",
    "reference": "54321",
    "language": "sv",
    "products": [
        {
		"line_ordering": "1",
		"product_reference": "1",
		"product_name": "Produkt ett",
"price": "100",
		"quantity": "5",
		"vat_rate": "12.00",
		"vat_included": "0",
        }
    ],

"data" : {

        "INVOICE_PAYEX" : {
            "order_id": "123456789"
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
    "amount": "560",
    "authorized_amount": "0",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "INVOICE_PAYEX",
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
    "products": [
        {
		"line_ordering": "1",
		"product_reference": "1",
		"product_name": "Produkt ett",
"price": "100",
		"quantity": "5",
		"vat_rate": "12.00",
		"vat_included": "0",
        }
    ],
    "payment_attempts": [],

"data" : {

        "INVOICE_PAYEX" : {
            "capture_transaction_number": "",
            "capture_error_code": "",
"capture_error_description": "",
"order_id": "123456789",
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
    		}
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

# Create a PayEx part payment

#### Request
```http
POST payment HTTP/1.1
Authorization: CertiTrade m12345:f3dcba298804
Date: Mon, 12 Nov 2013 14:52:37 GMT
Content-Type: application/json

{
    "currency": "SEK",
    "return_url": "http://returnurl.com",
    "callback_url": "http://callbackurl.com",
    "method": "PARTPAY_PAYEX",
    "reference": "54321",
    "language": "sv",
    "products": [
        {
		"line_ordering": "1",
		"product_reference": "1",
		"product_name": "Produkt ett",
            "price": "100",
		"quantity": "5",
		"vat_rate": "12.00",
		"vat_included": "0",
        }
    ],
"data" : {
        "PARTPAY_PAYEX" : {
            "order_id": "123456789"
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
    "amount": "560",
    "authorized_amount": "0",
    "currency": "SEK",
    "language": "sv",
    "merchant": "12345",
    "method": "PARTPAY_PAYEX",
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
    "products": [
        {
		"line_ordering": "1",
		"product_reference": "1",
		"product_name": "Produkt ett",
            "price": "100",
		"quantity": "5",
		"vat_rate": "12.00",
		"vat_included": "0",
        }
    ],
    "payment_attempts": [],
"data" : {
        "PARTPAY_PAYEX" : {
            "capture_transaction_number": "",
            "capture_error_code": "",
            "capture_error_description": "",
            "order_id": "123456789",
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
    		}
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

# Create a SWISH_E payment

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
# Create a SWISH_M payment

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
