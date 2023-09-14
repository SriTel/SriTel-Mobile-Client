import 'package:SriTel/theme/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
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
    this.leadingIcon,
    this.color = SriTelColor.titleTextColor,
    this.height = 54,
    this.fillColor = SriTelColor.lighterWhite,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: SriTelColor.lighterWhite,
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
              ? Icon(
            leadingIcon?.icon,
                  color: color,
                  size: 22,
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
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
    );
  }
}
