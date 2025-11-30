import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart'; // Import the login screen file

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Global key for form validation
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final List<TextEditingController> otpControllers = List.generate(
    4,
        (index) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(
    4,
        (index) => FocusNode(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB4A5A5),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              // Wrap Column in Form for validation
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status bar area
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '9:41',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.signal_cellular_4_bar,
                                  color: Colors.white, size: 16),
                              SizedBox(width: 4),
                              Icon(Icons.wifi, color: Colors.white, size: 16),
                              SizedBox(width: 4),
                              Icon(Icons.battery_full,
                                  color: Colors.white, size: 20),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // App title
                    const Text(
                      'UniChatHub',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Create Account title
                    const Center(
                      child: Text(
                        'Create Account Now!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Email label
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Email input field
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAE3D8),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          hintText: '',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            height: 0.8,
                          ),
                        ),
                        // --- EMAIL VALIDATION ---
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@gmail.com')) {
                            return 'Email must include @gmail.com';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // OTP label
                    const Text(
                      'OTP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // OTP input boxes and Send OTP button
                    Row(
                      children: [
                        // OTP boxes
                        ...List.generate(4, (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 12),
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAE3D8),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: TextField(
                              controller: otpControllers[index],
                              focusNode: otpFocusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                counterText: '',
                              ),
                              onChanged: (value) {
                                if (value.length == 1 && index < 3) {
                                  otpFocusNodes[index + 1].requestFocus();
                                } else if (value.isEmpty && index > 0) {
                                  otpFocusNodes[index - 1].requestFocus();
                                }
                              },
                            ),
                          );
                        }),

                        const SizedBox(width: 8),

                        // Send OTP button
                        Expanded(
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAE3D8),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Handle send OTP
                              },
                              child: const Text(
                                'Send OTP',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Password label
                    const Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Password input field
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAE3D8),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: '*', // Shows * instead of dots
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          hintText: '',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            height: 0.8,
                          ),
                        ),
                        // --- PASSWORD VALIDATION ---
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Confirm Password label
                    const Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Confirm Password input field
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAE3D8),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: TextFormField(
                        controller: confirmPassController,
                        obscureText: true,
                        obscuringCharacter: '*', // Shows * instead of dots
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          hintText: '',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            height: 0.8,
                          ),
                        ),
                        // --- CONFIRM PASSWORD VALIDATION ---
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
                    ),

                    const SizedBox(height: 32),

                    // Signup button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If valid, navigate to Login Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                  Text('Please fill all fields correctly')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4C4A8),
                          foregroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text(
                          'SIGNUP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Login text
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have Account? ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 0.3,
                          ),
                          children: [
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const LoginScreen()),
                                  );
                                },
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Color(0xFFD4C4A8),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Bottom indicator
                    Center(
                      child: Container(
                        width: 134,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2.5),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}