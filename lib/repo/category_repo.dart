import 'package:gigglify_fl/config/constants.dart';
import 'package:gigglify_fl/services/prefs_service.dart';

class CategoryRepo {
  final PrefsService _prefsService;

  const CategoryRepo(this._prefsService);

  Future<String> getCategoriesPath() async {
    String s = '';
    for (int i = 0; i < apiRoutes.length; i++) {
      String route = apiRoutes[i];
      String? value = await _prefsService.getItem(route);
      bool allowed = value != null && value == '1';
      if (allowed) {
        s += '$route,';
      }
    }
    if (s.endsWith(',')) {
      s = s.substring(0, s.length - 1);
    }
    return s.isEmpty ? apiRoutes[0] : s;
  }

  Future<List<bool>> getAllowedCategories() async {
    List<bool> result = List.filled(apiRoutes.length, false);
    int allowedCount = 0;
    for (int i = 0; i < apiRoutes.length; i++) {
      String? value = await _prefsService.getItem(apiRoutes[i]);
      bool allowed = value != null && value == '1';
      result[i] = allowed;
      allowedCount += allowed ? 1 : 0;
    }
    if (allowedCount == 0) {
      result[0] = true;
    }
    return result;
  }

  Future<void> categoryChanged(int index, bool value) async {
    await _prefsService.setItem(apiRoutes[index], value ? '1' : '0');
  }
}
