---
layout: post
title:  "Related Search API documentation"
date:   2016-08-22 14:01:18 +0100
categories: jekyll update
---

### Related Search API documentation

The endpoint to call our API is:
```
http://api.findmypast.com/search/category/count
```

Returns a JSON message containing the total number of records found, a breakdown of the total by category and a URL to display the results.

The query string you pass through must begin with `$filter=` and be in [OData](http://www.odata.org/) format. Otherwise, the response returned will contain an error message.

#### Example:
<a href="http://api.findmypast.com/search/category/count?$filter=LastName%20eq%20barton%20and%20YearOfBirth%20eq%201900">http://api.findmypast.com/search/category/count?$filter=LastName eq barton and YearOfBirth eq 1900</a>

#### Resource URL:


```
api.findmypast.com/search/category/count
```

#### Resource Information

* *Response format:* JSON
* *Requires authentication:* No

#### Header Parameters

| Parameter  | Description | Is required |
| - | - | - |
| partnerid | *Guid* type of partner id. Provided by findmypast. This is used to track traffic from partners that route back to the FMP site | No |

#### URL Parameters

| Parameter | Description | Is required |
| - | - | - |
| $filter | OData type parameter. | Yes |

#### Filter URL parameter accepted OData format
At least one of the parameters is required and all string values must be enclosed by single quotes ( ' )

| Field* | Allowed Operators* | Value Type | Expression example |
| - | - | - | - |
| FirstName | eq | String | $filter=FirstName eq 'John' |
| LastName | eq | String | $filter=LastName eq 'Smith' |
| YearOfBirth | eq <br/> le <br/> ge | Int | $filter=YearOfBirth eq 1911 <br/> $filter=YearOfBirth le 1945 <br/> $filter=YearOfBirth ge 1956 |
| YearOfDeath | eq <br/> le <br/> ge | Int | $filter=YearOfDeath eq 1914 <br/> $filter=YearOfDeath le 1948 <br/> $filter=YearOfDeath ge 1959 |
| KeywordsPlace | eq | String | $filter=KeywordsPlace eq 'Old Street, London, UK' |

​\**Please note these are all case sensitive*​

These fields can be combined in any order by the "*and*" operator, for example:

<a href="http://api.findmypast.com/search/category/count?$filter=LastName%20eq%20%27Tolkien%27%20and%20FirstName%20eq%20%27John%20Ronald%20R%27%20and%20YearOfBirth%20eq%201892%20and%20YearOfDeath%20eq%201973%20and%20KeywordsPlace%20eq%20%27Bournemouth,%20Dorset,%20England%27">http://api.findmypast.com/search/category/count?$filter=LastName eq 'Tolkien' and FirstName eq 'John Ronald R' and YearOfBirth eq 1892 and YearOfDeath eq 1973 and KeywordsPlace eq 'Bournemouth, Dorset, England'</a>

#### Example Request

```
GET

http://api.findmypast.com/search/category/count?$filter=LastName eq 'Smith' and FirstName eq 'John'
```

#### Example Result

{% highlight json %}
{  
   "TotalCount":1629816,
   "ResultUrl":"http://search.findmypast.com/results/world-records?FirstName=John&LastName=Smith",
   "Facets":{  
      "SourceCollection":[  
         {  
            "Name":"Armed forces & conflict",
            "Count":63632
         },
         {  
            "Name":"Census, land & surveys",
            "Count":807465
         },
         {  
            "Name":"Churches & religion",
            "Count":146
         },
         {  
            "Name":"Education & work",
            "Count":21348
         },
         {  
            "Name":"Institutions & organisations",
            "Count":55109
         },
         {  
            "Name":"Life events (bmds)",
            "Count":592500
         },
         {  
            "Name":"Newspapers, directories & social history",
            "Count":57183
         },
         {  
            "Name":"Travel & migration",
            "Count":32433
         }
      ]
   }
}
{% endhighlight %}
