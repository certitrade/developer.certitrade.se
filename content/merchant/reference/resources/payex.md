---
title: PayEx
date: "2019-02-13"
weight: 90
menu: 
    main:
        parent: merchant-reference-resources
---

# `DIRECT_PAYEX`

## Bank

List of allowed banks and the currency that PayEx support for direct payments.

| Identifier | Permitted currency | Description |
|------------|--------------------|-------------|
| FSPA | SEK | Swedbank |
| NB | SEK | Nordea Bank |
| SEB | SEK | Skandinaviska Enskilda Bank |
| SHB | SEK | Handelsbanken |
| NB:DK | DKK | Nordea Bank DK |
| DDB | DKK | Den Danske Bank |
| BAX | NOK | BankAxess |
| SAMPO | EUR | |
| AKTIA | EUR | |
| SP | EUR | |
| POP | EUR | |
| OP | EUR | |
| NB:FI | EUR | Nordea Bank FI |
| SHB:FI | EUR | Handelsbanken FI |
| SPANKKI | EUR | |
| TAPIOLA | EUR | |
| AALAND | EUR | Ålandsbanken |

## Description

Definition of the values that _desc_ can have

| Value | Description |
|-------|-------------|
| `CREATED` | Starting state |
| `INITIALIZED` | Payment attempt initialized |
| `PREPARED` | Preparing to direct the customer to bank |
| `REDIRECTED_TO_BANK` | The customer has been directed to the bank |
| `CANCELLED` | The customer cancelled the payment attempt |
| `FAILED` | The payment attempt failed |
| `PAID` | The payment has been made |

# `INVOICE_PARTPAY_PAYEX`

# Description

Definition of the values that _desc_ can have

| Value | Description |
|-------|-------------|
| `WAITING_FOR_CUSTOMER_CONTRACT` | Starting state. Waiting for the customer to fill in the contract (`PARTPAY_PAYEX` only). |
| `WAITING_FOR_CUSTOMER_CONFIRM` | Waiting for the customer to confirm the purchase. |
| `WAITING_FOR_CUSTOMER_SECURITY_NUMBER` | Waiting for the customer to fill in the contract (`INVOICE_PAYEX` only). |
| `AUTHORIZED` | The purchase is approved, the payment can be placed in CAPTURED for completion. |
| `USER_CANCELLED` | The user chose to cancel the payment attempt. |
| `FAILED` | The payment attempt failed. |
