import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale.provider.g.dart';

@riverpod
Future<String?> currentLocale(CurrentLocaleRef ref) async {
  final preferences = await SharedPreferences.getInstance();

  return preferences.getString('locale');
}
