import 'package:breath_with_me/extensions/widget.dart';
import 'package:breath_with_me/features/home/widgets/home_header.dart';
import 'package:breath_with_me/features/practices/widgets/practices_actions.dart';
import 'package:breath_with_me/features/practices/widgets/practices_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1919).withOpacity(0.92),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsetsDirectional.only(
                top: 28,
                start: 24,
                end: 24,
              ),
              sliver: HomeHeader(),
            ),
            const SizedBox(height: 28).toSliver,
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
              sliver: const PracticesActions().toSliver,
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 32,
              ),
              sliver: PracticesList(),
            ),
          ],
        ),
      ),
    );
  }
}
