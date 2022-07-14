import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/shared_pref.dart';

enum AuthState { initialize, authenticated, unauthenticated }



class AppStartUpController extends StateNotifier<AuthState> {
  final Ref ref;

  AppStartUpController(this.ref) : super(AuthState.initialize) {
    init();
  }

  Future<void> refreshAllState() async {
    // ref.refresh(sessionListControllerProvider);
    // ref.refresh(friendListControllerProvider);
    // ref.read(myProfileDataProvider.notifier).getProfile();
    // ref.refresh(teamListControllerProvider);
    // ref.refresh(friendRequestListControllerProvider);
    // ref.read(searchIdProvider.notifier).addAccountId(null);
    // ref.read(searchGroupIdProvider.notifier).addGroupId(null);
  }

  Future<void> init() async {
    final shp = ref.read(sharePrefServiceProvider);
    final authState = await shp.getAuthState();
    if (authState == null) {
      //remove active people list when logout
      // ref.read(statusIdListConrollerProvider.notifier).removeListWhenLogout();
      state = AuthState.unauthenticated;
    } else if (authState) {
      refreshAllState();
      state = AuthState.authenticated;
    } else {
      state = AuthState.unauthenticated;
    }
  }
}

final appStartUpProvider =
StateNotifierProvider<AppStartUpController, AuthState>(
        (ref) => AppStartUpController(ref));
