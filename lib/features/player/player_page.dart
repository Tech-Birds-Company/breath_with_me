import 'package:breathe_with_me/assets.dart';
import 'package:breathe_with_me/features/player/player_animation.dart';
import 'package:breathe_with_me/features/player/player_manager_impl.dart';
import 'package:breathe_with_me/theme/bwm_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> with TickerProviderStateMixin {
  late final _playerManager = PlayerManagerImpl();
  late final _progressStream = _playerManager.progressStream;
  late final _playerAnimationController = AnimationController(
    vsync: this,
    duration: Duration.zero,
  );

  @override
  void initState() {
    super.initState();
    _playerManager.init().then(
      (_) {
        _playerManager.play();
      },
    );
  }

  @override
  void dispose() {
    _playerManager.dispose();
    _playerAnimationController.dispose();
    super.dispose();
  }

  void _onPlayButtonPressed(bool isPaused) {
    if (isPaused) {
      _playerManager.pause();
      _playerAnimationController.stop(canceled: false);
    } else {
      _playerManager.play();
      _playerAnimationController
        ..forward(from: _playerAnimationController.value)
        ..repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<BWMTheme>()!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.primaryBackground,
      ),
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            PlayerAnimation(
              controller: _playerAnimationController,
            ),
            const Spacer(),
            Center(
              child: _PlayButton(
                onPressed: (isPaused) {
                  _onPlayButtonPressed(isPaused);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: StreamBuilder<double>(
                stream: _progressStream,
                builder: (context, snapshot) {
                  return LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.secondaryColor,
                    value: snapshot.data,
                    backgroundColor: theme.secondaryBackground,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlayButton extends StatefulWidget {
  final Function(bool isPaused) onPressed;

  const _PlayButton({required this.onPressed});

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton> {
  var isPaused = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95,
      height: 95,
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            isPaused = !isPaused;
          });
          widget.onPressed(isPaused);
        },
        elevation: 0,
        backgroundColor: const Color(0xFFC4C4C4)
            .withOpacity(0.12), // TODO: (vasidmi) update theme
        child: Center(
          child: SvgPicture.asset(
            isPaused ? BWMAssets.playIcon : BWMAssets.pauseIcon,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
