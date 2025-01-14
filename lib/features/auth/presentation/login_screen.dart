import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _passwordVisible = false;

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // App Logo
                      const CircleAvatar(
                        radius: 30,
                      ),
                      const SizedBox(height: 20),

                      // Welcome Back Text
                      const Text(
                        'Welcome Back !',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF092C4C),
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Description Text
                      const Text(
                        'Stay signed in with your account\nto make searching easier.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF092C4C),
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Email Field
                      _buildInputField(
                        controller: emailController,
                        label: 'Email',
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                      ),
                      const SizedBox(height: 30),

                      // Password Field
                      _buildInputField(
                        controller: passwordController,
                        label: 'Password',
                        hintText: 'Enter your password',
                        isPassword: true,
                        isPasswordVisible: _passwordVisible,
                        togglePasswordVisibility: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        validator: validatePassword,
                      ),

                      const SizedBox(height: 50),

                      // Signup Button
                      // Signup Button
                      SizedBox(
                        width: constraints.maxWidth,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('Email: ${emailController.text}');
                              print('Password: ${passwordController.text}');

                              // Perform signup logic here

                              _formKey.currentState?.reset();
                              emailController.clear();
                              passwordController.clear();

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Success'),
                                    content: const Text('Signup successful!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);

                                          Navigator.pushReplacementNamed(
                                            context,
                                            '/login',
                                          );
                                        },
                                        child: const Text('OK'),
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFCF57),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NunitoSans',
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Divider with Text
                      const Row(
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 1,
                            color: Color(0xFFE8E8E8),
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(
                                color: Color(0xFFABB3BB),
                                fontSize: 12,
                                fontFamily: 'NunitoSans',
                              ),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                                  thickness: 1, color: Color(0xFFE8E8E8))),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Social Buttons
                      Row(
                        children: [
                          _buildSocialButton(
                              'Google', 'assets/icons/Google.svg'),
                          const SizedBox(width: 10),
                          _buildSocialButton(
                              'Facebook', 'assets/icons/Facebook.svg'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "You don't have an account? ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF092C4C),
                                fontFamily: "NunitoSans"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/signup');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFFF2613C),
                                  fontFamily: 'NunitoSans'),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool? isPasswordVisible,
    VoidCallback? togglePasswordVisibility,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF092C4C),
            fontFamily: 'NunitoSans',
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword && !(isPasswordVisible ?? false),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'NunitoSans',
              color: Color(0xFFABB3BB),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE8E8E8)),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible!
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xFFABB3BB),
                    ),
                    onPressed: togglePasswordVisibility,
                  )
                : null,
          ),
          keyboardType: keyboardType,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildSocialButton(String label, String asset) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () async {
          if (label == 'Google') {
            User? user = await signInWithGoogle();
            print(user);
            // if (user != null) {
            //   // Handle the signed-in user, e.g., navigate to the home screen
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(content: Text('Welcome, ${user.displayName}!')),
            //   );
            //   Navigator.pushReplacementNamed(
            //       context, '/home'); // Replace '/home' with your desired route
            // } else {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('Google Sign-In cancelled')),
            //   );
            // }
          } else {
            // Handle Facebook or other social logic
          }
        },
        icon: SvgPicture.asset(asset),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: label == 'Google'
              ? const Color(0xFFFC6A57)
              : const Color(0xFF298FFF),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
