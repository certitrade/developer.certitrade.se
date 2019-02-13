---
title: Swish
date: "2019-02-13"
weight: 120
menu: 
    main:
        parent: merchant-reference-resources
---
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
