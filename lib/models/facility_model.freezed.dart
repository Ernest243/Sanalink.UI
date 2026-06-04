// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FacilityModel {

 int get id; String get name; String? get address; String? get phone; String? get email; bool? get isActive; DateTime get createdAt;
/// Create a copy of FacilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityModelCopyWith<FacilityModel> get copyWith => _$FacilityModelCopyWithImpl<FacilityModel>(this as FacilityModel, _$identity);

  /// Serializes this FacilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,phone,email,isActive,createdAt);

@override
String toString() {
  return 'FacilityModel(id: $id, name: $name, address: $address, phone: $phone, email: $email, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FacilityModelCopyWith<$Res>  {
  factory $FacilityModelCopyWith(FacilityModel value, $Res Function(FacilityModel) _then) = _$FacilityModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? address, String? phone, String? email, bool? isActive, DateTime createdAt
});




}
/// @nodoc
class _$FacilityModelCopyWithImpl<$Res>
    implements $FacilityModelCopyWith<$Res> {
  _$FacilityModelCopyWithImpl(this._self, this._then);

  final FacilityModel _self;
  final $Res Function(FacilityModel) _then;

/// Create a copy of FacilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = freezed,Object? phone = freezed,Object? email = freezed,Object? isActive = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FacilityModel].
extension FacilityModelPatterns on FacilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityModel value)  $default,){
final _that = this;
switch (_that) {
case _FacilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? address,  String? phone,  String? email,  bool? isActive,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.phone,_that.email,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? address,  String? phone,  String? email,  bool? isActive,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FacilityModel():
return $default(_that.id,_that.name,_that.address,_that.phone,_that.email,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? address,  String? phone,  String? email,  bool? isActive,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FacilityModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.phone,_that.email,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FacilityModel implements FacilityModel {
  const _FacilityModel({required this.id, required this.name, this.address, this.phone, this.email, this.isActive, required this.createdAt});
  factory _FacilityModel.fromJson(Map<String, dynamic> json) => _$FacilityModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? address;
@override final  String? phone;
@override final  String? email;
@override final  bool? isActive;
@override final  DateTime createdAt;

/// Create a copy of FacilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityModelCopyWith<_FacilityModel> get copyWith => __$FacilityModelCopyWithImpl<_FacilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FacilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,phone,email,isActive,createdAt);

@override
String toString() {
  return 'FacilityModel(id: $id, name: $name, address: $address, phone: $phone, email: $email, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FacilityModelCopyWith<$Res> implements $FacilityModelCopyWith<$Res> {
  factory _$FacilityModelCopyWith(_FacilityModel value, $Res Function(_FacilityModel) _then) = __$FacilityModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? address, String? phone, String? email, bool? isActive, DateTime createdAt
});




}
/// @nodoc
class __$FacilityModelCopyWithImpl<$Res>
    implements _$FacilityModelCopyWith<$Res> {
  __$FacilityModelCopyWithImpl(this._self, this._then);

  final _FacilityModel _self;
  final $Res Function(_FacilityModel) _then;

/// Create a copy of FacilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = freezed,Object? phone = freezed,Object? email = freezed,Object? isActive = freezed,Object? createdAt = null,}) {
  return _then(_FacilityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
