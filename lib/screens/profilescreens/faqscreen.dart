import 'package:fitbody/config/colors.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
                
                child: ListView(
                  
                  children: const [
                     const Divider(
              color: AppColors.yellow,
              thickness: 1,
            ),
                    FaqItem(
                      question: "Lorem ipsum dolor sit amet?",
                      answer:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Prossent pellentesque congue lorem, vel tincidunt tortor plosnort o.Prion oc dom quam. Aenean in sogittis magna, ut leugiat diam.",
                    ),
                    FaqItem(
                      question: "Lorem ipsum dolor sit amet?",
                      answer: "Lorem ipsum dolor sit amet?",
                    ),
                    FaqItem(
                      question: "Lorem ipsum dolor sit amet?",
                      answer: "Lorem ipsum dolor sit amet?",
                    ),
                    FaqItem(
                      question: "Lorem ipsum dolor sit amet?",
                      answer: "Lorem ipsum dolor sit amet?",
                    ),
                    FaqItem(
                      question: "Lorem ipsum dolor sit amet?",
                      answer: "Lorem ipsum dolor sit amet?",
                    ),
                  ],
                ),
              
    );
  }
}
class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ExpansionTile(
                title: Text(
                  question,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                trailing: const SizedBox.shrink(),
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                tilePadding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      answer,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: AppColors.yellow,
            ),
          ],
        ),
        const Divider(
          color: AppColors.yellow,
          thickness: 1,
        ),
      ],
    );
  }
}