---
title: "Concepts and Definitions"
date: "2019-01-28"
weight: 10
menu: 
    main:
        parent: merchant-reference
        name: Concepts
---
## Actors
Definitions of the actors that occur in the document:

| Actor | Description |
|-------|-------------|
| Merchant | The company that is a customer of Certitrade |
| Client | The merchant’s software that accesses the server via the API |
| Shop | The merchant’s web shop where the client is installed |
| Server | Certitrade’s system that processes the client’s requests |
| Customer | The person shopping in the merchant’s shop (the buyer) |

## REST

Certitrade API applies the principles of REST (REpresentational State Transfer) and has been built using what is known as resource-oriented architecture.

## Resources and collections

Resources are the fundamental concept in the API. A resource represents an object in the system. It could be a user or a payment, for example. All resources have a unique ID that is used to address a specific resource.

You can also address multiple resources simultaneously; for example, all resources that share a certain attribute. Such a group of resources is called a collection.

## URLs

A URL can either address a specific resource or a collection of resources.

All specific resources have a unique URL that has the format
```
resource/[id]
```
The URL `resource` addresses the collection of resources that is available to the user concerned. To restrict the collection or to carry out a search, you can use query parameters.

E.g. the URL
```
resource?state=1
```
addresses all resources of the type in question with the state 1

The URL can also reflect a resource hierarchy in which a subresource is only accessible under the resource to which it belongs, e.g.
```
resource/\[resourceId\]/subresource/\[subresourceId\]
```

## HTTP methods

Predefined HTTP methods are used to perform operations on resources and collections. No other function calls are made via the API.

The methods that can be applied to the API’s resources and collections are:

| Method | Description |
|--------|-------------|
| `GET` | Retrieves a representation of a resource or performs a query against a collection. |
| `POST` | Creates a new resource. |
| `PUT` | Changes data or the state of a resource. |
| `DELETE` | Deletes a resource. |
| `OPTIONS` | Provides information about a resource, e.g. about its representation and how the client can interact with it. |

For certain methods parameters also have to be included in the request, either in the query string or as data in the Content part of the call. This is specified further below.

## Security

Security is an important element of the API’s design. The main aspects are as follows:

* **Calls must be transferred securely**
    All communication therefore takes place via https.
* **The server must verify the client’s authorization**
    All calls must contain a signature in the Authorization header that the server uses to verify the authorization.
* **The client must verify the server’s identity**
    It is also important that the client verifies the server’s certificate. The example implementations show how this can be done.
* **Calls must be change-protected**
    The signature in the Authorization header is computed using the important parts of the message and a secret key that is known only by the client and server. A call therefore cannot be changed without making the signature invalid.

### API key

For authentication you need a secret key that is shared between client and server. This is called an API key and is used when computing the signature that is sent in the Authorization header.

Since the key is to be known only to the client and server, it is very important to protect it from unauthorized access in the client. Our example implementations show how this can be done in the source code.

### Date header

All requests are to have a Date header with a timestamp that states when the request was sent in the client . The timestamp is not only used in the request signature, but is also compared with the current time on the server. If the difference between the client and server timestamps is too great, the request will not be processed.

The Date header must have the following standardized format:

```
D, d M Y H:i:s GMT
```

Example:

```
Fri, 23 Nov 2002 09:50:36 GMT
```

### Authorization header

All calls to the API are authenticated via the Authorization header. This includes the following parameters:

| Parameter | Description |
|-----------|-------------|
| `userType` | 'm' for merchant, 'a' for agent |
| `userId` | merchant ID for merchant, agent ID for agent |
| `hashCode` | The request’s signature. hmac hash using sha256. For more info see section 1.6.4 hmac below. |

The header is then to be constructed as follows:

```
Authorization: Certitrade [userType][userId]:[hashCode]
```

#### Example:

```
Authorization: Certitrade m12345:8667325291105f69b32ad4ae8\[...\]
```

### HMAC
`hashCode` is computed using hmac with sha256 as the underlying hash function, and with the API key.

The following algorithm is used to produce the string that is to be used in the hash computation (+ here means concatenation).

```
[HTTP-metod] +
[Bas-URL] +
[Resurs-URL] +
[Datum (från date-header)] +
[HTTP-Content]
```

Example 1: Create a resource

```
'POST' +
'https://test/ctpsp/ws/2.0' +
'/testresurs' +
'_Fri, 23 Nov 2002 09:50:36 GMT' +
'{ "testparam" : "test" }'
```

Example 2: Retrieve a specific resource, 12345

