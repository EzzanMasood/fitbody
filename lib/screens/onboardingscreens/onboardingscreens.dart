import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreens extends StatefulWidget {
  const Onboardingscreens({super.key});

  @override
  State<Onboardingscreens> createState() => _OnboardingscreensState();
}

class _OnboardingscreensState extends State<Onboardingscreens> {
  PageController _controller = PageController();
  bool isLastIndex = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int index) {
              setState(() {
                isLastIndex = (index == 2);
              });
            },
            controller: _controller,
            children: [
              _buildPageViewWidget(
                backgroundImage: "assets/images/onboarding/onboardingb.png",
                title: "Start your journey towards\n a more active lifestyle",
                imagePath: "assets/images/onboarding/onboardinglogob.png",
              ),
              _buildPageViewWidget(
                backgroundImage: "assets/images/onboarding/onboardingc.png",
                title: "Find nutrition tips that\n fit your lifestyle",
                imagePath: "assets/images/onboarding/onboardinglogoc.png",
              ),
              _buildPageViewWidget(
                backgroundImage: "assets/images/onboarding/onboardingd.png",
                title: "A community for you,\n challenge yourself",
                imagePath: "assets/images/onboarding/onboardinglogod.png",
              ),
            ],
          ),
          if (!isLastIndex)
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogIn()));
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.yellow,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 150,
                child: isLastIndex
                    ? CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        },
                        color: AppColors.button,
                        border: Border.all(color: Colors.white),
                        height: 50,
                        borderRadius: BorderRadius.circular(30),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : CustomButton(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        color: AppColors.button,
                        border: Border.all(color: Colors.white),
                        height: 50,
                        borderRadius: BorderRadius.circular(30),
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageViewWidget({
    required String backgroundImage,
    required String title,
    required String imagePath,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 200,
            width: double.infinity,
            color: AppColors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.white,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
