// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StaffUserModel {

 String get id; String get email; String get role; String get firstName; String get lastName; String? get department;@JsonKey(fromJson: _parseInt) int? get facilityId; bool get isActive; DateTime? get createdAt;
/// Create a copy of StaffUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffUserModelCopyWith<StaffUserModel> get copyWith => _$StaffUserModelCopyWithImpl<StaffUserModel>(this as StaffUserModel, _$identity);

  /// Serializes this StaffUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.department, department) || other.department == department)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,firstName,lastName,department,facilityId,isActive,createdAt);

@override
String toString() {
  return 'StaffUserModel(id: $id, email: $email, role: $role, firstName: $firstName, lastName: $lastName, department: $department, facilityId: $facilityId, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StaffUserModelCopyWith<$Res>  {
  factory $StaffUserModelCopyWith(StaffUserModel value, $Res Function(StaffUserModel) _then) = _$StaffUserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, String role, String firstName, String lastName, String? department,@JsonKey(fromJson: _parseInt) int? facilityId, bool isActive, DateTime? createdAt
});




}
/// @nodoc
class _$StaffUserModelCopyWithImpl<$Res>
    implements $StaffUserModelCopyWith<$Res> {
  _$StaffUserModelCopyWithImpl(this._self, this._then);

  final StaffUserModel _self;
  final $Res Function(StaffUserModel) _then;

/// Create a copy of StaffUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? role = null,Object? firstName = null,Object? lastName = null,Object? department = freezed,Object? facilityId = freezed,Object? isActive = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,facilityId: freezed == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StaffUserModel].
extension StaffUserModelPatterns on StaffUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffUserModel value)  $default,){
final _that = this;
switch (_that) {
case _StaffUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _StaffUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String role,  String firstName,  String lastName,  String? department, @JsonKey(fromJson: _parseInt)  int? facilityId,  bool isActive,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffUserModel() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.firstName,_that.lastName,_that.department,_that.facilityId,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String role,  String firstName,  String lastName,  String? department, @JsonKey(fromJson: _parseInt)  int? facilityId,  bool isActive,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _StaffUserModel():
return $default(_that.id,_that.email,_that.role,_that.firstName,_that.lastName,_that.department,_that.facilityId,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String role,  String firstName,  String lastName,  String? department, @JsonKey(fromJson: _parseInt)  int? facilityId,  bool isActive,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StaffUserModel() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.firstName,_that.lastName,_that.department,_that.facilityId,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StaffUserModel implements StaffUserModel {
  const _StaffUserModel({required this.id, required this.email, required this.role, required this.firstName, required this.lastName, this.department, @JsonKey(fromJson: _parseInt) this.facilityId, this.isActive = true, this.createdAt});
  factory _StaffUserModel.fromJson(Map<String, dynamic> json) => _$StaffUserModelFromJson(json);

@override final  String id;
@override final  String email;
@override final  String role;
@override final  String firstName;
@override final  String lastName;
@override final  String? department;
@override@JsonKey(fromJson: _parseInt) final  int? facilityId;
@override@JsonKey() final  bool isActive;
@override final  DateTime? createdAt;

/// Create a copy of StaffUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffUserModelCopyWith<_StaffUserModel> get copyWith => __$StaffUserModelCopyWithImpl<_StaffUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.department, department) || other.department == department)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,firstName,lastName,department,facilityId,isActive,createdAt);

@override
String toString() {
  return 'StaffUserModel(id: $id, email: $email, role: $role, firstName: $firstName, lastName: $lastName, department: $department, facilityId: $facilityId, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StaffUserModelCopyWith<$Res> implements $StaffUserModelCopyWith<$Res> {
  factory _$StaffUserModelCopyWith(_StaffUserModel value, $Res Function(_StaffUserModel) _then) = __$StaffUserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String role, String firstName, String lastName, String? department,@JsonKey(fromJson: _parseInt) int? facilityId, bool isActive, DateTime? createdAt
});




}
/// @nodoc
class __$StaffUserModelCopyWithImpl<$Res>
    implements _$StaffUserModelCopyWith<$Res> {
  __$StaffUserModelCopyWithImpl(this._self, this._then);

  final _StaffUserModel _self;
  final $Res Function(_StaffUserModel) _then;

/// Create a copy of StaffUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? role = null,Object? firstName = null,Object? lastName = null,Object? department = freezed,Object? facilityId = freezed,Object? isActive = null,Object? createdAt = freezed,}) {
  return _then(_StaffUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,facilityId: freezed == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
