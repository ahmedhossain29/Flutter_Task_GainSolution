import 'package:flutter/cupertino.dart';

import '../../../../core/common_widgets/custom_text.dart';
import '../../../../core/utils/app_color.dart';



class FetchErrorText extends StatelessWidget {
  const FetchErrorText(
      {super.key, required this.text, this.textColor = redColor});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: text,
        color: textColor,
        fontSize: 14.0,
      ),
    );
  }
}
