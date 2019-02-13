---
title: Descriptor
date: "2019-02-13"
weight: 40
menu: 
    main:
        parent: merchant-reference-resources
---
**URL** : `/descriptor/[id]`
**Searchable parameters** : `merchant`, `state`, `method`, `currencies`

| Variable | Attribute | Type   | Description               |
|----------|-----------|--------|---------------------------|
| `id` | A | `int` | Resource ID |
| `created` | A | `string` | Date that the descriptor was created |
| `state` | A, U | `string` | State variable. Possible values are “ACTIVE” or “INACTIVE”. |
| `merchant` | C, M | `int` | Merchant that owns the descriptor |
| `currencies` | C, M, U | `object` | List of the currencies that the descriptor can use. Each element is the alphabetic code for one of the _Currencies_ – see table 5.2 |
| `method` | C, M | `string` | The descriptor’s payment method. Max. 20 characters. |
| `data` | A, U | `object` | Contains payment method-specific data that is required in order to make payments using the specified payment method _method_. |
| `data.CARD.acquirer_agreement` | A, U | `int` | The `acquirer_agreement` resource that is associated with this descriptor. |
| `data.RECURRING.acquirer_agreement` | A, U | `int` | The `acquirer_agreement` resource that is associated with this descriptor. |
| `data.ONE_CLICK.acquirer_agreement` | A, U | `int` | The `acquirer_agreement` resource that is associated with this descriptor. |
| `data.INVOICE_SVEA.client_no` | A, U | `int` | Svea WebPay client number. |
| `data.INVOICE_SVEA.username` | A, U | `string` | Svea WebPay username. Max. 20 characters. |
| `data.INVOICE_SVEA.password` | A, U | `string` | Svea WebPay password. Max. 20 characters. |
| `data.DIRECT_PAYEX.account_number` | A, U | `int` | PayEx account number |
| `data.DIRECT_PAYEX.account_number` | A, U | `string` | PayEx account key. Max. 64 characters. |
| `data.INVOICE_PAYEX.account_number` | A, U | `int` | PayEx account number |
| `data.INVOICE_PAYEX.account_number` | A, U | `string` | PayEx account key. Max. 64 characters. |
| `data.PARTPAY_PAYEX.account_number` | A, U | `int` | PayEx account number | PayEx account key. Max. 64 characters. |
| `_links` | A | `collection` | Resource-related links |
| `self` | A | `string` | The resource’s unique URL |
| `merchant` | A | `string` | URL for merchant |
| `_embedded` | A | `collection` | None |

