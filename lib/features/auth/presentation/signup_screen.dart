import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                      'Register Now !',
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
                      'Sign Up to start your journey\nwith us today.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF092C4C),
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Input Fields
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF092C4C),
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter your name',
                              hintStyle: TextStyle(
                                fontSize:
                                    14.0, // Adjust hint text font size if needed
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.normal,
                                color: Color(
                                    0xFFABB3BB), // Customize hint text color
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFE8E8E8)))),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Input Fields
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF092C4C),
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter your email',
                              hintStyle: TextStyle(
                                fontSize:
                                    14.0, // Adjust hint text font size if needed
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.normal,
                                color: Color(
                                    0xFFABB3BB), // Customize hint text color
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFE8E8E8)))),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Input Fields
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF092C4C),
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter your password',
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                fontFamily:
                                    'NunitoSans', // Adjust hint text font size if needed
                                color: Color(
                                    0xFFABB3BB), // Customize hint text color
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFE8E8E8))),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.visibility_off_outlined,
                                    size: 24.0,
                                    color: Color(0xFFABB3BB),
                                  ))),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Input Fields
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF092C4C),
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Confirm your password',
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                fontFamily:
                                    'NunitoSans', // Adjust hint text font size if needed
                                color: Color(
                                    0xFFABB3BB), // Customize hint text color
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFE8E8E8))),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.visibility_off_outlined,
                                    size: 24.0,
                                    color: Color(0xFFABB3BB),
                                  ))),
                        )
                      ],
                    ),
                    const SizedBox(height: 50),

                    // Signup Button
                    SizedBox(
                      width: constraints.maxWidth,
                      child: ElevatedButton(
                        onPressed: () {
                          // Signup logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFCF57),
                          foregroundColor: Colors.black,

                          // Set button color to red
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NunitoSans',
                              // Specify extra bold weight (w800 is typical for ExtraBold)
                            )),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Google Button
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Google login logic
                              },
                              // icon: const Icon(Icons.g_mobiledata, size: 24),
                              icon: SvgPicture.asset(
                                'assets/icons/Google.svg',
                              ),
                              label: const Text(
                                'Google',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFC6A57),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15, // Adjust vertical padding
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10), // Gap between buttons
                        // Facebook Button
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Facebook login logic
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/Facebook.svg',
                              ),
                              label: const Text(
                                'Facebook',
                                style: TextStyle(
                                  fontFamily: 'NunitoSans',
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF298FFF),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15, // Adjust vertical padding
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF092C4C),
                              fontFamily: "NunitoSans"),
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
                                fontFamily: 'NunitoSans'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
