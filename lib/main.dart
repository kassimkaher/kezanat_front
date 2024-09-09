import 'package:kezanat_alsama/src/admin/logic/calendar_cubit/calendar_cubit.dart';
import 'package:kezanat_alsama/src/admin/logic/work_cubit/work_crud_cubit.dart';
import 'package:kezanat_alsama/src/admin/pages/admin_pannel.dart';
import 'package:kezanat_alsama/src/core/resources/local_db.dart';
import 'package:kezanat_alsama/utils/injector.dart';
import 'package:kezanat_alsama/utils/utils.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHive();

  registerDependencies();
  runApp(const App());
}

Future<void> initHive() async {
  // LocalDB.getBackup().then((value) async {
  //   if (value) {
  // await LocalDB.getExternalPathBacubHive();
  await Hive.initFlutter();

  await LocalDB.inite();
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider<WorkCrudCubit>(
            create: (BuildContext context) => WorkCrudCubit(),
          ),
          BlocProvider<CalendarCubit>(
            create: (BuildContext context) => CalendarCubit(),
          ),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'خزانة السماء',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', 'IQ'),
            ],
            // ignore: prefer_const_literals_to_create_immutables
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: const Locale('ar', 'IQ'),

            theme: getTheme("Somar", false),
            themeMode: ThemeMode.system,
            showPerformanceOverlay: false,
            home: const AdminPageView(),
          );
        }));
  }
}
