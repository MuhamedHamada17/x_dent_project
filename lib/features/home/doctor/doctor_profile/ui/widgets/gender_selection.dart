import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  int selectedGenderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: List.generate(2, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedGenderIndex = index;
            });
          },
          child: Row(
            children: [
              Icon(
                selectedGenderIndex == index
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                index == 0 ? "Male" : "Female",
                style: TextStyles.font20BlackRegular,
              ),
              horizontalSpace(50),
            ],
          ),
        );
      }),
    );
  }
}
