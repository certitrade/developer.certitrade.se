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
