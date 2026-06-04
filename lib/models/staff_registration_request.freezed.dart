// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_registration_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffRegistrationRequest {

 String get firstName; String get lastName; String get email; String get password; String get role; int get facilityId; String? get department;
/// Create a copy of StaffRegistrationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffRegistrationRequestCopyWith<StaffRegistrationRequest> get copyWith => _$StaffRegistrationRequestCopyWithImpl<StaffRegistrationRequest>(this as StaffRegistrationRequest, _$identity);

  /// Serializes this StaffRegistrationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffRegistrationRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password,role,facilityId,department);

@override
String toString() {
  return 'StaffRegistrationRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, role: $role, facilityId: $facilityId, department: $department)';
}


}

/// @nodoc
abstract mixin class $StaffRegistrationRequestCopyWith<$Res>  {
  factory $StaffRegistrationRequestCopyWith(StaffRegistrationRequest value, $Res Function(StaffRegistrationRequest) _then) = _$StaffRegistrationRequestCopyWithImpl;
@useResult
$Res call({
 String firstName, String lastName, String email, String password, String role, int facilityId, String? department
});




}
/// @nodoc
class _$StaffRegistrationRequestCopyWithImpl<$Res>
    implements $StaffRegistrationRequestCopyWith<$Res> {
  _$StaffRegistrationRequestCopyWithImpl(this._self, this._then);

  final StaffRegistrationRequest _self;
  final $Res Function(StaffRegistrationRequest) _then;

/// Create a copy of StaffRegistrationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? password = null,Object? role = null,Object? facilityId = null,Object? department = freezed,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffRegistrationRequest].
extension StaffRegistrationRequestPatterns on StaffRegistrationRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffRegistrationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffRegistrationRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffRegistrationRequest value)  $default,){
final _that = this;
switch (_that) {
case _StaffRegistrationRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffRegistrationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _StaffRegistrationRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String password,  String role,  int facilityId,  String? department)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffRegistrationRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.password,_that.role,_that.facilityId,_that.department);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String firstName,  String lastName,  String email,  String password,  String role,  int facilityId,  String? department)  $default,) {final _that = this;
switch (_that) {
case _StaffRegistrationRequest():
return $default(_that.firstName,_that.lastName,_that.email,_that.password,_that.role,_that.facilityId,_that.department);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String firstName,  String lastName,  String email,  String password,  String role,  int facilityId,  String? department)?  $default,) {final _that = this;
switch (_that) {
case _StaffRegistrationRequest() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.password,_that.role,_that.facilityId,_that.department);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaffRegistrationRequest implements StaffRegistrationRequest {
  const _StaffRegistrationRequest({required this.firstName, required this.lastName, required this.email, required this.password, required this.role, required this.facilityId, this.department});
  factory _StaffRegistrationRequest.fromJson(Map<String, dynamic> json) => _$StaffRegistrationRequestFromJson(json);

@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String password;
@override final  String role;
@override final  int facilityId;
@override final  String? department;

/// Create a copy of StaffRegistrationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffRegistrationRequestCopyWith<_StaffRegistrationRequest> get copyWith => __$StaffRegistrationRequestCopyWithImpl<_StaffRegistrationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffRegistrationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffRegistrationRequest&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password,role,facilityId,department);

@override
String toString() {
  return 'StaffRegistrationRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, role: $role, facilityId: $facilityId, department: $department)';
}


}

/// @nodoc
abstract mixin class _$StaffRegistrationRequestCopyWith<$Res> implements $StaffRegistrationRequestCopyWith<$Res> {
  factory _$StaffRegistrationRequestCopyWith(_StaffRegistrationRequest value, $Res Function(_StaffRegistrationRequest) _then) = __$StaffRegistrationRequestCopyWithImpl;
@override @useResult
$Res call({
 String firstName, String lastName, String email, String password, String role, int facilityId, String? department
});




}
/// @nodoc
class __$StaffRegistrationRequestCopyWithImpl<$Res>
    implements _$StaffRegistrationRequestCopyWith<$Res> {
  __$StaffRegistrationRequestCopyWithImpl(this._self, this._then);

  final _StaffRegistrationRequest _self;
  final $Res Function(_StaffRegistrationRequest) _then;

/// Create a copy of StaffRegistrationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? email = null,Object? password = null,Object? role = null,Object? facilityId = null,Object? department = freezed,}) {
  return _then(_StaffRegistrationRequest(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
