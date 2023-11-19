import 'package:breathe_with_me/features/profile/widgets/bwm_app_bar.dart';
import 'package:breathe_with_me/i18n/locale_keys.g.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileFAQ extends StatelessWidget {
  const ProfileFAQ({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: theme.primaryBackground,
        appBar: BWMAppBar(title: LocaleKeys.profileFaqTitle.tr()),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.primaryBackground,
                Colors.black,
              ],
            ),
          ),
          child: SafeArea(
            child: ExpansionTile(
              title: Text('ExpansionTile 1'),
              subtitle: Text('Trailing expansion arrow icon'),
              children: <Widget>[
                ListTile(title: Text('This is tile number 1')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
