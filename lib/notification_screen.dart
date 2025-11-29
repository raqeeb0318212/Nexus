import 'package:flutter/material.dart';

// --- Color Constants based on Design Sampling ---
const Color _primaryTaupe = Color(0xFFB4AFAF);
const Color _darkText = Color(0xFF333333);
const Color _cardBackground = Color(0xFFEBEBEB);
const Color _uniChatHubBlue = Color(0xFF6A5ACD);

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _primaryTaupe,
        elevation: 0,
        toolbarHeight: 50,

        // This prevents the automatic back arrow so we can use your custom design
        automaticallyImplyLeading: false,

        title: const Text(
          'Notification',
          style: TextStyle(
            color: _darkText,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: _darkText),
          onPressed: () {
            // Handle menu if needed, or leave empty
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: _darkText),
            onPressed: () {
              // Already on notification screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // --- Back Button Row ---
              // Wrapped in GestureDetector for navigation
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Go back to Home
                },
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back_ios, size: 18, color: _darkText),
                    const SizedBox(width: 4),
                    const Text(
                      'Back',
                      style: TextStyle(
                        color: _darkText,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // --- Notification Cards ---
              const NotificationCard(
                title: 'UniChatHub',
                messageHeader: 'Hi, Raqeeb!',
                messageBody: 'Lorem ipsum dolor sit amet, consectetur adipiscing el',
              ),
              const SizedBox(height: 16),
              const NotificationCard(
                title: 'UniChatHub',
                messageHeader: 'Hi, Raqeeb!',
                messageBody: 'Lorem ipsum dolor sit amet, consectetur adipiscing el',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String messageHeader;
  final String messageBody;

  const NotificationCard({
    super.key,
    required this.title,
    required this.messageHeader,
    required this.messageBody,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Purple/blue dot
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: _uniChatHubBlue,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: _darkText,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            messageHeader,
            style: const TextStyle(
              color: _darkText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            messageBody,
            style: TextStyle(
              color: _darkText.withOpacity(0.7),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}