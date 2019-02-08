---
title: "Pseudo Code"
date: "2019-02-07"
weight: 40
menu: 
    main:
        parent: merchant-guides
---

Som ett exempel, i form av pseudokod, på hur API:et kan användas visar vi här hur en ny kortbetalning kan skapas.

```
REQUEST = array[
        amount = "1000"
        currency = "SEK"
        return_url = "https://theshop.tld/return"
        callback_url = "https://theshop.tld/callback"
        reference = "Order: 123456"
        description = "Krazy glue"
        language = "sv" ]

RESPONSE = create_card_payment(REQUEST)

function create_card_payment(REQUEST)
        REQUEST[method] = "CARD"

        API_RESOURCE = "payment"
        REST_VERB = "POST"

        RESPONSE = call_certitrade(REST_VERB, API_RESOURCE, REQUEST)

        return RESPONSE

function call_certitrade(REST_VERB, API_RESOURCE, REQUEST)
        // Send the http request to CertiTrade
        HOST_TEST = https://apitest.certitrade.net/ctpsp/ws/2.0

        create a new HTTPCLIENT instance

        // Set the date header according to the format
        // "Mon, 01 Jan 2014 13:30:00 GMT" and set it
        DATE = get_date(D, d M Y H:i:s) + " GMT"
        HEADERS[Date] = DATE

        // Any REQUEST data needs to be utf8 encoded json
        ENCODED_REQUEST = utf8_encode(json_encode(REQUEST))

        // Calculate the Authorization Header (see the API documentation) and set it.         // This function needs to be implemented by you.
        AUTH_HASH = calc_auth_hash(HOST_TEST, ENCODED_REQUEST, REST_VERB,
                                         API_RESOURCE, DATE)
        HEADERS[Authorization] = AUTH_HASH

        // Set SSL options to verify the server certificate before proceeding to
        // ensure that it indeed is the CertiTrade PSP we&#39;re talking to.

        HTTPCLIENT.send(REST_VERB, HOST_TEST, API_RESOURCE, HEADERS, ENCODED_REQUEST)

        return HTTPCLIENT.response()
```

`RESPONSE` innehåller, förutom `httpstatus`, även svaret från CertiTrade:s PSP-server i http-body:n i UTF8-kodat JSON-format. Däri finns förutom status för httpförfrågan och betalningen även paywin-länken som är nästa steg man ska skicka kunden till.

När kunden är färdig med betallänken skickas hen tillbaka tillbaka till `return_url`:en och en callback med statusinformation skickas till `callback_url`:en.
