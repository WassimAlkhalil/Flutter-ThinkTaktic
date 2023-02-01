import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// Class with a single Method signInWithApple()
class AppleService {
  signInWithApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (error) {
      // HANDLE ERROR
    }
  }
}
