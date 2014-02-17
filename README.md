# README

## API v1 documentation
Note: All times must be UTC and formatted for ISO 8601 '2001-02-03T04:05:06+07:00'

### Login request
If you try to reach a resource and you don't provide valid credentials, then you will get a response like this:

```json
{
    "status": "fail",
    "errormsg": "You need to sign in or sign up before continuing."
}
```

### Logging in
POST /api/v1/users/sessions

#### Required params
user[email] - email address of the user
user[password] - password of the user
format - should always equal 'json'

#### Successful response with preferred_meter
```json
{
  "status": "ok",
  "user": {
      "id": "5d2e0fb9-8ebc-4469-aea8-44b0846fe641",
      "display": "coleman, kevin",
      "member_id": "1391882870",
      "authentication_token": "eqw8wEs27RN5-WrffxAd",
      "case_manager": {
          "name": "coleman, kevin",
          "phone_number": null
      },
      "preferred_meter": {
        "id": "2b666b4c-2baf-4c3c-9b02-52421f121a4d",
        "mid": "Charlie Alpha Brown",
        "bluetooth_mac": ""
      }
  }
}
```

#### Successful response
```json
{
  "status": "ok",
  "user": {
      "id": "5d2e0fb9-8ebc-4469-aea8-44b0846fe641",
      "display": "coleman, kevin",
      "member_id": "1391882870",
      "authentication_token": "eqw8wEs27RN5-WrffxAd",
      "case_manager": {
          "name": "coleman, kevin",
          "phone_number": null
      }
  }
}
```

#### Failed response
```json
{
  "status": "fail",
  "errormsg": "invalid email or password.",
  "user": {
      "errors": "invalid email or password."
  }
}
```

### Registering a meter
POST /api/v1/meters
This registers a meter with out system.  If the meter already exists, it will not create a new one and will what we already have.
If it doesn't exist, it will try to make one and save it to the db.

#### Required params
meter[mid] - user friend id of the meter
meter[bluetooth_mac] - bluetooth mac address of the meter
user[user_id] - email paired with Auth token
user[user_token] - auth token given by session creation
format - should always equal 'json'

#### Successful response
```json
{
  "status": "ok",
  "meter": {
      "id": "0777830f-3ea7-4247-965c-ccd6575afca0",
      "mid": "Alpha Bravo Charlie",
      "bluetooth_mac": "08:00:69:02:01:FC"
  }
}
```

#### Failed response
```json
{
  "status": "fail",
  "errormsg": "Mid can't be blank and Bluetooth mac is invalid",
  "meter": {
      "errors": "Mid can't be blank and Bluetooth mac is invalid"
  }
}
```

### Creating a measurement
POST /api/v1/measurements
When a new measurement is created, a hash is made based off of: glucose_value, measured_at, code_number, reading_type, meter_id.  The app verifies that this hash is unique to the database before it is able to save it.  If this measurement is later edited, a new hash is not generated with the new values.

#### Required params
measurement[glucose_value] - value of the glucose measurement
measurement[measured_at] - date time that this measurement was measured at
measurement[code_number] - not sure what this is... but its in the docs.
measurement[reading_type] - normal: 0, before meal(AC): 1, before meal(PC): 2, CTL mode(QC): 3
measurement[retrieved_at] - when the communication device retrieved the measurement
measurement[meter_id] - the id of the meter used to create this measurement
measurement[communication_device_id] - the id for the communication device that was used to pull the mesaurement off of the meter
user[user_id] - Email paired with Auth token
user[user_token] - Auth token given by session creation
format - should always equal 'json'

#### Optional params
measurement[note] - note about the measurement

#### Successful response
```json
{
  "status": "ok",
  "measurement": {
      "id": "096d5f2f-af00-4b99-b2db-0ef75654e1a1",
      "measured_at": 1392616074,
      "glucose_value": 12,
      "retrieved_at": "2014-02-17T05:47:54.000Z",
      "created_at": "2014-02-17T06:00:57.065Z",
      "code_number": "1",
      "reading_type": "1",
      "member_id": "5d2e0fb9-8ebc-4469-aea8-44b0846fe641",
      "token": "2d42f4e98abd1a224c019d15ffeafdcf",
      "note": ""
  }
}
```

#### Failed response 1
```json
{
  "status": "fail",
  "errormsg": "Glucose value can't be blank",
  "measurement": {
      "errors": "Glucose value can't be blank"
  }
}
```

#### Failed response 2
```json
{
  "status": "fail",
  "errormsg": "Token must be unique",
  "measurement": {
      "errors": "Token must be unique"
  }
}
```

### Get all measurements for a member
GET /api/v1/measurements

#### Required params
user[user_id] - Email paired with Auth token
user[user_token] - Auth token given by session creation
format - should always equal 'json'

#### Successful response
```json
{
  "status": "ok",
  "measurements": [
      {
          "measurement": {
              "id": "4fd0e2bc-c62c-4925-8a3d-4278d1d7845f",
              "measured_at": "2014-02-17T05:47:54.000Z",
              "glucose_value": 10,
              "retrieved_at": "2014-02-17T05:47:54.000Z",
              "created_at": "2014-02-17T06:00:36.126Z",
              "code_number": "1",
              "reading_type": "1",
              "member_id": "5d2e0fb9-8ebc-4469-aea8-44b0846fe641",
              "token": "08fe40aad5185110e31db845edc29657",
              "note": ""
          }
      }
  ]
}
```

## RoR work flow

### Starting up RoR

1. Sync the repository
2. type "rake db:migrate" // to update the database just incase changes
3. type in "rails s" // to start the server

### Deploy RoR

1. git push heroku master
2. heroku run rake db

### Merge conflicts with no pending changes

1. git reset --hard
2. resync in tool

### Making changes to the repo

1. git checkout master
2. git pull origin master
3. git checkout -b <name of new feature>
4. Make code changes
5. git add .
6. git commit -m "comments about feature changes"
7. git checkout master
8. git pull origin master
9. git checkout <name of new feature>
10. git rebase master
11. If there are any merge conflicts, it will tell you the name of those files in the errors.  You will need to go into the files and edit them so they reflect how the files should be.
12. For each file type: git add <file path/file name>
13. Repeat 11-12 until all files are resolved
14. git rebase --continue
15. Repeat 11-14 until all files are resolved
16. git push origin <name of new feature>
17. create a pull request
18. git checkout master