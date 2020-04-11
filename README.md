# README

#### Endpoints

localhost:3009/api/v1/movies

```
[
    {
        "id": 1,
        "plot": {
            "acts": [
                {
                    "type": "exposition",
                    "min_to": 50,
                    "min_from": 45,
                    "description": "Some cool stuff happens"
                }
            ],
            "synopsis": "Skywalker's father is coming back"
        },
        "title": "Star Wars: The Empire Strikes Back",
        "unit_price": 25.0
    },
    {
        "id": 2,
        "plot": {
            "acts": [
                {
                    "type": "climax",
                    "min_to": 50,
                    "min_from": 45,
                    "description": "They create a Casino"
                }
            ],
            "synopsis": "Some bad ass money washer with family"
        },
        "title": "Ozark",
        "unit_price": 100.0
    }
]
```

localhost:3009/api/v1/movies/2/seasons

```
[
    {
        "id": 1,
        "episodes": [
            {
                "id": 1,
                "number": 1,
                "title": "Chicago"
            },
            {
                "id": 2,
                "number": 2,
                "title": "Moving to Missouri"
            }
        ],
        "number": 1,
        "title": "The Lake of Ozarks",
        "unit_price": 50.0
    },
    {
        "id": 2,
        "episodes": [
            {
                "id": 3,
                "number": 1,
                "title": "Some Cool Episode"
            }
        ],
        "number": 2,
        "title": "Opening a Casino",
        "unit_price": 50.0
    },
    {
        "id": 3,
        "episodes": [
            {
                "id": 4,
                "number": 1,
                "title": "Some Other Cool Episode"
            }
        ],
        "number": 3,
        "title": "Opening a second Casino",
        "unit_price": 50.0
    }
]
```

localhost:3009/api/v1/user_libraries/1

```
{
    "id": 1,
    "orders": [
        {
            "id": 2,
            "purchaseable": {
                "id": 2,
                "plot": {
                    "acts": [
                        {
                            "type": "climax",
                            "min_to": 50,
                            "min_from": 45,
                            "description": "They create a Casino"
                        }
                    ],
                    "synopsis": "Some bad ass money washer with family"
                },
                "title": "Ozark",
                "unit_price": 100.0
            },
            "quality": "full_hd",
            "total_price": 100.0,
            "user_library_id": 1
        }
    ],
    "user": {
        "id": 1,
        "email": "myemail@domain.com"
    }
}
```

Just to confirm how it works

#### When the order is created

```
curl --location --request POST 'localhost:3009/api/v1/orders' \
--header 'Content-Type: application/json' \
--data-raw '{
	"order": {
		"total_price": 100,
		"purchaseable_id": 1,
		"purchaseable_type": "Movie",
		"quality": "full_hd",
		"user_library_id": 1
	}
}'


{"id":3,"purchaseable":{"id":1,"plot":{"acts":[{"type":"exposition","min_to":50,"min_from":45,"description":"Some cool stuff happens"}],"synopsis":"Skywalker's father is coming back"},"title":"Star Wars: The Empire Strikes Back","unit_price":25.0},"quality":"full_hd","total_price":100.0,"user_library_id":1}

```

#### When the validation fails

```

curl --location --request POST 'localhost:3009/api/v1/orders' \
--header 'Content-Type: application/json' \
--data-raw '{
	"order": {
		"total_price": 100,
		"purchaseable_id": 2,
		"purchaseable_type": "Movie",
		"quality": "full_hd",
		"user_library_id": 1
	}
}'



{
    "errors": [
        "User library The item you want to buy is already in your library"
    ]
}

```
