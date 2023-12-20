import 'package:breathe_with_me/managers/database_manager/database_manager.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class DeleteAccountBloc extends BlocBase<Object?> {
  final NavigationManager _navigationManager;
  final UserManager _userManager;
  final DatabaseManager _databaseManager;

  DeleteAccountBloc(
    this._navigationManager,
    this._userManager,
    this._databaseManager,
  ) : super(null);
}
