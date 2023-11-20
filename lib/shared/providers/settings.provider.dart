import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings.provider.g.dart';

@riverpod
class FastHome extends _$FastHome {
  @override
  Future<bool> build() async {
    final preferences = await SharedPreferences.getInstance();
    final setting = preferences.getBool('fastHome');

    if (setting == null) {
      await preferences.setBool('fastHome', true);
      return true;
    } else {
      return setting;
    }
  }

  Future<void> set(bool value) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('fastHome', value);

    state = AsyncValue.data(value);
  }
}
