
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task_gain_solution/core/common_widgets/custom_dialog.dart';
import 'package:flutter_task_gain_solution/core/common_widgets/custom_text.dart';
import 'package:flutter_task_gain_solution/core/utils/app_color.dart';
import 'package:flutter_task_gain_solution/core/utils/utils.dart';

import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/utils/k_images.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomDialog(
      icon: KImages.exitFromAppIcon,
      height: size.height * 0.32,
      child: Column(
        children: [
          const CustomText(
            text: 'Are you sure\nYou want to Exit?',
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: blackColor,
            textAlign: TextAlign.center,
          ),
          Utils.verticalSpace(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PrimaryButton(
                text: 'Cancel',
                onPressed: () => Navigator.of(context).pop(),
                borderRadiusSize: 6.0,
                bgColor: blackColor,
                isGradient: false,
                fontSize: 16.0,
                minimumSize: Size(Utils.hSize(125.0), Utils.vSize(52.0)),
              ),
              PrimaryButton(
                text: 'Exit',
                onPressed: () => SystemNavigator.pop(),
                bgColor: redColor,
                borderRadiusSize: 6.0,
                fontSize: 16.0,
                minimumSize: Size(Utils.hSize(125.0), Utils.vSize(50.0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
