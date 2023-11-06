import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unidate/app/core/values/app_colors.dart';
import 'package:unidate/app/core/values/app_text_styles.dart';

class AppInput extends StatefulWidget {
  final String? initialValue;
  final int minLines;
  final int? maxLines;
  final String placeHolder;
  final bool obscureText;
  final Function(String)? onChanged;

  final String? errorText;
  final int? maxLength;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController? controller;
  final bool expands;
  final bool enabled;
  final String? label;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final bool hasBorder;
  final FocusNode? focusNode;
  final Color? fillColor;
  final String? helperText;
  // This field is used to check if the input is required or not
  final bool isRequired;
  final Color? textColor;
  final Function()? onTap;

  const AppInput({
    this.initialValue,
    this.minLines = 1,
    this.maxLines = 1,
    required this.placeHolder,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.maxLength,
    this.inputFormatters = const [],
    this.controller,
    this.expands = false,
    this.enabled = true,
    this.label,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.hasBorder = false,
    this.focusNode,
    this.fillColor,
    this.helperText,
    this.isRequired = false,
    this.textColor,
    this.onTap,
    super.key,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  late List<TextInputFormatter> inputFormatters;

  bool _isHasFocus = false;

  bool isEndOfScroll = false;
  bool isFirstOfScroll = false;

  Color get fillColor =>
      widget.fillColor ??
      (_isHasFocus ? AppColors.fillFocus : AppColors.fillUnfocused);

  bool get enabled => widget.enabled;

  TextStyle get textStyle => AppTextStyles.body1.copyWith(
        color: widget.textColor ??
            (enabled ? AppColors.textPrimary : AppColors.textSecondary),
      );

  @override
  void initState() {
    super.initState();

    inputFormatters = List.from(widget.inputFormatters);

    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (_isHasFocus == _focusNode.hasFocus) return;
      setState(() {
        _isHasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.label != null)
          AppInputLabel(isRequired: widget.isRequired, label: widget.label!),
        widget.expands
            ? Expanded(
                child: _buildTextFormField(),
              )
            : _buildTextFormField(),
      ],
    );
  }

  Widget _buildTextFormField() {
    return GestureDetector(
      onTap: widget.onTap,
      child: TextFormField(
        textAlign: widget.textAlign,
        controller: widget.initialValue == null ? _controller : null,
        focusNode: _focusNode,
        initialValue: widget.initialValue,
        minLines: widget.expands ? null : widget.minLines,
        maxLines: widget.expands ? null : widget.maxLines,
        maxLength: widget.maxLength,
        expands: widget.expands,
        enabled: widget.enabled,
        obscureText: widget.obscureText,
        onEditingComplete: () => TextInput.finishAutofillContext(),
        onChanged: (value) {
          widget.onChanged?.call(value);
        },
        style: textStyle,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: TextCapitalization.none,
        decoration: InputDecoration(
          isDense: true,
          counter: const Offstage(),
          focusedBorder: outlineInputBorder(),
          border: outlineInputBorder(),
          enabledBorder: outlineInputBorder(),
          helperText: widget.helperText,
          contentPadding: widget.contentPadding ?? const EdgeInsets.all(12),
          errorText: widget.errorText,
          errorMaxLines: 1,
          hintText: widget.obscureText
              ? widget.placeHolder.replaceAll(RegExp(r'.?'), '*')
              : widget.placeHolder,
          errorStyle: AppTextStyles.caption.copyWith(
            color: AppColors.error,
          ),
          errorBorder: outlineInputBorder().copyWith(
            borderSide: const BorderSide(color: AppColors.error),
          ),
          isCollapsed: true,
          suffixStyle: textStyle,
          hintStyle: AppTextStyles.body1.copyWith(color: AppColors.textHint),
          hintMaxLines: widget.maxLines,
          fillColor: fillColor,
          filled: true,
        ),
        obscuringCharacter: '*',
        inputFormatters: inputFormatters,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: widget.hasBorder
          ? BorderSide(color: AppColors.textSecondary)
          : BorderSide.none,
      gapPadding: 0,
    );
  }
}

class AppInputLabel extends StatelessWidget {
  const AppInputLabel({
    super.key,
    this.isRequired = false,
    required this.label,
  });

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text(
              label,
              key: UniqueKey(),
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
        if (isRequired)
          Text(
            ' *',
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.error,
              fontSize: 10,
            ),
          ),
      ],
    );
  }
}
