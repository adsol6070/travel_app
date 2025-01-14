import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Register Now!',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF092C4C),
                          fontFamily: 'NunitoSans',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Sign up to start your journey\nwith us today.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF092C4C),
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Name Field
                      _buildInputField(
                        controller: nameController,
                        label: 'Name',
                        hintText: 'Enter your name',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

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
                      const SizedBox(height: 30),

                      // Confirm Password Field
                      _buildInputField(
                        controller: confirmPasswordController,
                        label: 'Confirm Password',
                        hintText: 'Confirm your password',
                        isPassword: true,
                        isPasswordVisible: _confirmPasswordVisible,
                        togglePasswordVisibility: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 50),

                      // Signup Button
                      SizedBox(
                        width: constraints.maxWidth,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('Name: ${nameController.text}');
                              print('Email: ${emailController.text}');
                              print('Password: ${passwordController.text}');
                              print(
                                  'Confirm Password: ${confirmPasswordController.text}');
                              // Perform signup logic here

                              _formKey.currentState?.reset();
                              nameController.clear();
                              emailController.clear();
                              passwordController.clear();
                              confirmPasswordController.clear();

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
                            'Sign Up',
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
                            child:
                                Divider(thickness: 1, color: Color(0xFFE8E8E8)),
                          ),
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
                            child:
                                Divider(thickness: 1, color: Color(0xFFE8E8E8)),
                          ),
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
                      const SizedBox(height: 20),

                      // Redirect to Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF092C4C),
                              fontFamily: "NunitoSans",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFF2613C),
                                fontFamily: 'NunitoSans',
                              ),
                            ),
                          ),
                        ],
                      ),
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
        onPressed: () {
          // Handle social button logic
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
