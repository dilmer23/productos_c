import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producto_c_node/app/utils/utils.dart';

class TextFromFielProduct extends StatelessWidget {
  final dynamic labelText;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType textInputType;
  final dynamic inputFormatters;
  final dynamic provider;
  final dynamic maxLength;
  const TextFromFielProduct(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.controller,
      required this.textInputType,
      required this.inputFormatters,
      required this.maxLength,
      this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: maxLength,
        validator: ((value) {
          if (value == null || (maxLength > value.length)) {
            return 'Does not meet the maximum required';
          }
          if ((maxLength < value.length)) {
            return 'Does not meet the minimum required';
          }
          return null;
        }),
        keyboardType: textInputType,
        inputFormatters: [inputFormatters],
        onChanged: ((value) {
          if (isNumeric(value)) {
            int valorInput = int.parse(value);
            provider(valorInput);
          } else {
            provider(value);
          }
        }),
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          icon: icon,
        ),
      ),
    );
  }
}
