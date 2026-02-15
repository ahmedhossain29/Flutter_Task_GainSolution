import 'package:flutter/material.dart';
import '../utils/k_images.dart';
import '../utils/utils.dart';
import 'custom_image.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.icon,
    required this.child,
    this.height = 0.0,
  });

  final String icon;
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Dialog(
      insetPadding: Utils.symmetric(),
      shape: RoundedRectangleBorder(borderRadius: Utils.borderRadius()),
      child: SizedBox(
        width: Utils.hSize(size.width),
        height: Utils.vSize(height),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                left: 0.0,
                right: 0.0,
                top: -82.0,
                child: CustomImage(
                  path: KImages.dialogIcon,
                  width: Utils.hSize(164.0),
                  height: Utils.vSize(164.0),
                )),
            Positioned(
                left: 0.0,
                right: 0.0,
                top: -30.0,
                child: CustomImage(path: icon)),
            Positioned.fill(
              top: Utils.vSize(100.0),
              child: child,
            )

          ],
        ),
      ),
    );
  }
}
