# flutter-auth0-android

This Project uses the example project from this repository.
As usual the official project Doesn't work.

but this one should work.

https://developer.auth0.com/resources/guides/mobile/flutter/basic-authentication

The application type in auth0 must be Native.

hereby we are using a custom call back scheme.

the app name in android terms is 'com.ams.flutterstaging.djangostaging'

for this to work you have to create the string.xml at djangostaging/android/app/src/main/res/values/string.xml

```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="com_auth0_domain">Your AUTH0 application Domain</string>
    <string name="com_auth0_scheme">com.ams.flutterstaging.djangostaging</string>
</resources>
```

and add an .env at root of the project at djangostaging/.env

```
AUTH0_DOMAIN=Your Auth0 domain 
AUTH0_CLIENT_ID=Your Application Client id 
AUTH0_AUDIENCE=Your API identifier on auth0 
```
that should be it. if you click login it should open a browser and then phew. it asks login then phew. you login.
phew open the app phew. you are logged in. logout same way. the additional code is same with just lines changed to 
work with Flutter 3.27.2 and Android Studio 2024.2.2.