---
title: "PHP"
date: "2019-02-07"
weight: 50
menu: 
    main:
        parent: merchant-guides
        identifier: merchant-guides-php
---

# Inkludera biblioteket i din kod

Kopiera Certitrade MerchantAPI-biblioteket till en katalog din PHP-applikation kan nå och inkludera det med;

```php
require_once './CTServer.php';
```

Skapa en fil `MerchantCredentials.php` i en katalog som din PHP-applikation kan nå, men som ligger utanför web root och skriv in ditt Merchantid och API-nyckel där.

```php
define('MERCHANT_ID', "<your_merchant_id>");
define('API_KEY', "<your_api_key>");
```

Nästa steg är;

# Skapa ett CTServer-objekt

För att kunna skapa betalningar behövs först en anslutning till Certitrade. Detta anslutningsobjekt skapas med;

```php
$ct_server = new Certitrade\CTServer(MERCHANT_ID, API_KEY, true);
```

där det sista argumentet, `true`, berättar att vi vill skapa anslutningen mot Certitrades testmiljö.

# Exempel: Skapa en Payment-resurs och anropa API:et

Först skapar man ett `request`-objekt med den information som behövs för att skapa den betalning man önskar. Detta skickas sedan till $ct-server-objektet vi skapade tidigare.

```php
$request = array(
    'amount' => "1000",
    'currency' => "SEK",
    'return_url' => "https://webshoppen.företaget.se/return.php",
    'callback_url' => "https://webshoppen.företaget.se/callback.php",
    'reference' => "123123",
    'description' => "Företaget.se: Krazy Glue",
    'language' => "sv");
$ct_response = $ct_server->create_card_payment($request);
```

Serversvaret lagras i `$ct_response`.

# Hantera API-svaret

Anropssvaret i `$ct_response` kommer att en av tre typer; `Certitrade\Resource`, `Certitrade\Collection` eller `Certitrade\APIProblem`. Beroende på vilket svar man får finns det olika saker man kan göra.

Vid lyckat anrop av `create_card_payment()` får man ett `Certitrade\Resource`-svar som innehåller detaljer om betalningen, bl.a den Payment Window-länk man behöver skicka kunden till för att bekräfta betalning med 3-D Secure (exempelvis MasterCard SecureCode eller Verified by Visa).

Den länken får man enklast ut genom att anropa hjälpmetoden `getLink()`.

```php
$ct_response->getLink("paywin"):
```

som man sedan kan skicka vidare kunden till. När kunden fyllt i sina uppgifter, eller avbrutit, skickas hen tillbaka till `return_url` och en callback skickas till `callback_url`.
