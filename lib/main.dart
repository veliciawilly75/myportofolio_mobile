import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.apiClient, super.key});

  final ApiClient apiClient;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MultiProvider wraps the app and injects a collection of Provider objects.
    // We usually use Provider object to pass one or more frequently reused objects such as API client or authentication state to the widgets in the tree.
    return MultiProvider(
      providers: [
        Provider.value(value: apiClient),
        ChangeNotifierProvider(create: ((context) => AuthState(apiClient))),
      ],
      child: MaterialApp(
        title: 'MyPortofolio',

        theme: ThemeData(
          // This is the theme of your application.
          colorScheme: .fromSeed(
            brightness: Brightness.light,
            seedColor: Color(0xFF285E8E), // Rich True Navy

            primary: Color(0xFF285E8E), // Rich True Navy
            secondary: Color(0xFF4A84BA), // Lively Mid-Blue

            surface: Color(0xFFFAFCFD), // Crisp White
            surfaceContainer: Color(0xFFEEF3F8), // Soft Cool Gray
          ),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
