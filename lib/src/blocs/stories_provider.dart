import './stories_bloc.dart';
import 'package:flutter/material.dart';
export 'stories_bloc.dart';

class StoriesProvider extends InheritedWidget {
  final StoriesBloc bloc;

  StoriesProvider({Key key, Widget child})
      : bloc = StoriesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static StoriesBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StoriesProvider>().bloc;
  }
}
