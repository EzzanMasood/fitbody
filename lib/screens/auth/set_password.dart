import 'package:fitbody/screens/auth/set_fingerprint.dart';
import 'package:flutter/material.dart';
import 'package:fitbody/components/buttons.dart';
import 'package:fitbody/components/textfields.dart';
import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';


class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title:const ReuseableTextWidget(text: "Set Password",
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
            child:Padding(
              padding:  const EdgeInsets.only(left: 20.0,right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  MyTextField(hintText: "Enter your Password",
                  labelText:"Password",
                  hintTextColor: Colors.grey,
                  ),
SizedBox(height: 10,),
MyTextField(hintText: "Re-Enter your Password",
                  labelText:"Confirm Password",
                  hintTextColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        const  SizedBox(height: 20,),
          CustomButton(onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const SetFingerprint())); 
          },
          border: Border.all(color: AppColors.white),
          color: AppColors.button,
          borderRadius: BorderRadius.circular(30),
          height: 50,
          width: 170,
           child:const ReuseableTextWidget(text:"Reset Password",
           textColor: AppColors.white,
           fontFamily: "Poopins",
           )
           ),
        
        ],
      ),
    );
  }
}