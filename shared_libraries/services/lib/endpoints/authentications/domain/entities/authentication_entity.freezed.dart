// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticationEntity _$AuthenticationEntityFromJson(Map<String, dynamic> json) {
  return _AuthenticationEntity.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationEntity {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationEntityCopyWith<AuthenticationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEntityCopyWith<$Res> {
  factory $AuthenticationEntityCopyWith(AuthenticationEntity value,
          $Res Function(AuthenticationEntity) then) =
      _$AuthenticationEntityCopyWithImpl<$Res, AuthenticationEntity>;
  @useResult
  $Res call(
      {int id,
      String username,
      String email,
      String firstName,
      String lastName,
      String gender,
      String image,
      String token});
}

/// @nodoc
class _$AuthenticationEntityCopyWithImpl<$Res,
        $Val extends AuthenticationEntity>
    implements $AuthenticationEntityCopyWith<$Res> {
  _$AuthenticationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? gender = null,
    Object? image = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticationEntityCopyWith<$Res>
    implements $AuthenticationEntityCopyWith<$Res> {
  factory _$$_AuthenticationEntityCopyWith(_$_AuthenticationEntity value,
          $Res Function(_$_AuthenticationEntity) then) =
      __$$_AuthenticationEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String email,
      String firstName,
      String lastName,
      String gender,
      String image,
      String token});
}

/// @nodoc
class __$$_AuthenticationEntityCopyWithImpl<$Res>
    extends _$AuthenticationEntityCopyWithImpl<$Res, _$_AuthenticationEntity>
    implements _$$_AuthenticationEntityCopyWith<$Res> {
  __$$_AuthenticationEntityCopyWithImpl(_$_AuthenticationEntity _value,
      $Res Function(_$_AuthenticationEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? gender = null,
    Object? image = null,
    Object? token = null,
  }) {
    return _then(_$_AuthenticationEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthenticationEntity implements _AuthenticationEntity {
  const _$_AuthenticationEntity(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.image,
      required this.token});

  factory _$_AuthenticationEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AuthenticationEntityFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String gender;
  @override
  final String image;
  @override
  final String token;

  @override
  String toString() {
    return 'AuthenticationEntity(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, gender: $gender, image: $image, token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email, firstName,
      lastName, gender, image, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationEntityCopyWith<_$_AuthenticationEntity> get copyWith =>
      __$$_AuthenticationEntityCopyWithImpl<_$_AuthenticationEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticationEntityToJson(
      this,
    );
  }
}

abstract class _AuthenticationEntity implements AuthenticationEntity {
  const factory _AuthenticationEntity(
      {required final int id,
      required final String username,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String gender,
      required final String image,
      required final String token}) = _$_AuthenticationEntity;

  factory _AuthenticationEntity.fromJson(Map<String, dynamic> json) =
      _$_AuthenticationEntity.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get gender;
  @override
  String get image;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationEntityCopyWith<_$_AuthenticationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
