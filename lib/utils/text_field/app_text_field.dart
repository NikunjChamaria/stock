import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stocks/contants/color.dart';
import 'package:stocks/utils/app_text/app_text.dart';
import 'package:stocks/utils/app_text/app_text_type.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Color bgColor;
  final Color borderColor;
  final IconData icon;
  final bool isObscure;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.bgColor,
    required this.borderColor,
    required this.icon,
    this.isObscure = false,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = false;
  bool hasError = false;

  @override
  void initState() {
    isObscure = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(
              color: hasError ? ColorConstant.red : widget.borderColor,
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: isObscure,
            style: selectTextStyle(AppTextType.smallText),
            validator: (value) {
              final error = widget.validator?.call(value);
              setState(() => hasError = error != null);
              return error;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 16.w,
              ),
              border: InputBorder.none,
              labelText: widget.label,
              hintText: "Enter your ${widget.label}",
              hintStyle: selectTextStyle(AppTextType.smallTextLight),
              labelStyle: selectTextStyle(AppTextType.smallTextLight),
              errorStyle: selectTextStyle(AppTextType.cardText),
              prefixIcon: Icon(
                widget.icon,
                color: widget.borderColor,
                size: 24.sp,
              ),
              suffixIcon: widget.isObscure
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        color: widget.borderColor,
                        size: 24.sp,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
