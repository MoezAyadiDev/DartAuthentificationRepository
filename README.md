# Authentication Repository

Inspired from Felix Angelov in [Flutter Firebase Login Tutorial](https://bloclibrary.dev/#/flutterfirebaselogintutorial)

Authentication repository is a dart package to handle differents authentication methode.

  - [Firebase](https://github.com/MoezAyadiDev/DartAuthentificationRepository/tree/main/firebase/authentication_repository)

## Installation

Choose wich type of backend and add the folder as dependencies, example for firebase

```yaml
dependencies:
  authentication_repository:
    git:
      url: https://github.com/MoezAyadiDev/DartAuthentificationRepository.git
      path: firebase/authentication_repository
```

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
