import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app_tec/prividers/content_document_provider.dart';
import 'package:web_app_tec/prividers/login_provider.dart';
import 'package:web_app_tec/prividers/users_provoder.dart';
import 'package:web_app_tec/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsersProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContenidoDocumentoProvider(),
        ),
      ],
      child: const MyApp
      (),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gestor de documentos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent[700]!),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      routerConfig: getRouter(context),
    );
  }
}
