
---
title: "Svea Payment"
date: "2019-01-28"
weight: 50
menu: 
    main:
        parent: merchant-examples
        name: Svea
---
# Create Invoice Payment

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

