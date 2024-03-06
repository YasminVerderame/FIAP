import 'package:flutter/material.dart';
import 'package:macros_amounts/components/inputs/base.dart';
import 'package:macros_amounts/components/inputs/dropdown_dialog.dart';
import 'package:macros_amounts/components/text.dart';
import 'package:macros_amounts/constants/borders.dart';
import 'package:macros_amounts/constants/spacings.dart';
import 'package:macros_amounts/constants/typographies.dart';

class CustomDropdownInput extends StatefulWidget {
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final Map<dynamic, String> items;
  final InputType inputType;
  final dynamic initialValue;
  final bool enabled;
  final Function(dynamic) onValueSelected;
  final Function(dynamic)? onSaved;
  final String? Function(dynamic)? validator;

  const CustomDropdownInput({
    super.key,
    required this.items,
    required this.onValueSelected,
    this.labelText,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.initialValue,
    this.inputType = InputType.neutral,
    this.onSaved,
    this.validator,
  });

  @override
  State<CustomDropdownInput> createState() => _CustomDropdownInputState();
}

class _CustomDropdownInputState extends State<CustomDropdownInput>
    with SingleTickerProviderStateMixin {
  bool hasFocus = false;

  dynamic _selectedValue;

  final GlobalKey dropdownKey = GlobalKey();

  late final AnimationController animationController;

  final int animationDuration = 250;
  final double animationBegin = 0.0;
  final double animationEnd = 0.5;

  final LayerLink _layerLink = LayerLink();

  FormFieldState<dynamic>? _formField;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _selectedValue = widget.initialValue;
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animateArrowIcon();

    return BaseInput(
      labelText: widget.labelText,
      helperText: widget.helperText,
      inputType: widget.inputType,
      enabled: widget.enabled,
      focused: hasFocus,
      builder: (BaseInputData data) {
        _formField = data.formFieldState;

        return CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            key: dropdownKey,
            onTap: widget.enabled
                ? () => _showBottomSheet(
                      context,
                      widget.labelText,
                    )
                : null,
            child: InputDecorator(
              decoration: data.inputDecoration.copyWith(
                suffixIcon: _getArrowIcon(data.color),
                hintText:
                    _selectedValue != null ? widget.items[_selectedValue] : '',
              ),
              textAlignVertical: TextAlignVertical.center,
              child: _selectedValue != null
                  ? CustomText(
                      text: widget.items[_selectedValue] ?? '',
                      style: TypographyType.body,
                      color: Colors.black87,
                    )
                  : CustomText(
                      text: '',
                      style: TypographyType.body,
                      color: data.color,
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _getArrowIcon(Color color) {
    return RotationTransition(
      turns: Tween(
        begin: animationEnd,
        end: animationBegin,
      ).animate(animationController),
      child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: Spacing.s8,
            horizontal: Spacing.s16,
          ),
          child: Icon(Icons.arrow_drop_up_rounded)),
    );
  }

  void _animateArrowIcon() {
    hasFocus
        ? animationController.forward(from: animationBegin)
        : animationController.reverse(from: animationEnd);
  }

  void _showBottomSheet(
    BuildContext context,
    String? labelText,
  ) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: borderRadius),
      constraints: BoxConstraints.loose(Size.infinite),
      builder: (BuildContext context) {
        return DropdownDialog(
          title: labelText ?? '',
          widget: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: _buildItems(context),
          ),
        );
      },
    ).then(
      (dynamic value) {
        if (value != null) {
          _onMenuReturns(value);
        }
      },
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    return widget.items.entries.map(
      (entry) {
        return InkWell(
          onTap: () {
            _onMenuReturns(entry.key);
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.s16,
            ),
            child: CustomText(
              text: entry.value,
              style: TypographyType.body,
              textOverflow: TextOverflow.fade,
            ),
          ),
        );
      },
    ).toList();
  }

  void _onMenuReturns(dynamic value) {
    _setSelectedValue(value);
    _formField?.didChange(value);
  }

  void _setSelectedValue(dynamic value) {
    setState(() {
      _selectedValue = value;
      widget.onValueSelected(value);
    });
  }
}
