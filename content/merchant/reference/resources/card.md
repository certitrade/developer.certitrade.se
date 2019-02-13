---
title: Card
date: "2019-02-13"
weight: 90
menu: 
    main:
        parent: merchant-reference-resources
---

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
