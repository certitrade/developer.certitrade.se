---
title: "Resources"
date: "2019-01-28"
weight: 20
menu: 
    main:
        parent: merchant-reference
---

The resource representations described in this section have data fields that are handled in different ways. Each field has one or more attributes that describe how you can interact with it.

  

**Attribute**

**Description**

A

Auto – CertiTrade sets this field.

C

Create – The field can be set when you create a resource.

U

Update – The field can be set when you update a resource.

M

Mandatory – Combined with another field attribute to make it mandatory.

**Example 1:**

  

**Variable**

**Type**

**Description**

id

A

int

Resource ID

The field _id_ is set automatically by the system.

**Example 2:**

  

**Variable**

**Type**

**Description**

amount

CM

int

The transaction amount

It is mandatory to also send the field _amount_ when creating the resource.

**Example 3:**

  

**Variable**

**Type**

**Description**

state

A, U

string

The state of the resource

The field _state_ is set by the system when the resource is created and can then be updated using a PUT request.

1.  merchant
    --------
    

Represents a merchant in CertiTrade’s system

**URL** : /merchant/\[id\]

**Searchable parameters:** _agent_ , _state, manual\_capture_

  

**Variable**

**Type**

**Description**

id

A

int

Resource ID

created

A

string

Date that the merchant was created

state

A, U

string

The merchant’s state. Possible values are “ACTIVE” or “INACTIVE”.

agent

A

int

The agent to which the merchant belongs

company\_name

CM, U

string

Company name. Max. 50 characters.

company\_webpage

C, U

string

The company’s website. Max. 128 characters.

signatory

C, U

string

Name of company signatory. Max. 50 characters.

org\_number

C, U

string

Corporate registration number. Max. 50 characters.

address1

C, U

string

Address 1. Max. 50 characters.

address2

C, U

string

Address 2. Max. 50 characters.

zip

C, U

string

Zip code. Max. 50 characters.

city

C, U

string

City. Max. 50 characters.

country

C, U

string

Country. Max. 50 characters.

phone

C, U

string

Telephone number. Max. 50 characters.

max\_payment\_attempts

C, U

int

Max. number of payment attempts

paywin\_caption

C, U

string

Text shown in the payment window. Max. 50 characters.

manual\_capture

C, U

int

Whether or not payments must be approved manually. (0/1)

email

A, U

array

Registered email addresses for merchant for different purposes.

email.OFFICE

A, U

string

Email address for office. Max. 128 characters.

email.ALARM

A, U

string

Email address for emergencies. Max. 128 characters.

email.INVOICE

A, U

string

Email address for invoicing. Max. 128 characters.

contacts

A, U

array

Registered contacts for merchant for different purposes.

contacts.TECH

A, U

array

contacts.TECH.name

A, U

string

Name of contact person for technical matters. Max. 50 characters.

contacts.TECH.phone

A, U

string

Telephone number of contact person for technical matters. Max. 50 characters.

contacts.TECH.email

A, U

string

Email address of contact person for technical matters. Max. 128 characters.

contacts.ADMIN

A, U

array

contacts. ADMIN.name

A, U

string

Name of contact person for admin. matters. Max. 50 characters.

contacts. ADMIN.phone

A, U

string

Telephone number of contact person for admin. matters. Max. 50 characters.

contacts. ADMIN.email

A, U

string

Email address of contact person for admin. matters. Max. 128 characters.

\_links

A

collection

Resource-related links

self

A

string

The resource’s unique URL

\_embedded

A

collection

None

2.  agent
    -----
    

Represents an administrator in the system, e.g. a distributor or a CertiTrade administrator.

**URL** : /agent/\[id\]

**Searchable parameters** : _parent_, _state_

  

**Variable**

**Type**

**Description**

id

A

int

Resource ID

created

A

string

Date that the agent was created

state

A, U

string

State variable. Possible values are “ACTIVE” or “INACTIVE”.

\_links

A

collection

Resource-related links

self

A

string

