import 'package:dailyquiz/functions/theme.dart';
import 'package:flutter/material.dart';

class AlternativeButton extends StatelessWidget {
  AlternativeButton({super.key, this.optionText, this.isChosen = false});
  String? optionText;
  bool isChosen;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      width: width - 60,
      decoration: BoxDecoration(
        color: isChosen ? blue : Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8, spreadRadius: 0, offset: const Offset(2, 2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(),
          Text(
            optionText!,
            style: textBlack.copyWith(
              color: isChosen ? Colors.white : Colors.black,
              fontSize: 20,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
