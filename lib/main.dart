import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Utils/color.dart';
import 'View/AUTH/LOGIN/loginpage.dart';
import 'View/AUTH/LOGIN/otpfind.dart';
import 'View/AUTH/SIGNUP/signuppage.dart';
import 'View/Dashboard/Dashboad.dart';
import 'View/Dashboard/dashboarsservice.dart';
import 'View/Splash/SplashScrreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'ViewModel/currencyViewModel.dart';
import 'ViewModel/languageViewModel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LanguageViewModel>(
        create: (context) => LanguageViewModel()),
    ChangeNotifierProvider<CurrencyViewModel>(
        create: (context) => CurrencyViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alpha Vendor',
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('hi', 'IN'),
      ],

      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colors.primary_app,
        ).copyWith(
          secondary: colors.darkIcon,
          brightness: Brightness.light,
        ),
        canvasColor: Theme.of(context).colorScheme.lightWhite,
        cardColor: Theme.of(context).colorScheme.white,
        dialogBackgroundColor: Theme.of(context).colorScheme.white,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: colors.primary,
            ),
        primarySwatch: colors.primary_app,
        primaryColor: Theme.of(context).colorScheme.lightWhite,
        fontFamily: 'ubuntu',
        brightness: Brightness.light,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.boxBorder, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colors.boxBorder, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colors.boxBorder, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Theme.of(context).colorScheme.fontColor,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            color: Theme.of(context).colorScheme.fontColor,
            fontWeight: FontWeight.bold,
          ),
        ).apply(
          bodyColor: Theme.of(context).colorScheme.fontColor,
        ),
      ),

      darkTheme: ThemeData(
        canvasColor: colors.darkColor,
        cardColor: colors.darkColor2,
        dialogBackgroundColor: colors.darkColor2,
        primaryColor: colors.darkColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: colors.darkIcon,
          selectionColor: colors.darkIcon,
          selectionHandleColor: colors.darkIcon,
        ),
        fontFamily: 'ubuntu',
        brightness: Brightness.dark,
        hintColor: colors.white10,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: colors.secondary,
            ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Theme.of(context).colorScheme.fontColor,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            color: Theme.of(context).colorScheme.fontColor,
            fontWeight: FontWeight.bold,
          ),
        ).apply(
          bodyColor: Theme.of(context).colorScheme.fontColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: colors.primary_app,
        ).copyWith(
          secondary: colors.darkIcon,
          brightness: Brightness.dark,
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return null;
          }),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return null;
          }),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return null;
          }),
          trackColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return null;
            }
            if (states.contains(MaterialState.selected)) {
              return colors.primary;
            }
            return null;
          }),
        ),
      ),
      // themeMode: themeNotifier.getThemeMode(),
      // themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const SpalashScreen(),

        // SpalashScreen  DashboardScreen1
      },
      // home: Container(
      //   child: Text(AppLocalizations.of(context)!.signInToYourAccount),
      // ),
    );
  }
}
