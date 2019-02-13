---
title: Payment Account
date: "2019-02-13"
weight: 150
menu: 
    main:
        parent: merchant-reference-resources
---

Account used for `RECURRING` and `ONE_CLICK` payments.

**URL** : `/payment_account/[id]`
**Searchable parameters** : `merchant`, `state`, `type`

| Variable | Attribute | Type | Description |
|----------|-----------|------|-------------|
| `id` | A | `int` | Resource ID |
| `created` | A | `string` | Date that the account was created. |
| `state` | A, U | `string` | State variable. See table `payment_account` _–_ _state_. |
| `merchant` | A | `int` | Merchant that owns the account. |
| `payment` | C, M, A | `int` | The payment used to initialize the account. To be specified only if _type_ is `ONE_CLICK`. |
| `type` | C, M | `string` | Specifies type of account (`RECURRING` or `ONE_CLICK`). |
| `expiry_date` | A | `string` | Year and month that the account expires. Max. 10 characters. |
| `masked_cardno` | A | `string` | Masked card number showing the last four digits. Max. 50 characters. |
| `bin` | A | `string` | The card’s bin number (first 6 digits). Max. 6 characters. |
| `_links` | A | `collection` | Resource-related links. |
| `self` | A | `string` | URL for descriptor. |
| `merchant` | A | `string` | URL for merchant. |
| `_embedded` | A | `collection` | None. |

160
# `payment_account` – state

| State | Description |
|-------|-------------|
| `UNINITIALIZED`| The initial state of RECURRING accounts. No initial transaction has been made|
| `ACTIVE`| The initial state of `ONE_CLICK` accounts. The account has been initialized and can be used for transactions. Set automatically when a payment linked to this account is successfully authorized. |
| `CLOSED`| The account has been closed and cannot be used for transactions. Can be set by merchant or by the system if fraud is suspected.|