```
'GET' +
'https://test/ctpsp/ws/2.0' +
'/testresurs/12345' +
'Fri, 23 Nov 2002 09:50:36 GMT' +
''
```

Example 3: Retrieve resources where "testparam" is "testval"

```
'GET' +
'https://test/ctpsp/ws/2.0' +
'/testresurs?testparam=testval' +
'Fri, 23 Nov 2002 09:50:36 GMT' +
```

## Data format

The data formats used to represent resources, collections and errors are presented here. The focus is on the aspects that are necessary for this API. For complete definitions see the references at the end of the document.

### JSON and UTF-8

In the HTTP messages, JSON is consistently used as the underlying data format in content, both in requests and responses.  
The API requires input data to have the character encoding UTF-8. This applies to both content and GET parameters. GET data may in turn also be url-encoded.  
In those calls that contain content (POST and PUT), the Content-Type header must be set as follows

```http
Content-Type: application/json
```

The character encoding is then assumed to be utf-8. A charset can be explicitly stated, but the only permitted value is then utf-8

```http
Content-Type: application/json; charset=utf-8
```

### HAL

Representations of resources and collections are described using HAL (Hypertext Application Language). HAL provides a structure that can clearly define linkability and recursive structures.

Responses from the API that have status codes 2xx and 3xx have content in HAL format. The character encoding is utf-8. The Content-Type header is then

```http
Content-Type: application/hal+json
```

The basic structure for HAL is as follows:  

```json
{
    "var1": "value1",
    "var2": "value2",
    .
    .
    .
    "varn": "valuen",
    "_links": {
        "link1": "url1",
        "link2": "url2",
        .
        .
        .
        "linkn": "urln"
    },
    "_embedded": [
        Embedded resources
    ]
}
```

Where `_embedded` can contain an array of subresources. Each such representation is also described using HAL.

A specific resource typically has the following representation:

```json
{
    "id": "ResourceId",
    "created": "<Date when the resource was created>",
    "state": "Resource state",
    "_links": {
        "self": "Resource url",
        "link2": "url2",
        .
        .
        .
        "linkn": "urln"
    },
    "_embedded": [
    ]
}
```

A collection of resources typically has the following representation:

```json
{
     "max_page_size": "",
     "_links": {
         "self": "Collection url",
         "next": "url2",
         "previous": "urln"
     },
     "_embedded": [ {
        "resources" :
            ...
         },
     ]
}
```

| Link | Description |
|------|-------------|
| self | The resource’s URL |
| next | The next page in the collection |
| previous | The previous page in the collection |

### API Problem

If an error occurs and the request cannot be executed, a data structure of the type API Problem is returned that describes what the error is. This applies to responses with a status code of 4xx or 5xx.

`Content-Type` is then set as follows:

```http
Content-Type: application/api-problem+json
```

The character encoding in the response is utf-8.

| Parameter | Mandatory | Description |
|---|---|---|
| `describedBy` | Yes | URL that refers to a description of the error. |
| `title` | Yes | Short title of the error. |
| `detail` | No | Detailed information about the error. |
| `httpStatus` | No | HTTP status code. |

#### Example

```json
{  
    "describedBy": "http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html",  
    "title": "Not authorized to access resource.",  
    "detail": null,  
    "httpStatus": 403
}
```

## OPTIONS

When a url is called using the HTTP method OPTIONS, this returns information about the resource or collection and what the client can do with it.

The Allow header contains a comma-separated list of the HTTP methods that are allowed.

The Content part contains data that describes the resource or collection. The top structure is as follows:

| Index | Description | Format
|-------|-------------|--------|
| url | Format of URL | string |
| description | Plain text description of the resource/collection | string |
| methods | Which HTTP methods are applicable to the resource URL | Associative array – see below |

### Methods

Each applicable HTTP method maps in turn with the following structure:

| Index | Description | Format |
|---|---|---|
| access | Which user types have access to the method (Merchant, Agent). | array |
| parameters | A list of the parameters that are accepted. | Associative array – see below |

### Parameters

Each element corresponds to the name of a parameter and maps with the following structure, which describes the parameter:

| Index | Description | Format |
|---|---|---|
| description | Descriptive text about the parameter. | string |
| type | The data type (int, string, array). | string |
| required | Whether or not the parameter is mandatory. | bool |
| source | "content" if the parameter is to be sent as part of content, "query" if it is to be sent as a query parameter. | string |
| parameters | If "type" is array, nested parameters occur here in the same structure format. | Associative/sequential array |

Parameters can also occur nested in other parameters.

Example: Response to OPTIONS call

