---
title: Acquirer Agreement
date: "2019-02-13"
weight: 190
menu: 
    main:
        parent: merchant-reference-resources
---
# `acquirer_agreement`

Represents an acquirer agreement for card payments. Needs to be linked to a Descriptor before card payments can be made.

**URL** : `/acquirer_agreement/[id]`
**Searchable parameters** : `merchant`, `state`, `agent`

| Variable | Type | Description |
|----------|------|-------------|
| `contract_id (id)` | C, M | `int` | Resource ID plus acquirer contract number with bank. |
| `created` | A | `string` | Date that the resource was created. |
| `state` | A, U | `string` | State variable. Possible values are `ACTIVE` or `INACTIVE`. |
| `merchant` | C, M | `int` | The merchant that owns `acquirer_agreement`. |
| `contract_type` | C, M | `string` | Specifies the transaction type, `ECOM` for eCommerce or `MOTO` for mail order/telephone order. |
| `acquirer` | C, M | `string` | Name of acquiring bank. Only `EUROLINE`, `HANDELSBANKEN`, `NORDEA`, `SWEDBANK`, `TELLER` or `CLEARHAUS`. |
| `processor` | C, M | `string` | Name of card processor. Only `EVRY` or `CLEARHAUS`. |
| `3d` | A, U | `object` | 3-D details. |
| `3d.company_name` | A, U | `string` | Company name that is presented when the customer is forwarded to the bank’s 3-D page. Max. 25 characters.. |
| `3d.company_url` | A, U | `string` | Company URL that is used in the 3-D Secure process. Max. 128 characters. |
| `3d.country_code` | A, U | `string` | Country code that is used in the 3-D Secure process. Only three-digit numeric ISO 3166-1. |
| `3d.acq_bin_visa` | A, U | `string` | Identifies the acquirer at Visa. Max. 6 characters.. |
| `3d.acq_bin_mc` | A, U | `string` | Identifies the acquirer at Mastercard. Max. 6 characters.. |
| `3d.visa_active` | A, U | `int` | Specifies whether Verified by Visa is activated. (0/1). |
| `3d.mastercard_active` | A, U | `int` | Specifies whether Mastercard SecureCode is activated. (0/1). |
| `flags` | A, U | `object` | Settings for the payment window for card payments. |
| `flags.DISPLAY_VISA` | A, U | `int` | Whether or not the Visa logo is to be shown in the payment window. (0/1). |
| `flags.DISPLAY_MASTERCARD` | A, U | `int` | Whether or not the Mastercard logo is to be shown in the payment window. (0/1). |
| `flags.DISPLAY_AMEX` | A, U | `int` | Whether or not the Amex logo is to be shown in the payment window. (0/1). |
| `flags.DISPLAY_DINERS` | A, U | `int` | Whether or not the Diners logo is to be shown in the payment window. (0/1). |
| `flags.COLLECT_CARDHOLDER_NAME` | A, U | `int` | Whether the customer’s name is to be stated in the payment window. (0/1). |
| `flags.SHOW_CANCEL_BUTTON` | A, U | `int` | Whether a Cancel button is to be shown in the payment window. (0/1). |
| `_links` | A | `collection` | Resource-related links. |
| `self` | A | `string` | The resource’s unique URL. |
| `payment` | A | `string` | URL for payment. |
| `_embedded` | A | `collection` | None. |
