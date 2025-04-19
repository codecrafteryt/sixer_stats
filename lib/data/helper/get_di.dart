 import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixer_stats/controller/quiz_controller.dart';
import 'package:sixer_stats/controller/setting_controller.dart';

    class DependencyInjection { // controllers DI
       static void init() async {
         final sharedPreferences = await SharedPreferences.getInstance();
         Get.lazyPut(() => sharedPreferences, fenix: true);
         Get.lazyPut(() => QuizController(sharedPreferences: sharedPreferences), fenix: true);
         Get.put<SettingController>(SettingController(sharedPreferences: sharedPreferences),  permanent: true);
       }
     }