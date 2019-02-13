---
title: Payment Attempt
date: "2019-02-13"
weight: 30
menu: 
    main:
        parent: merchant-reference-resources
---
| Variable | Type   | Description               |
|----------|--------|---------------------------|
| `created` | `string` | Date and time that the payment attempt was made |
| `result` | `int` | Whether or not the payment attempt was successful. (0/1) |
| `method` | `string` | The descriptor’s payment method |
| `computers` | `object` | Contains data on the payment attempt that is specific to the payment method that was used. The fields that are accessible will depend on which payment method _method_ was specified. |
| `data.CARD.desc` | `string` | Brief description of the payment attempt. See table _description_ _–_ _CARD_. |
| `data.CARD.authcode` | `string` | Authorization code. Max. 10 characters. |
| `data.CARD.respcode` | `string` | String that describes the result of the authorization. 00 is successful, otherwise error. Max. 5 characters. |
| `data.CARD.masked_cardno` | `string` | Masked card number showing the last 4 digits in plain text. Max. 50 characters. |
| `data.CARD.bin` | `string` | First 6 digits of the card number. Max. 6 characters. |
| `data.CARD.cardholder_name` | `string` | Cardholder’s name as entered in the payment window. Max. 50 characters. |
| `data.RECURRING` | | Same field as for CARD. See data.CARD. |
| `data.ONE_CLICK` | | Same field as for CARD. See data.CARD. |
| `data.INVOICE_SVEA.rejection_code` | `string` | Brief description of the reason the payment attempt failed. Max. 50 characters. |
| `data.INVOICE_SVEA.customer_type` | `string` | Type of customer. Only “Person” or “Business”. |
| `data.INVOICE_SVEA.customer` | customer | The customer’s personal details as used in the payment attempt. See table `customer`. |
| `data.DIRECT_PAYEX.desc` | `string` | Brief description of the payment attempt. See table _description_ _–_ `DIRECT_PAYEX` |
| `data.DIRECT_PAYEX. transaction_number` | `int` | PayEx transaction number |
| `data.DIRECT_PAYEX. fraud_data` | `int` | If PayEx suspects fraud (0/1) |
| `data.INVOICE_PAYEX.desc` | `string` | Brief description of the payment attempt. See table_description_ _–_ `INVOICE_PARTPAY_PAYEX` |
| `data.INVOICE_PAYEX.error_code` | `string` | Error code from PayEx that explains failed payment attempt. Max. 50 characters. |
| `data.INVOICE_PAYEX.error_description` | `string` | More detailed error description from PayEx for failed payment attempt. Max. 50 characters. |
| `data.INVOICE_PAYEX.authorize_transaction_number` | `int` | PayEx transaction number |
| `data.INVOICE_PAYEX.customer` | customer | The customer’s personal details as used in the payment attempt. See table `customer`. |
| `data.PARTPAY_PAYEX` | | Same as for `PayEx.INVOICE_PAYEX`. |
| `data.SWISH_M.desc` | `string` | Brief description of the payment attempt |
| `data.SWISH_M.swish_payment_reference` | `string` | Reference to swish payment. Used when identifying a payment in contacts with swish. |
| `data.SWISH_M.swish_payment_request_token` | `string` | Token passed to swish app when performing a `SWISH_M` payment. |
| `data.SWISH_M.swish_error_code` | `string` | Error code as presented by swish in case of error. |
| `data.SWISH_M.swish_error_message` | `string` | Human readable error message that explains the swish error code. |
| `data.SWISH_M.swish_additional_information` | `string` | Additional information about error. |
| `data.SWISH_M.swish_status` | `string` | Latest known status of payment from swish. |
| `data.SWISH_M.swish_date_created` | `string` | Date when payment was created in swish system. |
| `data.SWISH_M.swish_date_paid` | `string` | Date when payment was paid in swish system. |
| `data.SWISH_E` | `string` | Same as for `data.SWISH_M`. |

