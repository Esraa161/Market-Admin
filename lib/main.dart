import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:market_admin/All%20Orders/newOrder_screen.dart';
import 'package:market_admin/Settings/Language%20Cubit/language_cubit.dart';
import 'package:market_admin/Settings/Language%20Cubit/language_states.dart';
import 'package:market_admin/presentation/screens/internet_connection.dart';
import 'package:market_admin/presentation/screens/login/cubit/cubit.dart';
import 'package:market_admin/presentation/screens/login/login_screen.dart';
import 'package:market_admin/shared/network/Notification/notification_helper.dart';
import 'package:market_admin/shared/network/remote/dio_helper.dart';
import 'All Orders/AllOrders Cubit/allOrders_cubit.dart';
import 'Reset Password/Forget Password Cubit/forgetPasswod_cubit.dart';
import 'Update Password/Update Password Cubit/updatePassword_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp();
  NotificationHelper().showNotificationHeadUp(message);
}
void main()async{
  await DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  NotificationHelper notiHelper = NotificationHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    notiHelper.requestPermissionAndGetToken();
    notiHelper.configLocalNotification();
    //
    //






  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<loginCubit>(
          create: (BuildContext context) => loginCubit(),
        ),
        BlocProvider<forgetPasswordCubit>(
          create: (BuildContext context) => forgetPasswordCubit(),
        ),
        BlocProvider<updatePasswordCubit>(
          create: (BuildContext context) => updatePasswordCubit(),
        ),
        BlocProvider<allOrdersCubit>(
          create: (BuildContext context) => allOrdersCubit(),
        ),
        BlocProvider<LanguageCubit>(
          create: (BuildContext context) => LanguageCubit()..getSavedLanguage(),
        ),
        BlocProvider<RadioListTileCubit>(
          create: (BuildContext context) => RadioListTileCubit(),
        ),
        BlocProvider<ConnectivityCubit>(
          create: (BuildContext context) => ConnectivityCubit(),
        ),
      ],
      child: BlocBuilder<LanguageCubit,languageStates>(
        builder: (context,state){
          if(state is changeLanguageState){
            return MaterialApp(
              builder: (context, widget) => ResponsiveWrapper.builder(
                BouncingScrollWrapper.builder(context, widget!),
                maxWidth: 1200,
                minWidth: 480,
                defaultScale: true,
                breakpoints: [
                  ResponsiveBreakpoint.autoScale(480, name: 'SM'),
                  ResponsiveBreakpoint.autoScale(800, name: 'MD'),
                  ResponsiveBreakpoint.autoScale(1000, name: 'LG'),
                  ResponsiveBreakpoint.autoScale(1200, name: 'XL'),
                  ResponsiveBreakpoint.autoScale(2460, name: '2XL'),
                ],
              ),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales:AppLocalizations.supportedLocales,
              locale: state.locale,

              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(

                primarySwatch: Colors.deepOrange,
              ),
              home: internet_connection(),
            );
          }return const SizedBox();

        }
      )
    );
  }
}


