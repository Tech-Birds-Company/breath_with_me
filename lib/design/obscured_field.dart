import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ObscuredField extends StatefulWidget {
  final String hintText;
  final String prefixIcon;
  final bool enableObscuredTextToggle; // New parameter

  const ObscuredField({
    required this.hintText,
    required this.prefixIcon,
    this.enableObscuredTextToggle = false, // Default is true
    super.key,
  });

  @override
  _ObscuredFieldState createState() => _ObscuredFieldState();
}

class _ObscuredFieldState extends State<ObscuredField> {
  late bool _isObscured = true; // Default value

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;

    return TextField(
      style: TextStyle(color: theme.primaryText),
      obscureText: widget.enableObscuredTextToggle ? _isObscured : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.gray26,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: theme.secondaryText),
        prefixIcon: SizedBox(
          width: 24,
          height: 24,
          child: Center(child: SvgPicture.asset(widget.prefixIcon)),
        ),
        suffixIcon: widget.enableObscuredTextToggle
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
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
