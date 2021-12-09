import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:walleto/shared/theme.dart';

class CustomDropdownField extends StatelessWidget {
  final String labelName;
  final String hintText;
  // final String? errorValidation;
  final String? value;
  final List<String> options;
  final Function(String?)? onChanged;
  final bool isEdit;

  CustomDropdownField({
    // this.errorValidation,
    required this.onChanged,
    required this.labelName,
    required this.hintText,
    this.value,
    required this.options,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              labelName,
              style: blackTextStyle.copyWith(fontSize: 14),
            ),
            // if (errorValidation != null)
            //   Text(
            //     errorValidation!,
            //     style: blackTextStyle.copyWith(
            //       fontSize: 12,
            //     ),
            //   ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(16.0),
            filled: true,
            hintText: hintText,
            hintStyle: greyTextStyle.copyWith(
              fontSize: 14,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kBlueColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          // value: value,
          items: options.map((String option) {
            return DropdownMenuItem(
              child: Text(
                option,
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              value: option,
            );
          }).toList(),
          // onChanged: onChanged,
        ),
      ],
    );
  }
}
