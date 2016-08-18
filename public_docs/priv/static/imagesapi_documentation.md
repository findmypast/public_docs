### Images API documentation

This API provides images of transcriptions.

#### Resource URL:
The endpoint to call our API is:
   http://api.findmypast.com/images/

####Example Request

```
GET
api.findmypast.com/image/?uppid=GBC/1911/RG78/00004/0000&organisationid=test_organisation_id&utctime=2016-08-17T15:11:00.120Z&hash=1a6ff5942ec8497a5330493b6c4e045091ecf2b9

```

#### URL Parameters
|Parameter|Description|Is required|
|-|-|-|-|
|uppid|Id of requested image. Shoud be formated as 'book_name/record_set/archive_reference/page_number/sequence_number'|Yes|
|organisationid|Id of the organization. Provided by findmypast. Used to control the access to the image.|Yes|
|utctime|UTC date time. Used to create the hash.|Yes|
|hash|Calculated hash. Used to control the access to the image. To check how to calculate go to the Hashs section on this page|Yes|
