### Hints API documentation

Our Hints API allows you to send us a family tree object and in response we provide records that match that persons fragment of family tree.

To get matches you have do a POST request to the following endpoint:
	http://api.findmypast.com/hints/matches

An example of a family tree fragment that we expect is below:
```
{
    "Person" : {
        "Id" : 1003071691,
        "GivenNames" : "Agnes S",
        "Surnames" : "Matthews",
        "BirthDate" : 19670401,
        "BirthPlace" : "Hertfordshire, England",
        "DeathDate" : null,
        "DeathPlace" : null,
        "Gender" : 2
    },
    "Parent" : {
        "Mother" : {
            "Id" : 1003071692,
            "GivenNames" : "Rose",
            "Surnames" : "Matthews",
            "BirthDate" : 19440401,
            "BirthPlace" : "Offaly, Ireland",
            "DeathDate" : 20110401,
            "DeathPlace" : "Offaly, Ireland",
            "Gender" : 2
        },
        "Father" : {
            "Id" : 1003071693,
            "GivenNames" : "Brian",
            "Surnames" : "Yates",
            "BirthDate" : 19410401,
            "BirthPlace" : "Offaly, Ireland",
            "DeathDate" : 20090401,
            "DeathPlace" : "Offaly, Ireland",
            "Gender" : 1
        }
    },
    "Spouses": [
        {
            "Id" : 1003071693,
            "GivenNames" : "George",
            "Surnames" : "Cox",
            "BirthDate" : 19650401,
            "BirthPlace" : "Essex, England",
            "DeathDate" : null,
            "DeathPlace" : null,
            "Gender" : 1,
            "MarriageDate": 19910601,
            "MarriagePlace": "Essex, England"
        }
    ]
}
```

Not all of the information in the above family tree fragment is required but, the more you provide the more relevant the results.

Authorization
We will provide you with an API key to use our API. Include the key in the headers of the request.

Example: 
   Authorization: Apikey 00000000-0000-0000-0000-000000000000


Ready to go! Send the request.

#### Example Response
```
{
"Count": 2
"Link": "/#/list/d3edd5cb-ebcf-e511-9b69-005056923bfb"
}
```

The link will take the user to see all the records that have matched for that family tree fragment. The count is the amount of results.

### ** List of hints **

Our second endpoint is to return the list hints that you have received previously for a person in your family tree fragment:
   http://api.findmypast.com/hints?requestId=d3edd5cb-ebcf-e511-9b69-005056923bfb  

You will receive the requestId once you have called the hints/matches endpoint with your family tree fragment.

This endpoint can be used if you wish to display the hints rather than using our Hints UI.

#### Example Response
```
{
    "Hints": [2]
    0:  {
    "HintId": "96e509c3-3fb0-4d4e-afc4-93fbfb3f5daf"
    "DateCreated": "2016-02-10T11:45:37.09"
    "DateUpdated": "2016-02-10T11:45:37.09"
    "FirstName": "Agnes S"
    "EventYear": 1991
    "Status": null
    "LastName": "Matthews"
    "Score": 78.15297
    "UppId": "BMD/M/1991/9/87279139"
    "RecordMetadataId": "bmd_marriages"
    "DatasetName": "England & Wales marriages 1837-2008"
    "SourceCountry": "Great Britain"
    "SourceCollection": "Life events (BMDs)"
    "SourceCategory": "Marriages & divorces"
    "Place": "Uttlesford, Essex, England"
    "RequestId": "d3edd5cb-ebcf-e511-9b69-005056923bfb"
    }
    1:  {
    "HintId": "0c2d922b-c8e8-4bc4-8fc5-f2a8b53c6679"
    "DateCreated": "2016-02-10T11:45:37.09"
    "DateUpdated": "2016-02-10T11:45:37.09"
    "FirstName": "Agnes Sandra T"
    "EventYear": 1967
    "Status": null
    "LastName": "Matthews"
    "Score": 84.6526642
    "UppId": "BMD/B/1967/2/AZ/000953/149"
    "RecordMetadataId": "bmd_births"
    "DatasetName": "England & Wales births 1837-2006"
    "SourceCountry": "Great Britain"
    "SourceCollection": "Life events (BMDs)"
    "SourceCategory": "Births & baptisms"
    "Place": "Hitchin, Hertfordshire, England"
    "RequestId": "d3edd5cb-ebcf-e511-9b69-005056923bfb"
    }
    "Ancestor": {
    "Id": 1003071691
    "GivenNames": "Agnes S"
    "Surnames": "Matthews"
    "BirthDate": 19670401
    "BirthPlace": "Hertfordshire, England"
    "DeathDate": null
    "DeathPlace": null
    "Gender": 2
    }
}
```