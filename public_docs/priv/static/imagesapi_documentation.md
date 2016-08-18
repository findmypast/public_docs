### Images API documentation

This API provides transcription images.

#### Resource URL:
The endpoint to call our API is:
   http://api.findmypast.com/images/

####Example Request

```
GET
api.findmypast.com/images/?uppid=GBC/1911/RG78/00004/0009&organisationid=test_organisation_id&utctime=2016-02-29T12:30:30.120Z&hash=56b46375055c10a94456f079dd01965c71b83812

```

#### URL Parameters
|Parameter|Description|Is required|
|-|-|-|-|
|uppid|Id of requested image. Shoud be formated as 'book_name/record_set/archive_reference/page_number/sequence_number'|Yes|
|organisationid|Id of the organization. Provided by findmypast. Used to control the access to the image.|Yes|
|utctime|UTC date time. Used to create the hash.|Yes|
|hash|Calculated hash. Used to control the access to the image. To check how to calculate go to the Hash SHA1 section on this page|Yes|

#### Hash SHA1

The HASH consists of a SHA1 hash, which is created using the Utctime, UppId and an API key which will be provided by findmypast.

For example:
The following values used to create a SHA1 hash and the values must be supplied in the following order.  

```
Utctime - 2016-02-29T12:30:30.120Z
UppId - GBC/1911/RG78/00004/0009
APIKey - c7cd4675d2cd406e926cdff595b5c515
```

Therefore the hash would be created from the following:

```
2016-02-29T12:30:30.120ZGBC/1911/RG78/00004/0009c7cd4675d2cd406e926cdff595b5c515
```

This would result in the following SHA1 hash - 56b46375055c10a94456f079dd01965c71b83812