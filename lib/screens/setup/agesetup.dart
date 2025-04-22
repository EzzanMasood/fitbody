import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/setup/weightsetup.dart';
import 'package:flutter/material.dart';
class AgeSetUpScreen extends StatefulWidget {
  const AgeSetUpScreen({super.key});

  @override
  State<AgeSetUpScreen> createState() => __AgeSetUpScreenState();
}

class __AgeSetUpScreenState extends State<AgeSetUpScreen> {
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
  
        title: const ReuseableTextWidget(text: "Back",textColor: AppColors.yellow,fontWeight: FontWeight.bold,),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back_ios_new_outlined),color: AppColors.yellow,),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(

        children: [

         const SizedBox(height: 40,),
         Column(
        children: [
          const Center(
            child: ReuseableTextWidget(text: "How Old are you?",
            fontSize: 24,
            textColor: AppColors.white,
            fontFamily: "Poppins",
            ),
          ),
          const SizedBox(height: 20,),
          const SizedBox(
            height: 20,
          ),
          const ReuseableTextWidget(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const ReuseableTextWidget(
            text: " sed do eiusmod tempor incididunt ut labore et dolore",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const ReuseableTextWidget(
            text: "magna aliqua",
            textColor: AppColors.white,
            fontSize: 12,
          ),
          const SizedBox(height: 50,),
         CustomButton(
                  onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context)=>const WeightSetUpScreen()));
                           
                  },
                  border: Border.all(color: AppColors.white),
                  color: AppColors.button,
                  borderRadius: BorderRadius.circular(30),
                  height: 50,
                  width: 170,
                  child: const ReuseableTextWidget(
                    text: "Continue",
                    textColor: AppColors.white,
                    fontFamily: "Poppins",
                  )),
              const    SizedBox(height: 60,),
        ],
         )
        ],
      ),
    );
  }
}