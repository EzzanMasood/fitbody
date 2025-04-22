import 'package:fitbody/screens/profilescreens/favoritevedio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/provider/search_provider.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/profilescreens/favoritearticle.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          titleSpacing: 0,
          title: const ReuseableTextWidget(
            text: "Favorites",
            textColor: AppColors.darkpurple,
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.yellow),
          ),
          backgroundColor: AppColors.backgroundColor,
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchScreen()),
                    );
                  },
                  icon: const Icon(Icons.search),
                  color: AppColors.darkpurple,
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationScreen()),
                    );
                  },
                  icon: const Icon(Icons.notifications),
                  color: AppColors.darkpurple,
                  visualDensity: VisualDensity.compact,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyProfileScreen()),
                    );
                  },
                  icon: const Icon(Icons.person),
                  color: AppColors.darkpurple,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Consumer<SearchProvider>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ReuseableTextWidget(
                            text: "Sort by",
                            textColor: AppColors.yellow,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => provider.isSelected(1),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: provider.isSelected1
                                      ? AppColors.yellow
                                      : AppColors.white,
                                ),
                                child: Center(
                                  child: ReuseableTextWidget(
                                    text: "All",
                                    textColor: provider.isSelected1
                                        ? AppColors.black
                                        : AppColors.purple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => provider.isSelected(2),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: provider.isSelected2
                                      ? AppColors.yellow
                                      : AppColors.white,
                                ),
                                child: Center(
                                  child: ReuseableTextWidget(
                                    text: "Video",
                                    textColor: provider.isSelected2
                                        ? AppColors.black
                                        : AppColors.purple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => provider.isSelected(3),
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: provider.isSelected3
                                      ? AppColors.yellow
                                      : AppColors.white,
                                ),
                                child: Center(
                                  child: ReuseableTextWidget(
                                    text: "Article",
                                    textColor: provider.isSelected3
                                        ? AppColors.black
                                        : AppColors.purple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                       if (provider.isSelected2)
                         SizedBox(
                             height: MediaQuery.of(context).size.height*0.8,
                          child: FavoriteVedioScreen(),
                                                 ),
                      if (provider.isSelected3)
                         SizedBox(
                           height: MediaQuery.of(context).size.height*0.8,
                          child: FavoriteArticleScreen(),
                                                 ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}