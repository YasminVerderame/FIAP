import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macros_amounts/components/inputs/base.dart';
import 'package:macros_amounts/constants/typographies.dart';

class CustomTextInput extends StatefulWidget {
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final int? maxLength;
  final bool enabled;
  final InputType inputType;
  final TextEditingController? editingController;
  final TextInputAction? inputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final Function(String)? onSaved;
  final String? Function(String?)? validator;

  const CustomTextInput({
    super.key,
    this.labelText,
    this.helperText,
    this.errorText,
    this.maxLength,
    this.enabled = true,
    this.inputType = InputType.neutral,
    this.editingController,
    this.inputAction,
    this.inputFormatters,
    this.textInputType,
    this.onSaved,
    this.validator,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  late TextEditingController textEditingController;
  late bool hasFocus;

  @override
  void initState() {
    super.initState();
    hasFocus = false;
    textEditingController = widget.editingController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      labelText: widget.labelText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      inputType: widget.inputType,
      enabled: widget.enabled,
      focused: hasFocus,
      onFocusChange: _onFocusChange,
      onSaved: (value) => widget.onSaved?.call(value),
      validator: (value) => widget.validator?.call(value),
      builder: (BaseInputData data) {
        return TextField(
          focusNode: data.focusNode,
          controller: textEditingController,
          cursorColor: const Color(0xffED1164),
          decoration: data.inputDecoration,
          keyboardType: widget.textInputType,
          textInputAction: widget.inputAction,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          enabled: widget.enabled,
          onChanged: (value) {
            data.formFieldState.didChange(value);
          },
          style: typography[TypographyType.body]?.copyWith(
            color: Colors.black87,
          ),
          scrollPadding: EdgeInsets.only(
            bottom: (MediaQuery.viewInsetsOf(context).bottom),
          ),
        );
      },
    );
  }

  void _onFocusChange(FocusNode node, bool focus) {
    setState(() {
      hasFocus = focus;
      if (hasFocus) node.requestFocus();
    });
  }
}
