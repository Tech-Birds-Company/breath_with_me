import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ObscuredField extends StatefulWidget {
  final String hintText;
  final String prefixIcon;
  final bool enableObscuredTextToggle;
  final bool editable;
  final String? defaultValue;
  final void Function(String text)? textChange;
  final FormFieldValidator<String?>? validator;

  const ObscuredField({
    required this.prefixIcon,
    this.textChange,
    this.hintText = '',
    this.editable = true,
    this.defaultValue,
    this.enableObscuredTextToggle = false,
    this.validator,
    super.key,
  });

  @override
  ObscuredFieldState createState() => ObscuredFieldState();
}

class ObscuredFieldState extends State<ObscuredField> {
  var _isObscured = true;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.defaultValue);
    _controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() => widget.textChange?.call(_controller.text);

  @override
  void dispose() {
    _controller
      ..removeListener(_onControllerChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    return TextFormField(
      readOnly: !widget.editable,
      controller: _controller,
      style: TextStyle(color: theme.primaryText),
      obscureText: widget.enableObscuredTextToggle && _isObscured,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: widget.editable,
        fillColor: theme.gray26,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: theme.secondaryText),
        prefixIcon: SizedBox(
          width: 24,
          height: 24,
          child: Center(
            child: SvgPicture.asset(
              widget.prefixIcon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                theme.secondaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        suffixIcon: widget.enableObscuredTextToggle
            ? GestureDetector(
                onTap: () => setState(() => _isObscured = !_isObscured),
                child: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: theme.secondaryColor,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
