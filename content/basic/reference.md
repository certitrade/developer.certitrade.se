---
title: "Certitrade Basic API Reference"
date: "2019-01-24"
weight: 10
menu: 
    main:
        parent: basic
        name: Reference
---

# Sammanfattning

CtBasic är ett POST-baserat API för att göra betalningar i CtPsp.

# Parametrar

## Obligatoriska

| Namn | Typ | Beskrivning |
|---|---|---|
| merchantid | int | Säljföretagets id i CertiTrades system |
| amount | decimal | Belopp med . som decimaltecken. 5 kr och 70 öre anges alltså 5.70 |
| currency | string | Valuta i ISO4219 bokstavskoder, t ex SEK, EUR, USD |
| orderid | num | Numeriskt, max 15 siffror. |
| return_url | url | URL dit köparen vidarebefordras efter köp |
| hash | string | Integritetsskydd och autentisering. Anges på formatet [algoritm]:[hash] Läs mer nedan |
| client_info | string | Sträng som identifierar klienten. |

## Valfria

| Namn | Typ | Beskrivning |
|---|---|---|
| callback_url | url | URL för callbacksfrån CertiTrade |
| cust_phone | string | Köparens telefonnummer |
| cust_email | email | Köparens emailadress |
| payment_method | string | Betalmetod. API:et stöder kort och Swish |
| language | string | Språkkod. Ifall denna parameter utelämnas kommer systemet att försöka hitta lämpligt språk utifrån köparens inställningar i webbläsaren. |

## Definitioner
#### Betalmetoder

| Värde | Beskrivning |
|---|---|
| CARD | Kortbetalning |
| SWISH_E | Swish för ehandel |

### Språk

| Värde | Beskrivning |
|---|---|
| sv | Svenska |
| en | Engelska |
| no | Norska |
| da | Danska |
| fi | Finska |
| de | Tyska |
| fr | Franska |
| it | Italienska |
| es | Spanska |

# Callback och retur till butik

När betalsessionen avslutas skickas köparen tillbaka till butikens return_url via ett formulär med resultatparametrar från betalningen.

Om butiken anger callback_url kommer dessa parametrar även att skickas i en callback innan köparen återvänder till butik.

Följande parametrar skickas då:

| Namn | Typ | Beskrivning |
|---|---|---|
| hash| string | Integritetsskydd och autentisering. Läs mer nedan |
| paymentid| int | Betalningens id i CertiTrades system |
| merchantid| int | Säljföretagets id i CertiTrades system |
| orderid| num | Butikens orderid |
| function| string | Resultat APPROVE|DECLINE|CANCEL|ERROR |
| description| int | Kod som beskriver resultatet. Läs mer nedan |
| timestamp| num | Tidsstämpel |
| method| string | Betalmetod som använts |

Om function är `APPROVE` eller `DECLINE` kommer också vissa parametrar att skickas som är specifika för aktuell betalmetod

Dessa parametrar namnges enligt `[method]-[parameter_name]`

| Function | Namn | Typ | Beskrivning |
|---|---|---|---|
| APPROVE | CARD-authcode | Alfanumeriskt | Kod som används i kommunikation med bank då en auktorisation ska identifieras. Oftast 6 siffror men kan variera i längd samt innehålla bokstäver. |
| APPROVE | SWISH_E-payment_reference | Alfanumeriskt | Referens till Swish en Swish-betalning |
| DECLINE | CARD-respcode | 2 tecken | Resultatod som skickas vid misslyckad auktorisation. |
| DECLINE | SWISH_E-error_code | | Felkod från Swish |
| DECLINE | SWISH_E-error_message | | Felmeddelande från Swish |

# Autentisering och integritetsskydd

Alla meddelanden mellan butik och CertiTrade skyddas med en hashkod som beräknas på en sträng sammansatt av apinyckeln och vissa av parametrarna.

Strängen konstrueras enligt följande

#### Butik -> CertiTrade
```
apikey + merchantid + orderid + amount + currency + return_url + callback_url
```

#### CertiTrade -> Butik (callback och retur)
```
apikey + paymentid + merchantid + orderid + function + description + timestamp
```

I nuläget stöds md5 och sha256 som algoitmer för hashkoden. Butik anger i det inledande anropet
vilken algoritm som ska användas. Algoritm och hash kombineras i fältet hash på följande sätt:

```
md5:c196a45ccc6c1e27bcd335b89cea1614
sha256:dfde7c03a01acdcef715aea5c36b166bdec399dc5409b2bb5c89855e021fd694
```

Den algoritm som butiken anger kommer också att av CertiTrade i callbacks och retur.
Formatet på parametern hash är detsamma.
