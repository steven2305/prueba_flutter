// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<Color> _$primaryColorComputed;

  @override
  Color get primaryColor =>
      (_$primaryColorComputed ??= Computed<Color>(() => super.primaryColor,
              name: '_AppControllerBase.primaryColor'))
          .value;
  Computed<Color> _$secondaryColorComputed;

  @override
  Color get secondaryColor =>
      (_$secondaryColorComputed ??= Computed<Color>(() => super.secondaryColor,
              name: '_AppControllerBase.secondaryColor'))
          .value;
  Computed<Color> _$backgroundColorComputed;

  @override
  Color get backgroundColor => (_$backgroundColorComputed ??= Computed<Color>(
          () => super.backgroundColor,
          name: '_AppControllerBase.backgroundColor'))
      .value;
  Computed<Color> _$textColorComputed;

  @override
  Color get textColor =>
      (_$textColorComputed ??= Computed<Color>(() => super.textColor,
              name: '_AppControllerBase.textColor'))
          .value;

  final _$userAtom = Atom(name: '_AppControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  @override
  String toString() {
    return '''
user: ${user},
primaryColor: ${primaryColor},
secondaryColor: ${secondaryColor},
backgroundColor: ${backgroundColor},
textColor: ${textColor}
    ''';
  }
}
