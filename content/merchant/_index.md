---
title: "Certitrade Merchant API"
date: "2019-01-29"
weight: 30
menu: 
    main:
        identifier: merchant
        name: Merchant API
---
Certitrade Merchant API är ett RESTful resource inriktad API med många olika nivåer för att tillgodose handlarens olika behov.

Funktionaliteten är att skapa och genomföra betalningar med ett antal olika betalningsmetoder såsom kort, Swish eller fakturor. En mängd olika betalningsaktörer är tillgängliga genom detta API och arkitekturen gör att Certitade lätt kommer att kunna lägga till flera, framtida betalmetoder.

API:et har också enkla och lättanvända administrativa funktioner för återköp samt godkännande och kontroll av betalstatus. Detta gör att API:et är väldigt lämpligt för e-handel plugin och för integrering i större affärssystem.

Alla administrativa funktioner är även tillgängliga för handlare via login i Certitrades administrativa tjänst, MCA (Merchant Client Application).

# Example

### Create payment request
```http
POST payment HTTP/1.1
Authorization: CertiTrade m12345:f3dcba298804...
Date: Tue, 09 Jan 2018 14:52:37 GMT
Content-Type: application/json

{
    "amount" : "1234" ,
    "currency" : "SEK" ,
    "return_url" : "http://returnurl" ,
    "callback_url" : "http://callbackurl" ,
    "method" : "CARD" ,
    "reference" : "54321" ,
    "language" : "sv"
}
```

### Create payment response
```http
HTTP/1.1 201 Created
Content-Type: application/hal+json

{
    "id" : "11112" ,
    "created" : "2018-01-09 14:52:37" ,
    "state" : "CREATED" ,
    "reference" : "54321" ,
    ...
    "_links" : {
        "self" : {
            "href" : "https://ctpsp/ws/2.0/payment/11112"
        },
        "merchant" : {
            "href" : "https://ctpsp/ws/2.0/merchant/12345"
        },
        "paywin" : {
            "href" : "https://ctpsp/paywin/cc66c3217cc47aedf6ef1979038de79f"
        }
    }
}
```
