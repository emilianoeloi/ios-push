# ios-push

Nesse aplicativo você pode conferir o uso da funcionalidade de Notificação remota (Push Notification) do iOS. 
Tutorial: http://www.raywenderlich.com/32960/apple-push-notification-services-in-ios-6-tutorial-part-1

## App

Dependencias:

- AFNetworking 2.5
- JSONModel 1.0
- SVProgressHUD 1.1
 

```pod install```

## Server
Depois de criado os certificados, coloque o cert.pem e o key.pem na pasta server e ele estará pronto para enviar Notifiações.

Dependências
 - apn 1.7.2 
 - body-parser 1.12.0 
 - daemon 1.1.0
 - express 4.11.2
 - underscore 1.7.0

```cd server```

```npm install```

```node server.js```
