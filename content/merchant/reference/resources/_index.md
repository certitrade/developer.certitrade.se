---
title: "Resources"
date: "2019-01-28"
weight: 20
menu: 
    main:
        identifier: merchant-reference-resources
        parent: merchant-reference
---
The resource representations described in this section have data fields that are handled in different ways. Each field has one or more attributes that describe how you can interact with it.

| Attribute | Description |
|----|----|
| A | Auto – CertiTrade sets this field. |
| C | Create – The field can be set when you create a resource. |
| U | Update – The field can be set when you update a resource. |
| M | Mandatory – Combined with another field attribute to make it mandatory. |

# Example 1

| Variable | Attribute | Type | Description |
|----------|-----------|------|-------------|
| `id`     | A         | int  | Resource ID |

The field `id` is set automatically by the system.

# Example 2

| Variable | Attribute | Type | Description            |
|----------|-----------|------|------------------------|
| `amount` | C, M      | int  | The transaction amount |

It is mandatory to also send the field `amount` when creating the resource.

# Example 3

| Variable | Attribute | Type   | Description               |
|----------|-----------|--------|---------------------------|
| `state`  | A, U      | `string` | The state of the resource |

The field `state` is set by the system when the resource is created and can then be updated using a PUT request.