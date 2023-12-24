import 'package:breathe_with_me/features/delete_account/model/delete_account_state.dart';
import 'package:breathe_with_me/managers/navigation_manager/navigation_manager.dart';
import 'package:breathe_with_me/managers/user_manager/user_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class DeleteAccountBloc extends BlocBase<DeleteAccountState> {
  final NavigationManager _navigationManager;
  final UserManager _userManager;

  DeleteAccountBloc(
    this._navigationManager,
    this._userManager,
  ) : super(const DeleteAccountState());

  void cancelDeleting() => _navigationManager.pop();

  void deleteAccount() {
    _userManager.deleteAccount();
    emit(state.copyWith(isDeletionSucceed: true));
  }

  void signOut() {
    _userManager.signOut();
  }
}
