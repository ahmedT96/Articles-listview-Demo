// ignore_for_file: file_names, must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  late bool readOnly = false;
  final TextEditingController control;
  final TextInputType type;
  late dynamic validator;
  Function? onSubmit;
  Function? onChanged;
  Function()? onTap;
  late bool isPassword = false;
  bool? isEnabled = false;
  String? label;
  String? hint;
  Widget? prefix;
  IconData? suffix;
  Function()? suffixClicked;
  TextStyle? hintStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 12,
  );
  Color borderColor = Colors.grey;
  Color labelColor = Colors.grey;
  Color textColor = Colors.white;
  Color backgroundColor = Colors.blueGrey;
  Color? prefixIconColor = Colors.limeAccent;
  Color? suffixIconColor = Colors.black;
  String? textInputFormat;
  AutovalidateMode? isAutoValid;
  int maxText = 1;

  MyTextFormField(
      {Key? key,
      required this.readOnly,
      required this.control,
      this.hint,
      required this.type,
      this.validator,
      this.onSubmit,
      this.onChanged,
      this.onTap,
      required this.isPassword,
      this.isEnabled,
      this.label,
      this.prefix,
      this.suffix,
      this.maxText = 1,
      this.suffixClicked,
      this.textInputFormat,
      this.hintStyle,
      this.isAutoValid})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 50,
      child: TextFormField(
        inputFormatters: const [
          // FilteringTextInputFormatter.allow(RegExp('$textInputFormat')),
        ],
        readOnly: readOnly,
        autovalidateMode: isAutoValid,
        maxLines: maxText,
        controller: control,
        keyboardType: type,
        validator: validator,
        onFieldSubmitted: (s) {
          onSubmit!(s);
        },
        onTap: () {
          onTap!();
        },
        obscureText: isPassword,
        enabled: isEnabled,
        onChanged: (value) {
          onChanged!(value);
        },
        style: TextStyle(
          //textColor
          color: Theme.of(context).textTheme.bodyText1!.color,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            // fontSize: FontSize.size10,
            color: Colors.red,
          ),
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          labelText: label,
          hintText: hint,
          // labelColor
          labelStyle:
              const TextStyle(color: Colors.black, height: 1.5, fontSize: 14),
          hintStyle: hintStyle,
          prefixIcon: prefix,
          prefixIconColor: Colors.black,
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixClicked!();
                  },
                  icon: Icon(suffix,
                      // suffixIconColor
                      color: Colors.black),
                )
              : null,
          // Theme.of(context).backgroundColor
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).textTheme.bodyText1!.color!,
              width: 1,
            ),
            // borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).textTheme.bodyText1!.color!, width: 2),
            // borderRadius: BorderRadius.circular(10)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
