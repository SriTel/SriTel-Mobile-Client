import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';

enum InputType { floatingTitle, separateTitle, noTitle, disabled}

class InputField extends StatelessWidget {
  final InputType type;
  final Icon? leadingIcon;
  final Color color;
  final double height;
  final Color fillColor;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool numberInput;

  const InputField({
    super.key,
    required this.labelText,
    required this.controller,
    this.type = InputType.separateTitle,
    this.leadingIcon,
    this.color = SriTelColor.grey,
    this.height = 54,
    this.fillColor = SriTelColor.lighterWhite,
    this.obscureText = false,
    this.numberInput = false,
    String? hintText,
    this.onChanged,
  }) : hintText = hintText ?? labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(type == InputType.separateTitle || type == InputType.disabled)
          Text(
          labelText,
          style: const TextStyle(
            color: SriTelColor.titleTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        if(type == InputType.separateTitle || type == InputType.disabled)
          const SizedBox(
          height: 8,
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: SriTelColor.lighterWhite,
            // border: Border.all(
            //   color: SriTelColor.lighterGrey.withOpacity(0.5),
            //   width: 1
            // )
          ),
          child: TextField(
            onChanged: onChanged != null ? (value) => onChanged!(value) : null,
            controller: type == InputType.disabled ? null : controller,
            obscureText: obscureText,
            keyboardType: numberInput ? TextInputType.number : TextInputType.text,
            enabled: type == InputType.disabled ? false : true,
            style: const TextStyle(
              color: SriTelColor.titleTextColor, // Change the text color here
              fontSize: 15.0,
            ),
            decoration: InputDecoration(
              fillColor: fillColor,
              prefixIcon: leadingIcon != null
                  ? Text(
                    '\nRs.',
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                      height: 1
                    ),
                    textAlign: TextAlign.center,
                  )
                  : null,
              floatingLabelBehavior: type == InputType.floatingTitle ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
              floatingLabelStyle: const TextStyle(
                  color: SriTelColor.lighterWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: SriTelColor.lightGrey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: SriTelColor.grey)),
              filled: true,
              label: Text(hintText, style: TextStyle(color: color)),
              hintStyle: TextStyle(color: color),
            ),
          ),
        ),
      ],
    );
  }
}
