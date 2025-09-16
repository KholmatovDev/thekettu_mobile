import 'package:thekettu/domain/repository/auth_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<void> call({String? token}) async {
    if (token != null) {
     await authRepository.saveToken(token: token);
    } else {
      await launchUrl(Uri.parse("https://thekettu.com/oauth2/authorization/google"));
    }
  }
}
