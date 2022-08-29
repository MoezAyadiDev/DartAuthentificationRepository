# Authentication Repository

Authentication repository is a dart package to handle differents authentication methode.

Inspired from Felix Angelov in [Flutter Firebase Login Tutorial](https://bloclibrary.dev/#/flutterfirebaselogintutorial)

## Installation

add in the pubspec.yaml this dependencie

```yaml
dependencies:
  authentication_repository:
    git:
      url: https://github.com/MoezAyadiDev/DartAuthentificationRepository.git
      path: firebase/authentication_repository
```
### Web

add this code inside lib\web\index.html

```html
<head>
  ...
  <meta name="google-signin-client_id" content="XXXXXXXXXXXXXXXXXXXXXXXXX.apps.googleusercontent.com">
</head>
<body>
   <!-- The core Firebase JS SDK (always required for using any firebase service) -->
   <script src="https://www.gstatic.com/firebasejs/7.20.0/firebase-app.js"></script>
   <!-- Firebase Auth SDK -->
   <script src="https://www.gstatic.com/firebasejs/7.20.0/firebase-auth.js"></script>
   <script>
     // Your web app's Firebase configuration
     const firebaseConfig = {
      apiKey: "XXXXXXXXXXXXXXXXXXXXXXXXX",
      authDomain: "XXXXXXXXXXXXXXXXXXXXXXXXX",
      projectId: "XXXXXXXXXXXXXXXXXXXXXXXXX",
      storageBucket: "XXXXXXXXXXXXXXXXXXXXXXXXX",
      messagingSenderId: "XXXXXXXXXXXXXXXXXXXXXXXXX",
      appId: "XXXXXXXXXXXXXXXXXXXXXXXXX",
      measurementId: "XXXXXXXXXXXXXXXXXXXXXXXXX"
    };
     // Initialize Firebase
     firebase.initializeApp(firebaseConfig);
   </script>
   ...
</body>
```

## Authentication methode
- Sign in with Email and password 
- Sign up with Email and password
- Google


## Usage

```dart
import 'package:authentication_repository/authentication_repository.dart';

final authenticationRepository = AuthenticationRepository();
await authenticationRepository.user.first;
late final StreamSubscription<User> _userSubscription;
_userSubscription = authenticationRepository .user.listen(
      (user) => userChanged(user),
    );
userChanged(user){
    //TDOD implement on user Changed
}
```

[Complete example](https://github.com/MoezAyadiDev/DartAuthentificationRepository/tree/main/firebase/authentication_repository/example)
