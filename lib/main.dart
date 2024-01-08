import 'package:alpha_work/Utils/shared_pref..dart';
import 'package:alpha_work/View/ORDER/model/orderModel.dart';
import 'package:alpha_work/ViewModel/authViewModel.dart';
import 'package:alpha_work/ViewModel/customerViewModel.dart';
import 'package:alpha_work/ViewModel/dashboardViewModel.dart';
import 'package:alpha_work/ViewModel/orderMgmtViewModel.dart';
import 'package:alpha_work/ViewModel/productMgmtViewModel.dart';
import 'package:alpha_work/ViewModel/profileViewModel.dart';
import 'package:alpha_work/ViewModel/walletViewModel.dart';
import 'package:alpha_work/Widget/noInternet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'Utils/color.dart';
import 'View/Splash/SplashScrreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'ViewModel/currencyViewModel.dart';
import 'ViewModel/languageViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProfileViewModel>(
      create: (context) => ProfileViewModel(),
    ),
    ChangeNotifierProvider<WalletViewMaodel>(
      create: (context) => WalletViewMaodel(),
    ),
    ChangeNotifierProvider<CustomerViewModel>(
      create: (context) => CustomerViewModel(),
    ),
    ChangeNotifierProvider<ProductManagementViewModel>(
      create: (context) => ProductManagementViewModel(),
    ),
    ChangeNotifierProvider<OrderManagementViewModel>(
      create: (context) => OrderManagementViewModel(),
    ),
    ChangeNotifierProvider<DashboardViewModel>(
        create: (context) => DashboardViewModel()),
    ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(),
    ),
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
    return InternetWidget(
      offline: FullScreenWidget(child: NoInternetScreen()),
      online: MaterialApp(
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
        themeMode: ThemeMode.light,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
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
          fontFamily: 'FuturaPT',
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.only(right: 10, left: 10),
            labelStyle: TextStyle(
                color: colors.greyText, fontWeight: FontWeight.normal),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.boxBorder, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            hintStyle: TextStyle(color: colors.greyText),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colors.boxBorder, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colors.boxBorder, width: 1),
              borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
