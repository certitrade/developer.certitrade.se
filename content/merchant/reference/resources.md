---
title: "Resources"
date: "2019-01-28"
weight: 20
menu: 
    main:
        parent: merchant-reference
---

The resource representations described in this section have data fields that are handled in different ways. Each field has one or more attributes that describe how you can interact with it.

| Attribute | Description |
|----|----|
| A | Auto – CertiTrade sets this field. |
| C | Create – The field can be set when you create a resource. |
| U | Update – The field can be set when you update a resource. |
| M | Mandatory – Combined with another field attribute to make it mandatory. |

#### Example 1:

| Variable | Attribute | Type | Description |
|----------|-----------|------|-------------|
| `id`     | A         | int  | Resource ID |

The field `id` is set automatically by the system.

#### Example 2:

| Variable | Attribute | Type | Description            |
|----------|-----------|------|------------------------|
| `amount` | C, M      | int  | The transaction amount |

It is mandatory to also send the field `amount` when creating the resource.

#### Example 3:

| Variable | Attribute | Type   | Description               |
|----------|-----------|--------|---------------------------|
| `state`  | A, U      | `string` | The state of the resource |

The field `state` is set by the system when the resource is created and can then be updated using a PUT request.

# `merchant`

Represents a merchant in CertiTrade’s system

**URL** : `/merchant/[id]`
**Searchable parameters:** `agent` , `state`, `manual_capture`