The resource’s unique URL

\_embedded

A

collection

None

3.  descriptor
    ----------
    

**URL** : /descriptor/\[id\]

**Searchable parameters** : _merchant_, _state, method, currencies_

  

**Variable**

**Type**

**Description**

id

A

int

Resource ID

created

A

string

Date that the descriptor was created

state

A, U

string

State variable. Possible values are “ACTIVE” or “INACTIVE”.

merchant

CM

int

Merchant that owns the descriptor

currencies

CM, U

array

List of the currencies that the descriptor can use. Each element is the alphabetic code for one of the _Currencies_ – see table 5.2

method

CM

string

The descriptor’s payment method. Max. 20 characters.

data

A, U

array

Contains payment method-specific data that is required in order to make payments using the specified payment method _method_.

data.CARD.acquirer\_agreement

A, U

int

The acquirer\_agreement resource that is associated with this descriptor.

data.RECURRING.acquirer\_agreement

A, U

int

The acquirer\_agreement resource that is associated with this descriptor.

data.ONE\_CLICK.acquirer\_agreement

A, U

int

The acquirer\_agreement resource that is associated with this descriptor.

data.INVOICE\_SVEA.client\_no

A, U

int

Svea WebPay client number.

data.INVOICE\_SVEA.username

A, U

string

Svea WebPay username. Max. 20 characters.

data.INVOICE\_SVEA.password

A, U

string

Svea WebPay password. Max. 20 characters.

data.DIRECT\_PAYEX.account\_number

A, U

int

PayEx account number

data.DIRECT\_PAYEX.account\_number

A, U

string

PayEx account key. Max. 64 characters.

data.INVOICE\_PAYEX.account\_number

A, U

int

PayEx account number

data.INVOICE\_PAYEX.account\_number

A, U

string

PayEx account key. Max. 64 characters.

data.PARTPAY\_PAYEX.account\_number

A, U

int

PayEx account number

data.PARTPAY\_PAYEX.account\_number

A, U

string

PayEx account key. Max. 64 characters.

\_links

collection

Resource-related links

self

string

The resource’s unique URL

merchant

string

URL for merchant

\_embedded

collection

None

4.  payment
    -------
    

**URL** : /payment/\[id\]

**Searchable parameters** : _merchant, amount, currency, method, reference, state, language, payment\_account_

  

**Variable**

**Type**

**Description**

id

A

int

Resource ID

created

A

string

Date that the payment was created

state

A, U

string

State variable. See table _payment_ _–_ _state._

amount

CM, U

int

Amount in the currency’s smallest unit (e.g. öre for SEK). Can be changed when _state_ is “WAITING\_FOR\_APPROVAL” or “READY\_FOR\_CAPTURE” in order to change the amount that is to go on to be captured.

authorized\_amount

A

int

Amount that has been authorized. Set on successful authorization.

currency

CM

string

Currency code according to ISO 4217.

language

C

string

Language code according to ISO 639-1. If not specified, Swedish (_‘__sv__’_) is used. See table _5.1 Languages_

merchant

A

int

The merchant that the payment belongs to

method

CM

string

The payment method to be used.

reference

C, U

string

The merchant’s reference, shown in the payment window. Max. 64 characters.

description

C, U

string

A more detailed description of the payment, shown in the payment window. Max. 64 characters.

payment\_attempts

A

array<payment\_attempt>

Array of payment attempts. See table _payment\_attempt_.

return\_url

CM

string

URL to which the buyer is to be sent when the payment is complete. Max. 256 characters.

callback\_url

CM

string

URL to which callbacks concerning the payment are to be sent. Max. 256 characters.

customer

C

customer

Information about the customer. See table _customer_ .

products

C, U

array<product>

Array of products. See table _product_.

data

C

array

Specifies payment method-specific data. The fields that are accessible (if any) will depend on which payment method _method_ has been specified.

data.RECURRING.initialize

CM

int

Whether or not the payment is an initializing RECURRING payment (0/1).

