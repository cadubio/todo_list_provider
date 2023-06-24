import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:todo_list_provider/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/core/widget/todo_list_logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Para saber o tamanho da tela, através das [constrains],
      /// ao mesmo tempo que não se limita a um tamanho fixo.
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                /// O mínimo da tela é o tamanho máximo da [constrains]
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),

              /// O [IntrinsicHeight] Permite que a tela tenha o tamanho máximo dos [childrens] do
              /// [Column].
              /// O [Column] não tem uma tamanho sozinho não tem um tamanho de tela definido
              child: IntrinsicHeight(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  const TodoListLogo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                    child: Form(
                      child: Column(
                        children: [
                          const TodoListField(label: 'E-mail'),
                          const SizedBox(height: 20),
                          const TodoListField(
                            label: 'senha',
                            obscureText: true,
                          ),
                          //TextFormField(),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Esqueceu sua senha?'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text('Login'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F3F7),
                        border: Border(
                          top: BorderSide(
                            width: 2,
                            color: Colors.grey.withAlpha(50),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          SignInButton(
                            Buttons.Google,
                            text: 'Continue com o Google',
                            onPressed: () {},
                            padding: const EdgeInsets.all(5),
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Não tem conta?'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Cadastre-se'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
