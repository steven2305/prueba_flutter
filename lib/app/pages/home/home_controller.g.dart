// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$userAtom = Atom(name: '_HomeControllerBase.user');

  @override
  List<User> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(List<User> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$getAlDataAsyncAction = AsyncAction('_HomeControllerBase.getAlData');

  @override
  Future<void> getAlData() {
    return _$getAlDataAsyncAction.run(() => super.getAlData());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
