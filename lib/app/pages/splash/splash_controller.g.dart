// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashController on _SplashControllerBase, Store {
  Computed<Function> _$loginGoComputed;

  @override
  Function get loginGo =>
      (_$loginGoComputed ??= Computed<Function>(() => super.loginGo,
              name: '_SplashControllerBase.loginGo'))
          .value;

  final _$locationsAsyncAction = AsyncAction('_SplashControllerBase.locations');

  @override
  Future<void> locations() {
    return _$locationsAsyncAction.run(() => super.locations());
  }

  @override
  String toString() {
    return '''
loginGo: ${loginGo}
    ''';
  }
}
