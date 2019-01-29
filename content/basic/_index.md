---
title: "Certitrade Basic API"
date: "2019-01-29"
weight: 20
menu: 
    main:
        identifier: basic
        name: Basic API
---
Basic Payment API ger all funktionalitet som behövs för en enkel integration i en webshop.

Här är urvalet av betalmetoder begränsat till kort och Swish. Butiken startar en betalning genom att vidarebefordra köparen till betalsystemet via en formulärpostning. Resultatet av en betalning kan hanteras antingen vid en callback eller i samband med att köparen skickas tillbaka till butik.

API:et inkluderar inte heller administrativa funktioner som t ex återbetalning och att godkänna/avslå en transaktion. Dessa är istället tillgängliga via inloggning i Certitrades administrativa tjänst, MCA (Merchant Client Application). Där går det även att kontrollera statusen på transaktioner och ta ut rapporter av olika slag.

# Exempel

``` html
<form id="basicform" action="https://ct/basic" method="post">
  <input type="hidden" name="merchantid" value="12345" />
  <input type="hidden" name="amount" value="5.00" />
  <input type="hidden" name="currency" value="SEK" />
  <input type="hidden" name="orderid" value="54321" />
  <input type="hidden" name="return_url" value="http://returnurl" />
  <input type="hidden" name="callback_url" value="http://callbackurl" />
  <input type="hidden" name="security_code" value="e3aa4590b24f5a..." />
</form>
```
