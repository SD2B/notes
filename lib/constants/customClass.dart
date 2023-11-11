

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final Color? cursorColor;
  final bool obscureText;
  final String? Function(String?)? validator;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final type;
  final maxlines;
  final void Function(String)? onChanged;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.readOnly=false,
      this.hintText,
      this.labelText,
      this.labelStyle,
      this.cursorColor,
      this.obscureText = false,
      this.validator,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.focusedErrorBorder,
      this.maxlines = 1,
      this.prefixIcon,
      this.suffixIcon,
      this.style,
      this.type,
      this.onChanged,});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly  ,
      style: widget.style,
      cursorColor: widget.cursorColor,
      maxLines: widget.maxlines,
      keyboardType: widget.type,
      controller: widget.controller,
      onChanged: (value) {
        // Handle the value change here
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        enabledBorder: widget.enabledBorder,
        focusedBorder: widget.focusedBorder,
        errorBorder: widget.errorBorder,
        focusedErrorBorder: widget.focusedErrorBorder,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? IconButton(
                color: Colors.green[200],
                icon: Icon(
                    _obscureText ? (Icons.visibility_off) : (Icons.visibility)),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
      obscureText: widget.obscureText && _obscureText,
      validator: widget.validator,
    );
  }
}

// -------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
class CustomContainer extends StatefulWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  final BoxDecoration? decoration;
  final VoidCallback? onTap;
  EdgeInsets? padding;
  BorderRadius? borderRadius;
  CustomContainer(
      {this.child,
      this.height,
      this.width,
      this.padding,
      this.color,
      this.borderRadius,
      this.decoration,
      this.onTap});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: widget.padding,
        width: widget.width,
        height: widget.height,
        color: widget.color,
        decoration: widget.decoration,
        child: widget.child,
      ),
    );
  }
}
// -------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
