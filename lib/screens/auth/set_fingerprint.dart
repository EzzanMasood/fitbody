import 'package:flutter/material.dart';
import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/auth/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SetFingerprint extends StatefulWidget {
  const SetFingerprint({super.key});

  @override
  State<SetFingerprint> createState() => _SetFingerprintState();
}

class _SetFingerprintState extends State<SetFingerprint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title:const ReuseableTextWidget(text: "Set your Fingerprint",
        textColor: AppColors.yellow,
        fontFamily:"Poopins" ,
       ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
         Navigator.pop(context);
        },
         icon:const Icon(Icons.arrow_back_ios_rounded),
         color: AppColors.yellow,
         iconSize: 25.0,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Padding(
          padding:  EdgeInsets.only(left: 20.0,right: 20.0),
            child: ReuseableTextWidget(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
            textColor: AppColors.white,
            fontSize: 12,
            ),
          ),
       const   SizedBox(height: 30,),
          Container(
            color: AppColors.purple,
            height: 230,
            width: double.infinity,
            child:const Padding(
              padding:  EdgeInsets.only(left: 20.0,right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              FaIcon(Icons.fingerprint,size: 180,color: AppColors.white,),
                ],
              ),
            ),
          ),
        const  SizedBox(height: 20,),
          CustomButton(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogIn())); 
          },
          border: Border.all(color: AppColors.white),
          color: AppColors.button,
          borderRadius: BorderRadius.circular(30),
          height: 50,
          width: 170,
           child:const ReuseableTextWidget(text:"Skip",
           textColor: AppColors.white,
           fontFamily: "Poopins",
           )
           ),
          const  SizedBox(height: 10,),
          CustomButton(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogIn())); 
          },
          border: Border.all(color: AppColors.white),
          color: AppColors.button,
          borderRadius: BorderRadius.circular(30),
          height: 50,
          width: 170,
           child:const ReuseableTextWidget(text:"Continue",
           textColor: AppColors.white,
           fontFamily: "Poopins",
           )
           ),
        ],
      ),
    );
  }
}