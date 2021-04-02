import 'package:advertising/domain/Users.dart';

class UserService {
  Future<User> getCurrentUser() async {
    return Future.delayed(Duration(seconds: 2), () {
      return null;
    });
  }

  Future<User> ubahPassword(String passwordLama, String passwordBaru) {
    return Future.delayed(Duration(seconds: 2), () {
      return null;
    });
  }

  Future<User> updateUser(User user) {
    return Future.delayed(Duration(seconds: 2), () {
      return user;
    });
  }

  Future<double> getSaldo() {
    return Future.delayed(Duration(seconds: 2), () {
      return 0;
    });
  }

  User generateDummy() {
    User user = User.instance(
        "6282133693119@micko", "Danang Puspito", "Jati", "", "", "");
    return user;
  }
}
