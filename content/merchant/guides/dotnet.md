---
title: ".NET"
date: "2019-02-07"
weight: 60
menu: 
    main:
        parent: merchant-guides
---

# Inkludera biblioteket i din kod

Lägg biblioteket på en lämplig plats och se till att det är tillgängligt från projektet och gör det anropbart från din kod.

```c#
using CertiTrade.MerchantAPI
```

# Skapa ett `CTServer`-objekt

Skapa sedan ett nytt `CTServer`-objekt

```c#
CTServer ctServer = new CTServer();
ctServer.setCredentials(merchantId, apiKey, testing);
```

# Skapa en `Payment`-resurs och anropa API:et

En enkel betalning skapas på detta sätt. `CTServer` har en metod som heter `createCardPayment()` som man anropar med ett antal argument. Först skapar man ett responseobjekt.

```c#
CTResponse response = new CTResponse();

response = ctServer.createCardPayment(
 currency: "SEK",
 returnUrl: "https://domain.tld/callback.php",
 callbackUrl: "https://domain.tld/return_url.php",
 amount: 12300,
 language: "sv",
 description: "Glue Corp");
```

# Hantera API-svaret

Svaret från CertiTrades server hamnar i response. Svaret består av fyra delar; `respone.Success`, `response.HTTPStatus`, `response.HTTPMessage` och `repsone.HTTPBody`. `response` har även två hjälpfunktioner; `response.getId()` och `response.getLink(<string>)` som returnerar betalningsid:t samt en specifiserad länk (exempelvis `response.getLink("paywin")` ger paywin-länken som kunden ska skickas vidare till för att föra in sina betaluppgifter).
