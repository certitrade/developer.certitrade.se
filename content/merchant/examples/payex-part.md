---
title: "PayEx Partial Payment"
date: "2019-01-28"
weight: 60
menu: 
    main:
        parent: merchant-examples
        name: PayEx Partial
---

# Create Payment

#### Request
```http
POST payment HTTP/1.1
Authorization: Certitrade m12345:f3dcba298804
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
