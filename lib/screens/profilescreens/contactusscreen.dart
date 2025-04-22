import 'package:fitbody/config/colors.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return 
       Expanded(
                child: ListView(
                  children: [
                    ContactOption(
                      imagePath: 'assets/images/contactus/customer.png',
                      title: "Customer Service",
                      onTap: () {
    
                      },
                    ),
                    ContactOption(
                      imagePath: 'assets/images/contactus/website.png',
                      title: "Website",
                      onTap: () {
          
                      },
                    ),
                    ContactOption(
                      imagePath: 'assets/images/contactus/whatsapp.png',
                      title: "WhatsApp",
                      onTap: () {
              
                      },
                    ),
                    ContactOption(
                      imagePath: 'assets/images/contactus/facebook.png',
                      title: "Facebook",
                      onTap: () {
        
                      },
                    ),
                    ContactOption(
                      imagePath: 'assets/images/contactus/instagram.png',
                      title: "Instagram",
                      onTap: () {
        
                      },
                    ),
                  ],
                ),
              
    );
  }
}
class ContactOption extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const ContactOption({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: CircleAvatar(
        backgroundColor: AppColors.darkpurple,
        child: Image.asset(
          imagePath,
          width: 24,
          height: 24,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: GestureDetector(
        onTap: onTap, 
        child: const Icon(
          Icons.arrow_drop_down,
          color: AppColors.yellow,
          size: 30,
        ),
      ),
      onTap: onTap, 
    );
  }
}