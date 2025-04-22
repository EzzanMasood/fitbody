import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/setup/gendersetup.dart';
import 'package:flutter/material.dart';

class SetUpScreen extends StatefulWidget {
  const SetUpScreen({super.key});

  @override
  State<SetUpScreen> createState() => _SetUpScreenState();
}

class _SetUpScreenState extends State<SetUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Image.asset("assets/images/setup/setup.png"),
          const SizedBox(height: 10,),
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const ReuseableTextWidget(text:"Consistency is .",
         textColor: AppColors.yellow,
         fontFamily: "Poopins",
         fontSize: 24,
         ), const ReuseableTextWidget(text:"The Key to progress.",
         textColor: AppColors.yellow,
         fontFamily: "Poopins",
         fontSize: 24,
         ),
                  const ReuseableTextWidget(text:"Dont't give up !",
         textColor: AppColors.yellow,
         fontFamily: "Poopins",
         fontSize: 24,
         ),
         const SizedBox(height: 10,),
         Container(
          height: 100,
          width: double.infinity,
          color: AppColors.purple,
          child: const Padding(
           padding:  EdgeInsets.only(left: 20.0,right: 20.0),
            child:  Center(
              child: ReuseableTextWidget(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                textColor: AppColors.black,
                fontSize: 12,
                ),
                
            ),
          ),
         ),
         const  SizedBox(height: 20,),
          CustomButton(onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const GenderSetUpScreen()));
          },
          border: Border.all(color: AppColors.white),
          color: AppColors.button,
          borderRadius: BorderRadius.circular(30),
          height: 50,
          width: 170,
           child:const ReuseableTextWidget(text:"Next",
           textColor: AppColors.white,
           fontFamily: "Poopins",
           )
           ),
        ],
       ),
        ],
      ),
    );
  }
}