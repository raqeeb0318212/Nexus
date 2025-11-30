import 'package:flutter/material.dart';

// IMPORTANT: Import your other screens here
import 'color_change_screen.dart';
import 'about_app_screen.dart';
import 'login_screen.dart';
import 'user_details_screen.dart'; // Import UserDetailsScreen

// Custom colors derived from the Figma design
const Color _backgroundColor = Color(0xFFEBE3E3);
const Color _foregroundColor = Colors.black87;
const Color _buttonColor = Color(0xFFCBB8A1);
const Color _closeIconColor = Color(0xFF5A4C6B);

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  // Helper widget to build each menu list item
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    bool isColorful = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(
              icon,
              color: _foregroundColor,
              size: 24,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: _foregroundColor,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: _foregroundColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the custom Sign Out Dialog
  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Title
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
                      child: Text(
                        'Sign out ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: _foregroundColor,
                          height: 1.2,
                        ),
                      ),
                    ),
                    // Subtext
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        'If you answer yes, you will be signed\nout from the app.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: _foregroundColor,
                          height: 1.5,
                        ),
                      ),
                    ),

                    // Yes Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // 1. Close the dialog
                          Navigator.of(dialogContext).pop();

                          // 2. Navigate to Login Screen
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _buttonColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // No Button
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop(); // Close dialog
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(40, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: _foregroundColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),

                // Close/X Icon Button
                Positioned(
                  top: -10,
                  right: -10,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(dialogContext).pop();
                      },
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: _closeIconColor, width: 2),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: _closeIconColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: _foregroundColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Large White Graduation Cap Icon
            const Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 60.0),
              child: Icon(
                Icons.school,
                color: Colors.white,
                size: 100,
              ),
            ),

            // 2. Menu Items List
            _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Profile',
              onTap: () {
                // --- NAVIGATION LOGIC ADDED HERE ---
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.border_color,
              title: 'Home Feed',
            ),
            _buildMenuItem(
              icon: Icons.work_outline,
              title: 'Jobs',
            ),
            _buildMenuItem(
              icon: Icons.chat_bubble_outline,
              title: 'Chat',
            ),
            _buildMenuItem(
              icon: Icons.menu_book_outlined,
              title: 'Events',
            ),
            _buildMenuItem(
              icon: Icons.palette_outlined,
              title: 'Colours',
              isColorful: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorChangeScreen(),
                  ),
                );
              },
            ),
            _buildMenuItem(
              icon: Icons.contact_page_outlined,
              title: 'Contact',
            ),

            const SizedBox(height: 70),

            // 3. Sign Out Button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  _showSignOutDialog(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: _foregroundColor,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      color: _foregroundColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // 4. ABOUT APP Text
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutAppScreen(),
                  ),
                );
              },
              child: const Text(
                'ABOUT APP',
                style: TextStyle(
                  fontSize: 16,
                  color: _foregroundColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: _foregroundColor,
                  decorationThickness: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 40),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}