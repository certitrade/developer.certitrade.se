---
title: "Test Information"
date: "2019-01-28"
weight: 20
menu: 
    main:
        parent: common
        name: Test Information
---
This document contains test information for the various payment methods in the CertiTrade Merchant API. These can only be used in the test system and not in a production environment.

## Card (`CARD` / `RECURRING` / `ONE_CLICK`)
The following card numbers can be used:

- To make a successful authorization without 3-D Secure, use `1234 5678 9000`
- To make a successful authorization with a 3-D Secure check, use `4444 3333 2222 0000`
- To make an unsuccessful authorization without 3-D Secure, use `1234 5678 9001`
- To make an unsuccessful authorization with a 3-D Secure check, use `4444 3333 2222 1111`
- (`RECURRING/ONE_CLICK`) To make a successful initializing authorization that then causes suspected fraud when subsequent `RECURRING` payments are made, use `1123 4500 0000 0002`. This simulates how a payment_account can be closed in the event of attempted fraud.

The CVC code can be any three-digit combination and the Expiry date must not have passed.

## Invoice (`INVOICE_SVEA` / `INVOICE_PAYEX`)

The following civil/corporate reg. numbers are used for `INVOICE_SVEA`:

- Civil reg. number `460509-2222` is used for a successful personal payment
- Civil reg. number `461008-1111` is used for an unsuccessful personal payment
- Corporate reg. number `460814-2222` is used for a successful business payment
- Corporate reg. number `460830-2222` is used for an unsuccessful business payment

The following civil reg. numbers are used for `INVOICE_PAYEX`:

- Civil reg. number `590719-5662` is used for a successful payment
- Civil reg. number `580604-5265` is used for an unsuccessful payment

An arbitrary email address and telephone number are stated.

## Direct payments (`DIRECT_PAYEX`)

No test information is required for direct payments.

## Part payments (`PARTPAY_PAYEX`)

The following address details can be entered in the payment window:

Successful payment:

- Civil registration no.: `590719-5662`
- Email: mail@test.se
- Telephone: 07010110112
- First names: Eva Dagmar Christina
- Last name: Tannerdal
- Address: Gunbritt Boden p12
- Zip code: 29620
- City: Småbyen

Unsuccessful payment:

- Civil registration no.: `580604-5265`
- Email: mail@test.se
- Telephone: 07010110112
- First names: Eva Anne-Christine
- Last name: Mendonca
- Address: Gunbritt Boden p12
- Zip code: 29620
- City: Småbyen

## Swish (BETA)
The Swish simulator will simulate a buyer completing the Swish payment on her mobile. By default
the simulator have a delay of four seconds. Any phone number can be supplied, it will not be used.

To customize the behavior of the Swish simulator supply the follow values for the parameter
“description” when creating a Swish payment. If not specified, the behavior of `DF22` will be used.

- `PA02` – create payment will fail
- `TM01` – create payment OK but payment will fail
- `DS24` – create payment OK, payment OK, create refund will fail
- `RF02` – create payment OK, payment OK, create refund OK, refund will fail
- `DF22` – create payment OK, payment OK, create refund OK, refund OK
- `TM92` – as per `DF22` but payment/refund delay is set to 180 seconds rather than 4.
