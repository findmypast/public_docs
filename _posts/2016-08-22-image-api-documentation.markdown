---
layout: post
title:  "Image API documentation"
date:   2016-08-22 14:01:18 +0100
categories: jekyll update
---

### Image API documentation

This API provides images.

#### Resource URL:
The endpoint to call our API is:
```
http://api.findmypast.com/image/
```

#### Example Request

```
GET
api.findmypast.com/image/?uppid=GBC/1911/RG78/00004/0009&organisationid=test_organisation_id&utctime=2016-02-29T12:30:30.120Z&hash=56b46375055c10a94456f079dd01965c71b83812

```

#### URL Parameters

| Parameter | Description | Is required |
| - | - | - |
| uppid | Id of requested image. Should be formatted as 'book_name/record_set/archive_reference/page_number/sequence_number' | Yes |
| organisationid | Id of the organisation. Provided by findmypast. Used to control the access to the image API*. | Yes |
| utctime | UTC date time. Must be formatted as Zulu Time. Used to check if the url is still valid | Yes |
| hash |Calculated hash. Used to control the access to the image API. For more details go to the Hash SHA1 section on this page | Yes |

*Do not share your API key with others

#### Hash SHA1

The hash is constructed by concatenating utctime, uppid and an API key and hashing this using SHA1 .
The API key is provided by findmypast.

**For example:**
The following values used to create a SHA1 hash and the values must be supplied in the following order.

```
utctime - 2016-02-29T12:30:30.120Z
uppid - GBC/1911/RG78/00004/0009
apikey - <yourApiKey>
```

Therefore the hash would be created from the following:

```
utctime + uppid + apikey
2016-02-29T12:30:30.120ZGBC/1911/RG78/00004/0009<yourApiKey>
```

This would result in the following SHA1 hash *56b46375055c10a94456f079dd01965c71b83812*.

This will be the value for the hash parameter on the endpoint.
