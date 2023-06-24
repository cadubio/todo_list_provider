import 'package:flutter/material.dart';
import 'package:todo_list_provider/core/database/sqlite_adm_connections.dart';
import 'package:todo_list_provider/core/ui/todo_list_ui_config.dart';
import 'package:todo_list_provider/modules/auth/auth_module.dart';
import 'package:todo_list_provider/modules/splash/splash_page.dart';

/// Widget princincipal
/// Implementa o MAterialApp
class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnections();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: TodoListUiConfig.theme,
      title: 'Todo List Provider',
      routes: {...AuthModule().routers},
      home: const SplashPage(),
    );
  }
}
