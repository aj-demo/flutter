import 'package:flutter/material.dart';
import 'package:flutter_demo/config/theme.dart';
import 'package:flutter_demo/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
// import 'routers/routes.dart';
import 'package:flutter_demo/providers/auth_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String flutterEnv = String.fromEnvironment(
  'FLUTTER_ENV',
  defaultValue: 'production',
);

void main() async{
  await dotenv.load(fileName: ".env.$flutterEnv");
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const ProviderScope(child: MyApp()),
    )
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerProvider);
    return MaterialApp.router(
      title: 'Welcome to Flutter',
      theme: themeData,
      darkTheme: dartThemeData,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}