---
title: Refund
date: "2019-02-13"
weight: 170
menu: 
    main:
        parent: merchant-reference-resources
---
# `refund`

Refunds of a payment

**URL** : `/payment/[paymentId]/refund/[id]`
**Searchable parameters** : --

| Variable | Attribute | Type | Description |
|----------|-----------|------|-------------|
| id | A | `int` | Resource ID |
| created | A | `string` | Date that the refund was created |
| state | A, U | `string` | State variable, see table _refund_ _–_ _state_ |
| amount | C, M, U | `int` | Refund amount in the payment currency’s smallest unit (e.g. öre for SEK). Can only be changed while _state_ is _PENDING_. |
| _links | A | `collection` | Resource-related links |
| self | A | `string` | The resource’s unique URL |
| payment | A | `string` | URL for payment |
| _embedded | A | `collection` | None |

# State

| State | Description |
|-------|-------------|
| `PENDING` | The initial state. The refund will be made during the coming night. |
| `DONE` | The refund has been made. |
| `CANCELLED` | The refund was cancelled. Can be set by merchant. |
| `FAILED` | The refund failed. |
