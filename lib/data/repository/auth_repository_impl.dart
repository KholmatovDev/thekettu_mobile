import 'package:thekettu/data/service/source/local/secure_storage.dart';
import 'package:thekettu/domain/repository/auth_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthRepositoryImpl extends AuthRepository{
  final SecureStorage secureStorage;

  AuthRepositoryImpl({required this.secureStorage});
  @override
  Future<void> saveToken({required String token})async {
    await secureStorage.setAccess(token);
  }
  @override
  Future<bool> checkToken() async{
    return secureStorage.getAccess()!=null;
  }
}