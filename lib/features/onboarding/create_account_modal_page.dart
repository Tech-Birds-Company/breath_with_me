import 'package:breathe_with_me/features/onboarding/widgets/create_account_header.dart';
import 'package:breathe_with_me/features/onboarding/widgets/sign_circle_button.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAccountModalPage extends StatelessWidget {
  const CreateAccountModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: theme.primaryBackground,
      body: const SafeArea(
        child: Column(
          children: [
            Spacer(),
            CreateAccountHeader(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
