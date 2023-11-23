import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/theme_states.dart';
import 'package:news_app/shared/network_local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemesInitialStates());

  static ThemeCubit get(context) => BlocProvider.of(context);

  static bool? isDark;

  void changeAppMode() {   
    isDark = !isDark!;
    CacheHalper.setAppMode(isDarkMode: "isDarkMode", value: isDark!);
    emit(ChangeAppModeState());    
  }

  bool appDarkMode() {
    if (CacheHalper.getAppMode(isDarkMode: "isDarkMode") == null) {
      isDark = false;      
    } else {
      isDark = CacheHalper.getAppMode(isDarkMode: "isDarkMode")!;
    }
    return isDark!;
  }
}
