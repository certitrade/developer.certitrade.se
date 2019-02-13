---
title: Product
date: "2019-02-13"
weight: 70
menu: 
    main:
        parent: merchant-reference-resources
---
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
