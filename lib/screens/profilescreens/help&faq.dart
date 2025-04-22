import 'package:fitbody/provider/helpfaq_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/profilescreens/contactusscreen.dart';
import 'package:fitbody/screens/profilescreens/faqscreen.dart';

class HelpFaqScreen extends StatefulWidget {
  const HelpFaqScreen({super.key});

  @override
  State<HelpFaqScreen> createState() => _HelpFaqScreenState();
}

class _HelpFaqScreenState extends State<HelpFaqScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HelpFaqProvider>(
      create: (_) => HelpFaqProvider(),
      child: Consumer<HelpFaqProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const ReuseableTextWidget(
                text: "Help & Faq",
                textColor: AppColors.darkpurple,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: AppColors.yellow),
              ),
              backgroundColor: AppColors.backgroundColor,
            ),
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReuseableTextWidget(
                    text: "How can We Help you",
                    textColor: AppColors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.isSelected(1),
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: provider.isSelected1
                                  ? AppColors.yellow
                                  : AppColors.white,
                            ),
                            child: Center(
                              child: ReuseableTextWidget(
                                text: "FAQ",
                                textColor: provider.isSelected1
                                    ? AppColors.black
                                    : AppColors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => provider.isSelected(2),
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: provider.isSelected2
                                  ? AppColors.yellow
                                  : AppColors.white,
                            ),
                            child: Center(
                              child: ReuseableTextWidget(
                                text: "Contact Us",
                                textColor: provider.isSelected2
                                    ? AppColors.black
                                    : AppColors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (provider.isSelected1)
                    MyTextField(
                      hintText: "Search",
                      hintTextColor: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  const SizedBox(height: 20),
                  if (provider.isSelected1) FaqScreen(),
                  if (provider.isSelected2) ContactUsScreen(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