data.RECURRING.payment\_account

CM

string

The payment\_account that is to be used for this payment.

data.ONE\_CLICK.payment\_account

CM

string

The payment\_account that is to be used for this payment.

data.INVOICE\_SVEA.order\_id

CM

int

Merchant’s order ID that is shown on the invoice

data.INVOICE\_SVEA.order\_number

A

int

Svea’s order\_number

data.INVOICE\_SVEA.authorize\_id

A

int

Svea’s authorize\_id

data.INVOICE\_SVEA.invoice\_number

A

int

Svea’s invoice number

data.INVOICE\_SVEA.invoice\_rejection\_code

A

string

Error code shown if an invoice cannot be created (i.e. CAPTURE failed)

data.INVOICE\_SVEA.due\_date

A

string

Date that the invoice is due for payment

data.INVOICE\_SVEA.expiration\_date

A

string

Date that the order expires

data.INVOICE\_SVEA.customer\_id

A

int

Svea’s customer\_id

data.INVOICE\_SVEA.will\_buy\_invoices

A

int

If Svea will buy the invoice

data.DIRECT\_PAYEX.bank

CM

string

Which bank the direct payment is being made to. Must be one of the identifiers in the table _bank_ _–_ _DIRECT\_PAYEX_

data.INVOICE\_PAYEX.order\_id

CM

string

The shop’s order\_id as specified when the payment was created

data.INVOICE\_PAYEX.capture\_transaction\_number

A

int

PayEx transaction number for capture

data.INVOICE\_PAYEX.capture\_error\_code

A

string

PayEx error code for failed capture

data.INVOICE\_PAYEX.capture\_error\_description

A

string

Description of error in the event of failed capture

data.PARTPAY\_PAYEX

\--

Has the same fields as INVOICE\_PAYEX. See data.INVOICE\_PAYEX.

data.SWISH\_E.payer\_phone\_number

A

string

Swish registered phone number for the payer.

\_links

A

collection

Resource-related links

self

A

string

The resource’s unique URL

merchant

A

string

URL for merchant

paywin

A

string

URL for the payment window (to which the customer is to be forwarded)

\_embedded

A

collection

None

**customer**

  

**Variable**

**Type**

**Description**

security\_number

string

Civil/corporate registration number. Max. 64 characters.

name

string

Name. Max. 50 characters.

company\_name

string

Company name. Max. 50 characters.

address1

string

First address field. Max. 50 characters.

address2

string

Second address field. Max. 50 characters.

address3

string

Third address field. Max. 50 characters.

zip\_code

string

Zip code. Max. 50 characters.

city

string

City. Max. 50 characters.

region

string

Region/state. Max. 50 characters.

country

string

Country. Max. 50 characters.

email

string

Email address. Max. 128 characters.

phone

string

Telephone number. Max. 50 characters.

**product**

  

**Variable**

**Type**

**Description**

line\_ordering

int

Describes the relative order of the products in the representation, from 1 upward. Products with lower numbers are shown first.

product\_reference

string

Product reference. Max. 50 characters.

product\_name

string

Product name. Max. 50 characters.

price

int

The product’s price in the same currency as Payment’s _currency_

quantity

int

Quantity of products of this type

quantity\_unit

string

Unit of measurement for the product. Max. 50 characters.

vat\_rate

string

VAT in percent to two decimal places

vat\_included

int

Flags (0/1) whether or not VAT is included in the price

**payment\_attempt**

  

**Variable**

**Type**

**Description**

created

string

Date and time that the payment attempt was made

result

int

Whether or not the payment attempt was successful. (0/1)

method

string

The descriptor’s payment method

computers

array

Contains data on the payment attempt that is specific to the payment method that was used. The fields that are accessible will depend on which payment method _method_ was specified.

data.CARD.desc

string

Brief description of the payment attempt. See table _description_ _–_ _CARD_.

data.CARD.authcode

string

Authorization code. Max. 10 characters.

data.CARD.respcode

string

