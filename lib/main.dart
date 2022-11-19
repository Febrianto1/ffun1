import 'package:flutter/material.dart';
import 'package:submissionffun/ui/detail_page.dart';
import 'package:submissionffun/ui/home.dart';
import 'package:submissionffun/data/localres.dart';
import 'package:submissionffun/ui/styles.dart';
import 'package:submissionffun/ui/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: myTextTheme,
      ),
      initialRoute: RestoPage.routeName,
      routes: {
        RestoPage.routeName: (context) => const RestoPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
