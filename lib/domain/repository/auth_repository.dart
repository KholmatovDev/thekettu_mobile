abstract class AuthRepository{
  Future<void> saveToken({required String token});
  Future<bool> checkToken();

}