String that describes the result of the authorization. 00 is successful, otherwise error. Max. 5 characters.

data.CARD.masked\_cardno

string

Masked card number showing the last 4 digits in plain text. Max. 50 characters.

data.CARD.bin

string

First 6 digits of the card number. Max. 6 characters.

data.CARD.cardholder\_name

string

Cardholder’s name as entered in the payment window. Max. 50 characters.

data.RECURRING

\--

Same field as for CARD. See data.CARD.

data.ONE\_CLICK

\--

Same field as for CARD. See data.CARD.

data.INVOICE\_SVEA.rejection\_code

string

Brief description of the reason the payment attempt failed. Max. 50 characters.

data.INVOICE\_SVEA.customer\_type

string

Type of customer. Only “Person” or “Business”.

data.INVOICE\_SVEA.customer

customer

The customer’s personal details as used in the payment attempt. See table _customer_.

data.DIRECT\_PAYEX.desc

string

Brief description of the payment attempt. See table _description_ _–_ _DIRECT\_PAYEX_

data.DIRECT\_PAYEX. transaction\_number

int

PayEx transaction number

data.DIRECT\_PAYEX. fraud\_data

int

If PayEx suspects fraud (0/1)

data.INVOICE\_PAYEX.desc

string

Brief description of the payment attempt. See table_description_ _–_ _INVOICE\_PARTPAY\_PAYEX_

data.INVOICE\_PAYEX.error\_code

string

Error code from PayEx that explains failed payment attempt. Max. 50 characters.

data.INVOICE\_PAYEX.error\_description

string

More detailed error description from PayEx for failed payment attempt. Max. 50 characters.

data.INVOICE\_PAYEX.authorize\_transaction\_number

int

PayEx transaction number

data.INVOICE\_PAYEX.customer

customer

The customer’s personal details as used in the payment attempt. See table _customer_.

data.PARTPAY\_PAYEX

\--

Same as for PayEx.INVOICE\_PAYEX.

data.SWISH\_M.desc

string

Brief description of the payment attempt

data.SWISH\_M.swish\_payment\_reference

string

Reference to swish payment. Used when identifying a payment in contacts with swish.

data.SWISH\_M.swish\_payment\_request\_token

string

Token passed to swish app when performing a SWISH\_M payment.

data.SWISH\_M.swish\_error\_code

string

Error code as presented by swish in case of error.

data.SWISH\_M.swish\_error\_message

string

Human readable error message that explains the swish error code.

data.SWISH\_M.swish\_additional\_information

string

Additional information about error.

data.SWISH\_M.swish\_status

string

Latest known status of payment from swish.

data.SWISH\_M.swish\_date\_created

string

Date when payment was created in swish system.

data.SWISH\_M.swish\_date\_paid

string

Date when payment was paid in swish system.

data.SWISH\_E

string

Same as for data.SWISH\_M.

  
**description – CARD**

Definition of the values that _desc_ can have

  

**Value**

**Description**

PENDING

Starting state

3D\_AUTH

Authorization with fully authenticated 3-D Secure

3D\_ATTEMPT

Authorization with 3-D attempt

SSL\_AUTH

Authorization with card that is not enrolled in 3-D Secure

RECURRING\_AUTH

Authorization made as a recurring payment for a payment account

MOTO

MOTO authorization

3D\_FAILED

Failed 3-D authentication

AUTH\_FAILED

Authorization failed

USER\_CANCELLED

The payment was cancelled

INTERNAL\_ERROR

Internal error

TIMEOUT

Time allowed in the payment system was exceeded

SESSION\_INVALID

Payment session was cancelled due to abnormal behavior

ACCOUNT\_TERMINATED

The authorization failed and the payment\_account associated with the payment has been SUSPENDED.

**description** **–** **DIRECT\_PAYEX**

Definition of the values that _desc_ can have

  

**Value**

**Description**

CREATED

Starting state

INITIALIZED

Payment attempt initialized

PREPARED

Preparing to direct the customer to bank