| Variable | Attribute | Type   | Description               |
|----------|-----------|--------|---------------------------|
| `id` | A | `int` | Resource ID |
| `created` | A | `string` | Date that the merchant was created |
| `state` | A, U | `string` | The merchant’s state. Possible values are “ACTIVE” or “INACTIVE”. |
| `agent` | A | `int` | The agent to which the merchant belongs |
| `company_name` | C, M, U | `string` | Company name. Max. 50 characters. |
| `company_webpage` | C, U | `string` | The company’s website. Max. 128 characters. |
| `signatory` | C, U | `string` | Name of company signatory. Max. 50 characters. |
| `org_number` | C, U | `string` | Corporate registration number. Max. 50 characters. |
| `address1` | C, U | `string` | Address 1. Max. 50 characters. |
| `address2` | C, U | `string` | Address 2. Max. 50 characters. |
| `zip` | C, U | `string` | Zip code. Max. 50 characters. |
| `city` | C, U | `string` | City. Max. 50 characters. |
| `country` | C, U | `string` | Country. Max. 50 characters. |
| `phone` | C, U | `string` | Telephone number. Max. 50 characters. |
| `max_payment_attempts` | C, U | `int` | Max. number of payment attempts |
| `paywin_caption` | C, U | `string` | Text shown in the payment window. Max. 50 characters. |
| `manual_capture` | C, U | `int` | Whether or not payments must be approved manually. (0/1) |
| `email` | A, U | `object` | Registered email addresses for merchant for different purposes. |
| `email.OFFICE` | A, U | `string` | Email address for office. Max. 128 characters. |
| `email.ALARM` | A, U | `string` | Email address for emergencies. Max. 128 characters. |
| `email.INVOICE` | A, U | `string` | Email address for invoicing. Max. 128 characters. |
| `contacts` | A, U | `object` | Registered contacts for merchant for different purposes. |
| `contacts.TECH` | A, U | `object` |  contacts.TECH.name | A, U | `string` | Name of contact person for technical matters. Max. 50 characters. |
| `contacts.TECH.phone` | A, U | `string` | Telephone number of contact person for technical matters. Max. 50 characters. |
| `contacts`.TECH.email` | A, U | `string` | Email address of contact person for technical matters. Max. 128 characters. |
| `contacts.ADMIN` | A, U | `object` |  contacts. ADMIN.name | A, U | `string` | Name of contact person for admin. matters. Max. 50 characters. |
| `contacts.ADMIN.phone` | A, U | `string` | Telephone number of contact person for admin. matters. Max. 50 characters. |
| `contacts.ADMIN.email` | A, U | `string` | Email address of contact person for admin. matters. Max. 128 characters. |
| `_links` | A | collection | Resource-related links |
| `self` | A | `string` | The resource’s unique URL |
| `_embedded` | A | collection | None |

# `agent`

Represents an administrator in the system, e.g. a distributor or a CertiTrade administrator.

**URL** : `/agent/[id]`
**Searchable parameters** : `parent`, `state`

| Variable | Attribute | Type   | Description               |
|----------|-----------|--------|---------------------------|
| `id` | A | `int` | Resource ID |
| `created` | A | `string` | Date that the agent was created |
| `state` | A, U | `string` | State variable. Possible values are `ACTIVE` or `INACTIVE`. |
| `_links` | A | collection | Resource-related links |
| `self` | A | `string` | The resource’s unique URL |
| `_embedded` | A | collection | None |

# `descriptor`

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
| `_links` | A | collection | Resource-related links |
| `self` | A | `string` | The resource’s unique URL |
| `merchant` | A |string | URL for merchant |
| `_embedded` | A | collection | None |

 # `payment`

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
| `customer` | C | customer | Information about the customer. See table _customer_ . |
| `products` | C, U | product[] | Array of products. See table _product_. |
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
| `_links` | A | collection | Resource-related links |
| `self` | A | `string` | The resource’s unique URL |
| `merchant` | A | `string` | URL for merchant |
| `paywin` | A | `string` | URL for the payment window (to which the customer is to be forwarded) |
| `_embedded` | A | collection | None |

# `customer`

| Variable | Type   | Description               |
|----------|--------|---------------------------|
| `security_number` | `string` | Civil/corporate registration number. Max. 64 characters. |
| `name` | `string` | Name. Max. 50 characters. |
| `company_name` | `string` | Company name. Max. 50 characters. |
| `address1` | `string` | First address field. Max. 50 characters. |
| `address2` | `string` | Second address field. Max. 50 characters. |
| `address3` | `string` | Third address field. Max. 50 characters. |
| `zip_code` | `string` | Zip code. Max. 50 characters. |
| `city` | `string` | City. Max. 50 characters. |
| `region` | `string` | Region/state. Max. 50 characters. |
| `country` | `string` | Country. Max. 50 characters. |
| `email` | `string` | Email address. Max. 128 characters. |
| `phone` | `string` | Telephone number. Max. 50 characters. |

# `product`

| Variable | Type   | Description               |
|----------|--------|---------------------------|
| `line_ordering` | `int` | Describes the relative order of the products in the representation, from 1 upward. Products with lower numbers are shown first. |
| `product_reference` | `string` | Product reference. Max. 50 characters. |
| `product_name` | `string` | Product name. Max. 50 characters. |
| `price` | `int` | The product’s price in the same currency as Payment’s _currency_ |
| `quantity` | `int` | Quantity of products of this type |
| `quantity_unit` | `string` | Unit of measurement for the product. Max. 50 characters. |
| `vat_rate` | `string` | VAT in percent to two decimal places |
| `vat_included` | `int` | Flags (0/1) whether or not VAT is included in the price |

# `payment_attempt`

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

# Description – `CARD`

Definition of the values that _desc_ can have

| Value | Description |
|-------|-------------|
| `PENDING` | Starting state |
| `3D_AUTH` | Authorization with fully authenticated 3-D Secure |
| `3D_ATTEMPT` | Authorization with 3-D attempt |
| `SSL_AUTH` | Authorization with card that is not enrolled in 3-D Secure |
| `RECURRING_AUTH` | Authorization made as a recurring payment for a payment account |
| `MOTO` | MOTO authorization |
| `3D_FAILED` | Failed 3-D authentication |
| `AUTH_FAILED` | Authorization failed |
| `USER_CANCELLED` | The payment was cancelled |
| `INTERNAL_ERROR` | Internal error |
| `TIMEOUT` | Time allowed in the payment system was exceeded |
| `SESSION_INVALID` | Payment session was cancelled due to abnormal behavior |
| `ACCOUNT_TERMINATED` | The authorization failed and the `payment_account` associated with the payment has been SUSPENDED. |

# Description – `DIRECT_PAYEX`

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

# Description – `INVOICE_PARTPAY_PAYEX`

Definition of the values that _desc_ can have

| Value | Description |
|-------|-------------|
| `WAITING_FOR_CUSTOMER_CONTRACT` | Starting state. Waiting for the customer to fill in the contract (`PARTPAY_PAYEX` only). |
| `WAITING_FOR_CUSTOMER_CONFIRM` | Waiting for the customer to confirm the purchase. |
| `WAITING_FOR_CUSTOMER_SECURITY_NUMBER` | Waiting for the customer to fill in the contract (`INVOICE_PAYEX` only). |
| `AUTHORIZED` | The purchase is approved, the payment can be placed in CAPTURED for completion. |
| `USER_CANCELLED` | The user chose to cancel the payment attempt. |
| `FAILED` | The payment attempt failed. |

# Description – `SWISH_E` / `SWISH_M`

| Value | Description |
|-------|-------------|
| `CREATED` | The payment has been created at Certitrade. |
| `PAYMENT_REQUEST_SENT` | Payment request to Swish has been sent. |
| `WAITING_FOR_SWISH_RESULT` | Payment request to Swish has been answered and certitrade waits for callback from Swish. |
| `PAID` | The callback arrived and the payment is paid. |
| `CANCELLED_BY_USER` | The user chose to cancel the payment in swish app. |
| `FAILED` | There was an error during the payment process. |
| `BANK_TIME_OUT` | There was an error in the communication between swish and merchants bank. |

# bank – `DIRECT_PAYEX`

List of allowed banks and the currency that they support.

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

# `payment_account`

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
| `_links` | A | collection | Resource-related links. |
| `self` | A | `string` | URL for descriptor. |
| `merchant` | A | `string` | URL for merchant. |
| `_embedded` | A | collection | None. |

# `payment_account` – state

| State | Description |
|-------|-------------|
| `UNINITIALIZED`| The initial state of RECURRING accounts. No initial transaction has been made|
| `ACTIVE`| The initial state of `ONE_CLICK` accounts. The account has been initialized and can be used for transactions. Set automatically when a payment linked to this account is successfully authorized. |
| `CLOSED`| The account has been closed and cannot be used for transactions. Can be set by merchant or by the system if fraud is suspected.|

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
| _links | A | collection | Resource-related links |
| self | A | `string` | The resource’s unique URL |
| payment | A | `string` | URL for payment |
| _embedded | A | collection | None |

# `refund` – state

| State | Description |
|-------|-------------|
| `PENDING` | The initial state. The refund will be made during the coming night. |
| `DONE` | The refund has been made. |
| `CANCELLED` | The refund was cancelled. Can be set by merchant. |
| `FAILED` | The refund failed. |

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
| `_links` | A | collection | Resource-related links. |
| `self` | A | `string` | The resource’s unique URL. |
| `payment` | A | `string` | URL for payment. |
| `_embedded` | A | collection | None. |
 