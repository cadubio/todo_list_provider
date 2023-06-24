import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_list_provider/core/modules/todo_list_page.dart';

/// [class] base para toda as [class] da aplicação.
/// [_routers] pede um caminho [String] e uma paǵina [WidgetBuilder]. Pois esses
/// são os atributos que [MaterialApp(routes:)] pede.
abstract class TodoListModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  TodoListModule({
    required Map<String, WidgetBuilder> routers,
    List<SingleChildWidget>? bindings,
  })  : _routers = routers,
        _bindings = bindings;

  /// Método (de tipo [get]) utilizado para declarar as rotas no [MaterialApp].
  Map<String, WidgetBuilder> get routers {
    return _routers.map((key, pageBuilder) => MapEntry(
          key,
          (_) => TodoListPage(
            bindings: _bindings,
            page: pageBuilder,
          ),
        ));
  }
}
