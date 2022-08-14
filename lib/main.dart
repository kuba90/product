/* External dependencies */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

/* Local dependencies */
import '/bloc/bloc/product_bloc.dart';
import 'generated/l10n.dart';
import 'screens/product_screen.dart';
import 'models/product_model.dart';
import 'screens/main_screen.dart';
import 'theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(document.path);
  Hive.registerAdapter(ProductAdapter());
  final productHive = await Hive.openBox<Product>('product');
  runApp(MyApp(
    productHive: productHive,
  ));
}

class MyApp extends StatelessWidget {
  final Box<Product> productHive;
  MyApp({required this.productHive});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ProductBloc(productHive))],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'AceTech',
        theme: ThemeData(
          primaryColor: DefaultColor,
          appBarTheme: const AppBarTheme(
            color: PrimaryColor,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MainScreen(),
          ProductScreen.routeName: (context) => const ProductScreen(),
        },
      ),
    );
  }
}
