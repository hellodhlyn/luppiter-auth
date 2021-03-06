# API Specifications

## Models

### ApiToken

```jsonc
{
  "access_key": "string",
  "secret_key": "string",
  "expire_at": "datetime",
}
```

### Application

```jsonc
{
  "app_id": "string",
  "name": "string",
  "created_at": "datetime",
  "owner": {
    "uuid": "string",
    "username": "string"
  }
}
```

### UserIdentity

```jsonc
{
  "uuid": "string",
  "username": "string",
  "email": "string",
  "created_at": "datetime"
}
```

## APIs

- POST /v1/accounts/google
- POST /v1/api_tokens/google
- GET /v1/applications
- GET /v1/applications/:app_id
- POST /v1/applications
- GET /v1/applications/:app_id/authorization
- POST /v1/applications/:app_id/authorization
- GET /v1/identities/me

### POST /v1/accounts/google

* Request Body
    ```jsonc
    {
      "username": "string",
      "id_token": "string"
    }
    ```
* Returns
    * 201 Created
    * 400 Bad Request (duplicated_account)
    * 400 Bad Request (invalid_provider_id)

### POST /v1/api_tokens/google

* Request Body
    ```jsonc
    {
      "appId": "string",
      "id_token": "string"
    }
    ```
* Returns
    * 201 Created
    * 400 Bad Request (unauthorized_application)
    * 401 Unauthorized

### GET /v1/applications

* Query Parameters
    * `owner_id` (string)
* Returns
    * 200 OK

### GET /v1/applications/:app_id

* Returns
    * 200 OK

### POST /v1/applications

Authentication required.

* Request Body
    ```jsonc
    {
      "name": "string",
      "redirect_url": "string?"
    }
    ```
* Returns
    * 201 Created
    * 400 Bad Request (duplicated_names)

### GET /v1/applications/:app_id/authorization

Authentication required.

* Returns
    * 200 OK
    ```jsonc
    {
      "authorized": true
    }
    ```
    * 401 Unauthorized

### POST /v1/applications/:app_id/authorization

Authentication required.

* Request Body
    ```jsonc
    {
      "authorized": true
    }
    ```
* Returns
    * 200 OK

### GET /v1/identities/me

Authentication required.

* Returns
    * 200 OK
    * 401 Unauthorized
