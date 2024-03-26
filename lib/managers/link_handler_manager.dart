// ignore_for_file: unused_field

import 'dart:async';

import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

final class LinkHandlerManager {
  final NavigationManager _navigationManager;

  LinkHandlerManager(this._navigationManager);

  bool _initialUriIsHandled = false;
  Uri? _initialUri;
  Uri? _latestUri;
  Object? _err;
  StreamSubscription<Uri?>? _uriLinkSubscription;

  void init() {
    _handleInitialUri();
    _handleIncomingLinks();
  }

  // It will handle app links while the app is already started - be it in
  // the foreground or in the background.
  void _handleIncomingLinks() => _uriLinkSubscription = uriLinkStream.listen(
        (Uri? uri) async {
          // if (!mounted) return;
          debugPrint('got uri: $uri');
          if (uri != null) {
            if (uri.queryParameters['mode'] == 'resetPassword') {
              await _navigationManager.resetPassword(uri.query);
            }
          }
          _latestUri = uri;
          _err = null;
        },
        onError: (Object err) {
          // if (!mounted) return;
          debugPrint('got err: $err');
          _latestUri = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        },
      );

  Future<void> _handleInitialUri() async {
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          debugPrint('no initial uri');
        } else {
          debugPrint('got initial uri: $uri');
        }
        _initialUri = uri;
      } on PlatformException {
        debugPrint('falied to get initial uri');
      } on FormatException catch (err) {
        debugPrint('malformed initial uri');
        _err = err;
      }
    }
  }

  void dispose() {
    _uriLinkSubscription?.cancel();
    _uriLinkSubscription = null;
  }
}
