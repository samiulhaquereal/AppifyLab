import 'package:appifylabtask/src/config/import/imports.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hint = 'Type here',
    this.icon,
    this.isPrefixIcon,
    this.isSuffixIcon,
    this.inputFontSize = 12,
    this.isPasswordField = false,
    this.iconSize,
    this.iconColor,
    this.isRequired = false,
    this.isEnabled  = true,
    this.labelColor = Colors.black,
    this.labelSize = 12,
    this.keyboardType = TextInputType.text,
    this.borderColor = Colors.grey,
    this.inputFontColor = Colors.black,
    this.focusedColor = Colors.blueAccent,
    this.borderRadius = 10,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.maxLine,
    this.isMaxLines,
    this.isMaxLength,
    this.isCompact = true,
    required this.controller,
    required this.isBorder,
    this.label,
    this.hintFontColor = Colors.grey,
    this.hintFontSize = 12,
    this.isLiveErrorTrack = false,
    this.isError = false,
    this.isReadOnly = false,
    this.focusNode ,
    this.inputFormatters ,
    this.liveErrorMessage = 'Something went wrong',
  }){
    controller.addListener(() {
      if (onChanged != null) {
        onChanged!(controller.text);
      }
    });
  }

  final String? hint;
  final String? label;
  final String? liveErrorMessage;
  final int? maxLength;
  final int? maxLine;
  final double? iconSize;
  final double? labelSize;
  final double? inputFontSize;
  final double? hintFontSize;
  final double? borderRadius;
  final Color? iconColor;
  final Color? borderColor;
  final Color? labelColor ;
  final Color? focusedColor;
  final Color? inputFontColor;
  final Color? hintFontColor;
  final bool isBorder;
  final bool? isPrefixIcon;
  final bool? isSuffixIcon;
  final bool? isPasswordField;
  final bool? isRequired;
  final bool? isEnabled;
  final bool? isCompact;
  final bool? isError;
  final bool? isLiveErrorTrack;
  final bool? isMaxLength;
  final bool? isMaxLines;
  final bool? isReadOnly;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureText,
      builder: (BuildContext context, value, Widget? child) {
        return TextFormField(
          textInputAction: TextInputAction.next,
          enableSuggestions: false,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autocorrect: false,
          style: TextStyle(fontSize: inputFontSize,color: inputFontColor),
          controller: controller,
          obscureText: isPasswordField == true ? _obscureText.value : false,
          keyboardType: keyboardType,
          enabled: isEnabled,
          readOnly: isReadOnly!,
          maxLength: isMaxLength == true ? maxLength : null,
          maxLines: isMaxLines == true ? maxLine : 1,
          decoration: InputDecoration(
            isDense: isCompact,
            errorText: isLiveErrorTrack == true ? isError == true ? liveErrorMessage : null : null,
            suffixIcon: isSuffixIcon == true ? Icon(icon, size: iconSize, color: iconColor) : isPasswordField == true ? IconButton(
              color: iconColor,
              onPressed: () {
                _obscureText.value == true ? _obscureText.value = false : _obscureText.value = true ;
              },
              icon: Icon(_obscureText.value == true ? Icons.visibility_off : Icons.visibility),
            ): null,
            prefixIcon: isPrefixIcon == true ? Icon(icon, size: iconSize, color: iconColor) : null,
            enabledBorder: isBorder == true ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: BorderSide(color: borderColor!))
                : UnderlineInputBorder(
                borderSide: BorderSide(color: borderColor!)),
            focusedBorder: isBorder == true ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: BorderSide(color: focusedColor!))
                : UnderlineInputBorder(
                borderSide: BorderSide(color: focusedColor!)),
            errorBorder: isBorder == true ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: const BorderSide(color: AppColors.redColor))
                : const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.redColor)),
            focusedErrorBorder: isBorder == true ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius!),
                borderSide: const BorderSide(color: AppColors.redColor))
                : const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.redColor)),
            hintText: hint,
            hintStyle: TextStyle(fontSize: hintFontSize,color: hintFontColor),
            label: label == null ? null : RichText(
              text: TextSpan(
                text: '$label ',
                style: TextStyle(fontSize: labelSize, color: labelColor),
                children: [
                  TextSpan(
                    text: isRequired == true ? '*' : '',
                    style: TextStyle(fontSize: labelSize!+3,color: AppColors.redColor),
                  ),
                ],
              ),
            ),
          ),
          validator: isRequired == true ? validator : null,
          onChanged: onChanged,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          inputFormatters: inputFormatters,
        ) ;
      },
    );
  }
}