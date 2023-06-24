import 'package:provider/provider.dart';

import 'package:todo_list_provider/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/modules/auth/login/login_controller.dart';
import 'package:todo_list_provider/modules/auth/login/login_page.dart';

/// Nos [bindings] são colocadas as dependências para cada página
/// incluída em [routers].
class AuthModule extends TodoListModule {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            ),
          ],
          routers: {
            '/login': (context) => const LoginPage(),
          },
        );
}