REDIRECTED\_TO\_BANK

The customer has been directed to the bank

CANCELLED

The customer cancelled the payment attempt

FAILED

The payment attempt failed

PAID

The payment has been made

**description** **–** **INVOICE\_PARTPAY\_PAYEX**

Definition of the values that _desc_ can have

  

**Value**

**Description**

WAITING\_FOR\_CUSTOMER\_CONTRACT

Starting state. Waiting for the customer to fill in the contract (PARTPAY\_PAYEX only)

WAITING\_FOR\_CUSTOMER\_CONFIRM

Waiting for the customer to confirm the purchase

WAITING\_FOR\_CUSTOMER\_SECURITY\_NUMBER

Waiting for the customer to fill in the contract (INVOICE\_PAYEX only)

AUTHORIZED

The purchase is approved, the payment can be placed in CAPTURED for completion

USER\_CANCELLED

The user chose to cancel the payment attempt

FAILED

The payment attempt failed

**Description – SWISH\_E/SWISH\_M**

  

**Value**

**Description**

CREATED

The payment has been created at Certitrade

PAYMENT\_REQUEST\_SENT

Payment request to Swish has been sent.

WAITING\_FOR\_SWISH\_RESULT

Payment request to Swish has been answered and certitrade waits for callback from Swish.

PAID

The callback arrived and the payment is paid.

CANCELLED\_BY\_USER

The user chose to cancel the payment in swish app .

FAILED

There was an error during the payment process.

BANK\_TIME\_OUT

There was an error in the communication between swish and merchants bank.

**bank – DIRECT\_PAYEX**

List of allowed banks and the currency that they support.

  

**Identifier**

**Permitted currency**

**Description**

FSPA

SEK

Swedbank

NB

SEK

Nordea Bank

SEB

SEK

Skandinaviska Enskilda Bank

SHB

SEK

Handelsbanken

NB:DK

DKK

Nordea Bank DK

DDB

DKK

Den Danske Bank

BAX

NOK

BankAxess

SAMPO

EUR

AKTIA

EUR

SP

EUR

POP

EUR

OP

EUR

NB:FI

EUR

Nordea Bank FI

SHB:FI

EUR

Handelsbanken FI

SPANKKI

EUR

TAPIOLA

EUR

AALAND

EUR

Ålandsbanken

**payment – state**

Definition of the states that a payment can have

  

**State**

**Description**

CREATED

Starting state. Payment has been created but the payment window link has not been opened

PENDING

The payment link has been opened, no successful authorization has been given

WAITING\_FOR\_APPROVAL

Authorized payment is awaiting approval in order to be captured

READY\_FOR\_CAPTURE

The payment will be captured during the coming night

CAPTURED

The payment has been captured

CANCELLED

The authorization has been reversed

FAILED

The payment failed

  

  
  

5.  payment\_account
    ----------------
    

Account used for RECURRING and ONE\_CLICK payments.

**URL** : /payment\_account/\[id\]

**Searchable parameters** : _merchant, state, type_

  

**Variable**

**Type**

**Description**

id

A

int

Resource ID

created

A

string

Date that the account was created

state

A, U

string

State variable. See table _payment\_account_ _–_ _state_.

merchant

A

int

Merchant that owns the account

payment

CM, A

int

The payment used to initialize the account. To be specified only if _type_ is ”ONE\_CLICK”.

type

CM

string

Specifies type of account (“RECURRING” or “ONE\_CLICK”)

expiry\_date

A

string

Year and month that the account expires. Max. 10 characters.

masked\_cardno

A

string

Masked card number showing the last four digits. Max. 50 characters.

bin

A

string

The card’s bin number (first 6 digits). Max. 6 characters.

\_links

A

collection

Resource-related links

self

A

string

URL for descriptor

merchant

A

string

URL for merchant

\_embedded

A

collection

None

**payment\_account – state**

  

**State**

**Description**

UNINITIALIZED

The initial state of RECURRING accounts. No initial transaction has been made

