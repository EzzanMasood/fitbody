import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 245,
                width: double.infinity,
                color: AppColors.purple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Text(
                      'Madison Smith',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Text(
                      'madisons@example.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Text(
                      'Birthday: April 1st',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColor,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const MyTextField(
                            hintText: "Madison Smith",
                            labelText: "Full name",
                            labelTextColor: AppColors.purple,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MyTextField(
                            hintText: "madison@gmail.com",
                            labelText: "Email",
                            labelTextColor: AppColors.purple,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MyTextField(
                            labelText: "Mobile Number",
                            hintText: "+123 456 78910",
                            labelTextColor: AppColors.purple,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MyTextField(
                            labelText: "Date of Birth",
                            hintText: "1/1/2001",
                            labelTextColor: AppColors.purple,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MyTextField(
                            labelText: "Weight",
                            hintText: "75kg",
                            labelTextColor: AppColors.purple,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MyTextField(
                            labelText: "Height",
                            hintText: "165cm",
                            labelTextColor: AppColors.purple,
                          ),
                           const SizedBox(height: 30),
          CustomButton(
            onTap: () {
            },
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(30),
            height: 50,
            width: 250,
            child: const ReuseableTextWidget(
              text: "Update Profile",
              textColor: AppColors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height:20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 210,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.darkpurple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatsItemWithDivider('75 Kg', 'Weight'),
                  _buildStatsItemWithDivider('28', 'Years Old'),
                  _buildStatsItem('1.65 CM', 'Height'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsItemWithDivider(String value, String label) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Container(
          height: 30,
          width: 1,
          color: Colors.white70,
          margin: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ],
    );
  }

  Widget _buildStatsItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
