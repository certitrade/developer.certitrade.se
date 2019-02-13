---
title: Agent
date: "2019-02-13"
weight: 30
menu: 
    main:
        parent: merchant-reference-resources
---

Represents an administrator in the system, e.g. a distributor or a CertiTrade administrator.

**URL** : `/agent/[id]`
**Searchable parameters** : `parent`, `state`

| Variable | Attribute | Type   | Description               |
|----------|-----------|--------|---------------------------|
| `id` | A | `int` | Resource ID |
| `created` | A | `string` | Date that the agent was created |
| `state` | A, U | `string` | State variable. Possible values are `ACTIVE` or `INACTIVE`. |
| `_links` | A | `collection` | Resource-related links |
| `self` | A | `string` | The resource’s unique URL |
| `_embedded` | A | `collection` | None |

