---
title: Merchant
date: "2019-02-13"
weight: 20
menu: 
    main:
        parent: merchant-reference-resources
---

Represents a merchant in Certitrade’s system

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
| `contacts.TECH.email` | A, U | `string` | Email address of contact person for technical matters. Max. 128 characters. |
| `contacts.ADMIN` | A, U | `object` |  contacts. ADMIN.name | A, U | `string` | Name of contact person for admin. matters. Max. 50 characters. |
| `contacts.ADMIN.phone` | A, U | `string` | Telephone number of contact person for admin. matters. Max. 50 characters. |
| `contacts.ADMIN.email` | A, U | `string` | Email address of contact person for admin. matters. Max. 128 characters. |
| `_links` | A | `collection` | Resource-related links |
| `self` | A | `string` | The resource’s unique URL |
| `_embedded` | A | `collection` | None |