```json
{
    "url": "/ctpsp/ws/test",
    "description": "testresource",
    "methods": {
        "GET": {
            "access": [
                "Agent",
                "Merchant"
            ]
        },
        "POST": {
            "access": [
                "Merchant"
            ],
            "parameters": {
                "testparam1": {
                    "description": "A testparameter",
                    "type": "string",
                    "required": "true",
                    "source": "content"
                },
                "testparam2": {
                    "description": "A testparameter with subparameters",
                    "type": "array_associative",
                    "required": "false",
                    "source": "content",
                    "parameters": {
                        "testparam3": {
                            "description": "A nestled parameter",
                            "type": "string",
                            "required": "false",
                            "source": "content"
                        }
                    }
                }
            }
        }
    }
}
```

### Common query parameters for all searchable collections

Some of the collections that are represented can be restricted via query parameters. This is specified for the resource in question using searchable parameters.

For large collections a number of resource representations are retrieved at a time. The number is determined by the parameter size.

| Parameter | Type | Description |
|---|---|---|
| `size` | Int | Page size (cannot exceed the `max_page_size` field). |
| `offset` | Int | Index for the first entry in the view. |
| `order` | string | Sorting order (`ASC` or `DESC`). |
| `order_by` | string | Name of the field by which the collection is to be sorted. |

## Resending a request

If a problem arises in the communication between client and server which results in that the client cannot decide whether a call has been processed or not, then it is important that the same call can be resent without any risk of side-effects (e.g. that multiple resources are created instead of one).

To do this, all POST calls can be sent with the optional parameter `message_id`. The value is generated in the client and must be an integer.

Together with the timestamp it forms a unique identifier for the call. If multiple calls come in with the same `timestamp` and `message_id`, they will therefore be regarded as resendings of the same message. In this event, only one resource will be created and the same response will be given.

Operations such as PUT and DELETE can always be repeated without side-effects.

## Version management and changes in API

The API version is designated by three digits

```
1 . 2 . 3  
Major Minor Build
```

The first two digits, i.e. major and minor, are included in the URL when the API is called. Changes in these mean that the API has been changed in a way that is not backward-compatible. The client may then need to be updated before the new version can be used. Changes in the major digit represent major restructuring.

The URL has the form

```
ctpsp/ws/[Major].[Minor]/[Resource]
```

Certain changes can be made within a minor version and then the third digit, build, is incremented. These changes do not change the transaction logic and are expected to be able to be handled by the client without updating. This places certain demands on implementation. For example, data structures can be built more or less dynamically.

Some examples of what a client is expected to be able to handle are given below.

* **Addition of variables in representations**  
    If a representation that is returned from the system contains a variable that is not recognized by the client, this must be able to be ignored.
* **Change in the definition collection of variables and parameters**  
    This may apply, for example, if more languages become available in the language parameter when a payment is created
* **Addition of non-mandatory parameters in call**  
    The call will then be able to be made in the same way as previously and the new parameters are given the default values that reflect previous functionality
* **Introduction of new resources and collections**  
    Will not be displayed unless the client itself creates or retrieves these

When the API version is incremented in a non-backward-compatible way, the old version will be available in parallel. The client can then be updated irrespective of the server.

## Products in the Payment representation

When using certain payment methods information about the customer may be required and the products may need to be specified. For this reason, the Customer and Products can also be included.

There are a number of things to bear in mind when you include these structures. The first is that if products are specified then you cannot at the same time specify an _amount_ in the root of the Payment structure. The amount is instead calculated from the product specification and is set automatically.

The second thing you need to know is how Certitrade totals the VAT. The VAT is first calculated for each individual line and is then added together to get the total VAT.

Two examples of this are shown below, one in which the VAT is not included in the specified product price and one where VAT is included.

### Example 1: VAT not included in price

| Product | Price | Quantity | VAT rate | Line total (price) | Line total (VAT) |
|---------|-------|----------|----------|--------------------|------------------|
| Food | 10 | 10 | 12% | 100 |12 |
| Clothing | 20 | 2 | 25% | 40 |10 |
| **Total** | 140 | 22 | | **Amount in payment** |162 |

### Example 2: Price including VAT

| Product | Price | Quantity | VAT rate | Line total (price) | Line total (VAT) |
|---------|-------|----------|----------|--------------------|------------------|
| Food | 10 | 10 | 12% | 100 | 10.71 |
| Clothing | 20 | 2 | 25% | 40 | 8 |
| **Total** | 140 | 18.71 |    | **Amount in payment** | 140 |

We recommend that you send products without VAT included in the price in order to avoid potential problems with rounding off of fractions by subcontractors.
