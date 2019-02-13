---
title: Payment
date: "2019-02-13"
weight: 50
menu: 
    main:
        parent: merchant-reference-resources
---

**URL** : `/payment/[id]`
**Searchable parameters** : `merchant`, `amount`, `currency`, `method`, `reference`, `state`, `language`, `payment_account`

| Variable | Attribute | Type   | Description               |
|----------|-----------|--------|---------------------------|
| `id` | A | `int` | Resource ID |
| `created` | A | `string` | Date that the payment was created |
| `state` | A, U | `string` | State variable. See table _payment_ _–_ _state._ |
| `amount` | C, M, U | `int` | Amount in the currency’s smallest unit (e.g. öre for SEK). Can be changed when _state_ is `WAITING_FOR_APPROVAL` or `READY_FOR_CAPTURE` in order to change the amount that is to go on to be captured. |
| `authorized_amount` | A | `int` | Amount that has been authorized. Set on successful authorization. |
| `currency` | C, M | `string` | Currency code according to ISO 4217. |
| `language` | C | `string` | Language code according to ISO 639-1. If not specified, Swedish (_‘__sv__’_) is used. See table _5.1 Languages_ |
| `merchant` | A | `int` | The merchant that the payment belongs to |
| `method` | C, M | `string` | The payment method to be used. |
| `reference` | C, U | `string` | The merchant’s reference, shown in the payment window. Max. 64 characters. |
| `description` | C, U | `string` | A more detailed description of the payment, shown in the payment window. Max. 64 characters. |
| `payment_attempts` | A | `payment_attempt[]` | Array of payment attempts. See table `payment_attempt`. |
| `return_url` | C, M | `string` | URL to which the buyer is to be sent when the payment is complete. Max. 256 characters. |
| `callback_url` | C, M | `string` | URL to which callbacks concerning the payment are to be sent. Max. 256 characters. |
| `customer` | C | `customer` | Information about the customer. See table _customer_ . |
| `products` | C, U | `product[]` | Array of products. See table _product_. |
| `data` | C | `object` | Specifies payment method-specific data. The fields that are accessible (if any) will depend on which payment method _method_ has been specified. |
| `data.RECURRING.initialize` | C, M | `int` | Whether or not the payment is an initializing `RECURRING` payment (0/1). |
| `data.RECURRING.payment_account` | C, M | `string` | The `payment_account` that is to be used for this payment. |
| `data.ONE_CLICK.payment_account` | C, M | `string` | The `payment_account` that is to be used for this payment. |
| `data.INVOICE_SVEA.order_id` | C, M | `int` | Merchant’s order ID that is shown on the invoice |
| `data.INVOICE_SVEA.order_number` | A | `int` | Svea’s `order_number` |
| `data.INVOICE_SVEA.authorize_id` | A | `int` | Svea’s `authorize_id` |
| `data.INVOICE_SVEA.invoice_number` | A | `int` | Svea’s invoice number |
| `data.INVOICE_SVEA.invoice_rejection_code` | A | `string` | Error code shown if an invoice cannot be created (i.e. CAPTURE failed) |
| `data.INVOICE_SVEA.due_date` | A | `string` | Date that the invoice is due for payment |
| `data.INVOICE_SVEA.expiration_date` | A | `string` | Date that the order expires |
| `data.INVOICE_SVEA.customer_id` | A | `int` | Svea’s `customer_id` |
| `data.INVOICE_SVEA.will_buy_invoices` | A | `int` | If Svea will buy the invoice |
| `data.DIRECT_PAYEX.bank` | C, M | `string` | Which bank the direct payment is being made to. Must be one of the identifiers in the table _bank_ – `DIRECT_PAYEX` |
| `data.INVOICE_PAYEX.order_id` | C, M | `string` | The shop’s `order_id` as specified when the payment was created |
| `data.INVOICE_PAYEX.capture_transaction_number` | A | `int` | PayEx transaction number for capture |
| `data.INVOICE_PAYEX.capture_error_code` | A | `string` | PayEx error code for failed capture |
| `data.INVOICE_PAYEX.capture_error_description` | A | `string` | Description of error in the event of failed capture |
| `data.PARTPAY_PAYEX` |  |  | Has the same fields as `INVOICE_PAYEX`. See `data.INVOICE_PAYEX`. |
  `data.SWISH_E.payer_phone_number` | A | `string` | Swish registered phone number for the payer. |
| `_links` | A | `collection` | Resource-related links |
| `self` | A | `string` | The resource’s unique URL |
| `merchant` | A | `string` | URL for merchant |
| `paywin` | A | `string` | URL for the payment window (to which the customer is to be forwarded) |
| `_embedded` | A | `collection` | None |

# `payment` – state

Definition of the states that a payment can have

| State | Description |
|-------|-------------|
| `CREATED` | Starting state. Payment has been created but the payment window link has not been opened. |
| `PENDING` | The payment link has been opened, no successful authorization has been given. |
| `WAITING_FOR_APPROVAL` | Authorized payment is awaiting approval in order to be captured. |
| `READY_FOR_CAPTURE` | The payment will be captured during the coming night. |
| `CAPTURED` | The payment has been captured. |
| `CANCELLED` | The authorization has been reversed. |
| `FAILED` | The payment failed. |

