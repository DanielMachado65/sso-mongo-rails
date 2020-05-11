# sso-mongo-rails

> Application SSO Mongo

## [POST] SIGN IN

To be able to register

```
http://localhost:3000/api/v1/sign_in
```

body requistion: 

```
{
	"user": {
		"email": "user@example.com",
		"password": "123123"
	}
}
```

## [POST] TOKEN

```
http://localhost:3000/oauth/token
```

body requistion: 

```
{
	"email": "user@example.com",
	"password": "123123",
	"grant_type": "password",
	"client_id": "<client_id>"
}
```

## [GET] SHOW ME

```
http://localhost:3000/api/v1/me
bearer token: <token>
```
