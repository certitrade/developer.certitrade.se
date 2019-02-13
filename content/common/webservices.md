---
title: "Web Services"
date: "2019-01-28"
weight: 10
menu: 
    main:
        parent: common
        name: Web Services
---

This document concerns the web services that exist for Certitrade Merchant API. Note that the authentication information may differ between the various web services.

# Test
## API URL
The test system is used for integration testing and is accessed via the following URL:
```
https://apitest.certitrade.net/ctpsp/ws/2.0
```
## Callback IP
The following outgoing IP is used to send callbacks to merchants: 195.178.165.212

# Production
## API URL
The production system is accessed via the following URL: 
```
https://api.certitrade.net/ctpsp/ws/2.0
```
## Callback IP
The following IPs are used to send callbacks to merchants: 195.110.44.185 – 195.110.44.190 and 195.110.45.178.
