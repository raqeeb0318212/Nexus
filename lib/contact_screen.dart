import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🎨 Colors extracted to closely match the Figma design
    const Color backgroundColor = Color(0xFFB4A8A9); // Mauve / dusty rose
    const Color textFieldColor = Color(0xFFD8D8D8); // Light gray
    const Color buttonColor = Color(0xFFD5B99B); // Soft beige
    const Color blackText = Colors.black;
    const Color backColor = Color(0xFF3A2267); // Deep purple for "Back"

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        // Left menu icon - Navigates back in this context
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        // Right notification icon
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications_none, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back text + icon
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back to Menu
                },
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back, color: backColor, size: 22),
                    SizedBox(width: 4),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: backColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Name label
              const Text(
                'Name',
                style: TextStyle(
                  color: blackText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              // Name text field
              Container(
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Email label
              const Text(
                'Email:',
                style: TextStyle(
                  color: blackText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              // Email text field
              Container(
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Description label
              const Text(
                'Description',
                style: TextStyle(
                  color: blackText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              // Description text field
              Container(
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Submit button
              Center(
                child: SizedBox(
                  width: 160,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Submit action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: blackText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}