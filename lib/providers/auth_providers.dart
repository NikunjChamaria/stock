import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks/model/user_model.dart';
import 'package:stocks/providers/providers.dart';
import 'package:stocks/repository/user_repo.dart';

class AuthNotifier extends StateNotifier<AsyncValue<UserModel>> {
  final UserRepository userRepository;

  AuthNotifier(this.userRepository) : super(AsyncValue.data(UserModel()));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await userRepository.login(email, password);
      state = AsyncValue.data(user ?? UserModel());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("jwt");
    state = AsyncValue.data(UserModel());
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<UserModel>>(
  (ref) => AuthNotifier(ref.read(userRepositoryProvider)),
);

final loginProvider = authNotifierProvider;
