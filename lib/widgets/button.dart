import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, primaryColor, disabled }

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;
  final double iconSize;
  final Color borderColor;
  final Color color;
  final ButtonType type;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final bool showBorder;

  const Button({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.type = ButtonType.primary,
    this.leftIcon,
    this.rightIcon,
    this.height = 55,
    this.width = double.infinity,
    this.fontSize = 18,
    this.fontWeight = FontWeight.normal,
    this.iconSize = 21,
    this.borderColor = SriTelColor.lightWhite,
    this.color = SriTelColor.white,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(0),
          ),
          child: Container(
            width: double.infinity,
            height: height,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: type == ButtonType.primary
                    ? SriTelColor.primaryColor
                    : type == ButtonType.primaryColor
                        ? SriTelColor.lighterBlack
                        : SriTelColor.secondaryColor,
              shape: RoundedRectangleBorder(
                side: showBorder
                    ? BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: borderColor,
                      )
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (leftIcon != null)
                  SizedBox(
                    width: iconSize + 3,
                    height: iconSize + 3,
                    child: Icon(
                      leftIcon?.icon,
                      color: color,
                      size: iconSize,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: type == ButtonType.disabled
                          ? SriTelColor.lighterWhite
                          : color,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
                if (rightIcon != null)
                  SizedBox(
                    width: iconSize + 3,
                    height: iconSize + 3,
                    child: Icon(
                      rightIcon?.icon,
                      color: color,
                      size: iconSize,
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
