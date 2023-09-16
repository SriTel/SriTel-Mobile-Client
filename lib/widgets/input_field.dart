import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';

enum InputType { floatingTitle, separateTitle, noTitle}

class InputField extends StatelessWidget {
  final InputType type;
  final Icon? leadingIcon;
  final Color color;
  final double height;
  final Color fillColor;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const InputField({
    super.key,
    required this.labelText,
    required this.controller,
    this.type = InputType.separateTitle,
    this.leadingIcon,
    this.color = SriTelColor.titleTextColor,
    this.height = 54,
    this.fillColor = SriTelColor.lighterWhite,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(type == InputType.separateTitle)
          Text(
          labelText,
          style: const TextStyle(
            color: SriTelColor.titleTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        if(type == InputType.separateTitle)
          const SizedBox(
          height: 8,
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: SriTelColor.lighterWhite,
            border: Border.all(
              color: SriTelColor.grey,
              width: 0.5
            )
          ),
          child: TextField(
            onChanged: onChanged != null ? (value) => onChanged!(value) : null,
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(
              color: color, // Change the text color here
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
                  borderSide: const BorderSide(color: SriTelColor.lighterBlack)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: SriTelColor.lighterBlack)),
              filled: true,
              label: Text(labelText, style: TextStyle(color: color)),
              hintStyle: const TextStyle(color: SriTelColor.lightWhite),
            ),
          ),
        ),
      ],
    );
  }
}
