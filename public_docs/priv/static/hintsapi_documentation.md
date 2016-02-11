### Hints API documentation

Our Hints API allows you to send us a family tree object and in response we provide records that match that person's fragment of family tree.

To get matches you have do a POST request to the following endpoint:
	https://api.findmypast.com/hints/matches

An example of a family tree fragment that we expect is below:
```
{
    Person : {
        GivenNames : "Agnes S",
        Surnames : "Matthews",
        BirthDate : 19670401,
        BirthPlace : "Hertfordshire, England",
        DeathDate : null,
        DeathPlace : null,
        Gender : 2
    },
    Parent : {
        MarriageDate : null,
        MarriagePlace : null,
        Mother : {
            "GivenNames" : "Rose",
            "Surnames" : "Matthews",
            "BirthDate" : 19440401,
            "BirthPlace" : "Offaly, Ireland",
            "DeathDate" : 20110401,
            "DeathPlace" : "Offaly, Ireland",
            "Gender" : 2
        },
        Father : {
            GivenNames : "Brian",
            Surnames : "Yates",
            BirthDate : 19410401,
            BirthPlace : "Offaly, Ireland",
            DeathDate : 20090401,
            DeathPlace : "Offaly, Ireland",
            Gender : 1
        },
        Siblings : [{
                GivenNames : "William",
                Surnames : "Matthews",
                BirthDate : 19680704,
                BirthPlace : "Hertfordshire, England",
                DeathDate : null,
                DeathPlace : null,
                Gender : 1
            }
        ]
    },
    Spouses : [{
            GivenNames : "George",
            Surnames : "Cox",
            BirthDate : 19650401,
            BirthPlace : "Essex, England",
            DeathDate : null,
            DeathPlace : null,
            Gender : 1,
            MarriageDate : 19910601,
            MarriagePlace : "Essex, England",
            Childs : [{
                    GivenNames : "Jane",
                    Surnames : "Cox",
                    BirthDate : 19931204,
                    BirthPlace : "Essex, England",
                    DeathDate : null,
                    DeathPlace : null,
                    Gender : 2
                }
            ]
        }
    ]
}

```

Not all of the information in the above family tree fragment is required but, the more you provide the more relevant the results. If you want to refresh hints for a person you need to call the same endpoint passing in the requestId returned on the initial call for that person e.g.
    https://api.findmypast.com/hints/matches?requestId=9c0a7ce8-bdd0-e511-80ef-005056923b62

Authorization
We will provide you with an API key to use our API. Include the key in the headers of the request.

Example: 
   Authorization: Apikey 00000000-0000-0000-0000-000000000000


Ready to go! Send the request.

#### Example Response
```
{
    "Count" : 2,
    "Link" : "/#/list/9c0a7ce8-bdd0-e511-80ef-005056923b62"
}
```

The link will take the user to see all the records that have matched for that family tree fragment. The count is the amount of results.

### ** List of hints **

Our second endpoint is to return the list hints that you have received previously for a person in your family tree fragment:
   https://api.findmypast.com/hints?requestId=9c0a7ce8-bdd0-e511-80ef-005056923b62  

You will receive the requestId once you have called the hints/matches endpoint with your family tree fragment.

This endpoint can be used if you wish to display the hints rather than using our Hints UI.

#### Example Response
```
{
    "Hints" : [{
            "HintId" : "f866ef68-1162-4a5c-92ab-a5d0c2974721",
            "DateCreated" : "2016-02-11T12:49:53.193",
            "DateUpdated" : "2016-02-11T12:49:53.193",
            "FirstName" : "Agnes Sandra T",
            "EventYear" : ​1967,
            "Status" : null,
            "LastName" : "Matthews",
            "Score" : ​84.6526642,
            "UppId" : "BMD/B/1967/2/AZ/000953/149",
            "RecordMetadataId" : "bmd_births",
            "DatasetName" : "England & Wales births 1837-2006",
            "SourceCountry" : "Great Britain",
            "SourceCollection" : "Life events (BMDs)",
            "SourceCategory" : "Births & baptisms",
            "Place" : "Hitchin, Hertfordshire, England",
            "RequestId" : "9c0a7ce8-bdd0-e511-80ef-005056923b62"
        }, {
            "HintId" : "29040801-ad2d-4f3f-adc8-dcb594acb1da",
            "DateCreated" : "2016-02-11T12:49:53.193",
            "DateUpdated" : "2016-02-11T12:49:53.193",
            "FirstName" : "Agnes S",
            "EventYear" : ​1991,
            "Status" : null,
            "LastName" : "Matthews",
            "Score" : ​78.15297,
            "UppId" : "BMD/M/1991/9/87279139",
            "RecordMetadataId" : "bmd_marriages",
            "DatasetName" : "England & Wales marriages 1837-2008",
            "SourceCountry" : "Great Britain",
            "SourceCollection" : "Life events (BMDs)",
            "SourceCategory" : "Marriages & divorces",
            "Place" : "Uttlesford, Essex, England",
            "RequestId" : "9c0a7ce8-bdd0-e511-80ef-005056923b62"
        }
    ],
    "Ancestor" : {
        "Id" : ​0,
        "GivenNames" : "Agnes S",
        "Surnames" : "Matthews",
        "BirthDate" : ​19670401,
        "BirthPlace" : "Hertfordshire, England",
        "DeathDate" : null,
        "DeathPlace" : null,
        "Gender" : ​2
    }
}

```