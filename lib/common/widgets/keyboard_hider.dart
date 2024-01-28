import 'package:flutter/widgets.dart';

class KeyboardHider extends StatelessWidget {
  final Widget child;

  const KeyboardHider({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: child,
      );
}
