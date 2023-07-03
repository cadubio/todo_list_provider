import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_provider/app/repositories/user/user_repository_impl.dart';
import 'package:todo_list_provider/app/services/app_widget.dart';

/// Estrutura de Módulos:
/// Módulo Ativo --> dependências (classes que dependem dele ) ativas
/// Módulo inativo --> dependências inativas
//
/// Módulo Core
/// No AppModulo fica tudo que precisa estar disponível para toda a aplicação.
/// Todas as classes compartilhadas por toda a aplicação.
class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(
          create: (_) => SqliteConnectionFactory(),
          lazy: false, // instancia a classe assim que abrir o App
        ),
        Provider(
          create: (context) => UserRepositoryImpl(
            firebaseAuth: context.read(),
          ),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
