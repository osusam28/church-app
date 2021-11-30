families:

GET families/
GET families/{id}/
POST families/
POST families/{id}/

suggestions:

GET suggestions/
GET suggestions/{id}/
POST suggestions/
POST suggestions/{id}/approve
POST suggestions/{id}/deny


families:

{
    "id": "",
    "created_ts": "",
    "versions": [
        {
            "id": "",
            "created_ts": "",
            "line1": "",
            "line2": "",
            ...
        },
        {
            ...
        }
    ]
}

suggestions:

{
    "id": "",
    "created_ts": "",
    "line1": "",
    "line2": "",
    ...
}


families:

admin:families
read:listFamilies
write:createFamilies
write:modifyFamilies

suggestions:

admin:suggestions
read:listSuggestions
write:createSuggestions
write:moderateSuggestions