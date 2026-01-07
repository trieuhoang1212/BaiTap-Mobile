import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sourcecode_bai3/firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sourcecode_bai3/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginState(),
    );
  }
}

class LoginState extends StatefulWidget {
  const LoginState({super.key});

  @override
  State<LoginState> createState() => _LoginStateState();
}

class SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 214, 232, 255),
        padding: const EdgeInsets.symmetric(vertical: 12),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 24, 79),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginStateState extends State<LoginState> {
  static const double _logoSize = 150.0;
  static const double _spacing = 10.0;
  static const Color _primaryTextColor = Color.fromARGB(255, 113, 113, 113);
  static const Color _facebookBlue = Color.fromARGB(255, 59, 89, 152);

  Future<void> _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Đăng nhập thành công! StreamBuilder sẽ tự chuyển trang.");
    } catch (e) {
      // 4. Nếu lỗi, hiện thông báo lên màn hình điện thoại
      print('Lỗi chi tiết: $e'); // Xem log chi tiết ở đây
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Đăng nhập thất bại: ${e.toString().split(']').last}',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
          ),
        );
      }
    }
  }

  void _handleFacebookSignIn() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tính năng đăng nhập Facebook chưa được triển khai.'),
      ),
    );
  }

  Future<void> _handleEmailSignIn() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      print("Đăng nhập ẩn danh thành công");
    } catch (e) {
      print("Lỗi: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(height: 50),
              _buildWelcomeText(),
              const SizedBox(height: _spacing),
              _buildLoginButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        Image(
          image: const AssetImage('assets/images/logo_uth.png'),
          width: _logoSize,
          height: _logoSize,
          errorBuilder: (context, error, stackTrace) =>
              const SizedBox(height: _logoSize),
        ),
        const Text(
          'Smart Tasks',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return const Column(
      children: [
        Text(
          'Welcome to Smart Tasks',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _primaryTextColor,
          ),
        ),
        Text(
          'Ready to explore? Login to get started!',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: _primaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButtons() {
    return Column(
      children: [
        SocialLoginButton(
          icon: Image(
            image: const AssetImage('assets/images/logo_gg.png'),
            width: 20,
            height: 20,
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox(height: 20),
          ),
          text: 'Sign in with Google',
          onPressed: _handleGoogleSignIn,
        ),
        const SizedBox(height: _spacing),
        SocialLoginButton(
          icon: const Icon(Icons.facebook, color: _facebookBlue, size: 20),
          text: 'Sign in with Facebook',
          onPressed: _handleFacebookSignIn,
        ),
        const SizedBox(height: _spacing),
        SocialLoginButton(
          icon: const Icon(Icons.email, color: _facebookBlue, size: 20),
          text: 'Sign in with Email',
          onPressed: _handleEmailSignIn,
        ),
      ],
    );
  }
}