ACTIVE

The initial state of ONE\_CLICK accounts. The account has been initialized and can be used for transactions. Set automatically when a payment linked to this account is successfully authorized.

CLOSED

The account has been closed and cannot be used for transactions. Can be set by merchant or by the system if fraud is suspected.

  
  

------

6.  refund
    ------
    

Refunds of a payment

**URL** : /payment/\[paymentId\]/refund/\[id\]

**Searchable parameters** : --

  

**Variable**

**Type**

**Description**

id

A

int

Resource ID

created

A

string

Date that the refund was created

state

A, U

string

State variable, see table _refund_ _–_ _state_

amount

CM, U

int

Refund amount in the payment currency’s smallest unit (e.g. öre for SEK). Can only be changed while _state_ is _PENDING_.

\_links

A

collection

Resource-related links

self

A

string

The resource’s unique URL

payment

A

string

URL for payment

\_embedded

A

collection

None

**refund – state**

  

**State**

**Description**

PENDING

The initial state. The refund will be made during the coming night

DONE

The refund has been made

CANCELLED

The refund was cancelled. Can be set by merchant.

FAILED

The refund failed

7.  acquirer\_agreement
    -------------------
    

Represents an acquirer agreement for card payments. Needs to be linked to a Descriptor before card payments can be made.

**URL** : /acquirer\_agreement/\[id\]

**Searchable parameters** : _merchant, state, agent_

  

**Variable**

**Type**

**Description**

contract\_id (id)

CM

int

Resource ID plus acquirer contract number with bank

created

A

string

Date that the resource was created

state

A, U

string

State variable. Possible values are “ACTIVE” or “INACTIVE”.

merchant

CM

int

The merchant that owns acquirer\_agreement

contract\_type

CM

string

Specifies the transaction type, “ECOM” for eCommerce or ”MOTO” for mail order/telephone order.

acquirer

CM

string

Name of acquiring bank. Only “EUROLINE”, “HANDELSBANKEN”, “NORDEA”, “SWEDBANK”, “TELLER” or “CLEARHAUS”.

processor

CM

string

Name of card processor. Only “EVRY” or “CLEARHAUS”.

3d

A, U

array

3-D details

3d.company\_name

A, U

string

Company name that is presented when the customer is forwarded to the bank’s 3-D page. Max. 25 characters.

3d.company\_url

A, U

string

Company URL that is used in the 3-D Secure process. Max. 128 characters.

3d.country\_code

A, U

string

Country code that is used in the 3-D Secure process.

Only three-digit numeric ISO 3166-1.

3d.acq\_bin\_visa

A, U

string

Identifies the acquirer at Visa. Max. 6 characters.

3d.acq\_bin\_mc

A, U

string

Identifies the acquirer at Mastercard. Max. 6 characters.

3d.visa\_active

A, U

int

Specifies whether Verified by Visa is activated. (0/1)

3d.mastercard\_active

A, U

int

Specifies whether Mastercard SecureCode is activated. (0/1)

flags

A, U

array

Settings for the payment window for card payments

flags.DISPLAY\_VISA

A, U

int

Whether or not the Visa logo is to be shown in the payment window. (0/1)

flags.DISPLAY\_MASTERCARD

A, U

int

Whether or not the Mastercard logo is to be shown in the payment window. (0/1)

flags.DISPLAY\_AMEX

A, U

int

Whether or not the Amex logo is to be shown in the payment window. (0/1)

flags.DISPLAY\_DINERS

A, U

int

Whether or not the Diners logo is to be shown in the payment window. (0/1)

flags.COLLECT\_CARDHOLDER\_NAME

A, U

int

Whether the customer’s name is to be stated in the payment window. (0/1)

flags.SHOW\_CANCEL\_BUTTON

A, U

int

Whether a Cancel button is to be shown in the payment window. (0/1)

\_links

A

collection

Resource-related links

self

A

string

The resource’s unique URL

payment

A

string

URL for payment

\_embedded

A

collection

None

 