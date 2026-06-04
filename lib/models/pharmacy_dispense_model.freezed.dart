// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pharmacy_dispense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PharmacyDispenseModel {

 int get id; int get prescriptionId; int get quantityDispensed; String get status; DateTime get dispensedAt; String? get notes;
/// Create a copy of PharmacyDispenseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacyDispenseModelCopyWith<PharmacyDispenseModel> get copyWith => _$PharmacyDispenseModelCopyWithImpl<PharmacyDispenseModel>(this as PharmacyDispenseModel, _$identity);

  /// Serializes this PharmacyDispenseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacyDispenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.quantityDispensed, quantityDispensed) || other.quantityDispensed == quantityDispensed)&&(identical(other.status, status) || other.status == status)&&(identical(other.dispensedAt, dispensedAt) || other.dispensedAt == dispensedAt)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prescriptionId,quantityDispensed,status,dispensedAt,notes);

@override
String toString() {
  return 'PharmacyDispenseModel(id: $id, prescriptionId: $prescriptionId, quantityDispensed: $quantityDispensed, status: $status, dispensedAt: $dispensedAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $PharmacyDispenseModelCopyWith<$Res>  {
  factory $PharmacyDispenseModelCopyWith(PharmacyDispenseModel value, $Res Function(PharmacyDispenseModel) _then) = _$PharmacyDispenseModelCopyWithImpl;
@useResult
$Res call({
 int id, int prescriptionId, int quantityDispensed, String status, DateTime dispensedAt, String? notes
});




}
/// @nodoc
class _$PharmacyDispenseModelCopyWithImpl<$Res>
    implements $PharmacyDispenseModelCopyWith<$Res> {
  _$PharmacyDispenseModelCopyWithImpl(this._self, this._then);

  final PharmacyDispenseModel _self;
  final $Res Function(PharmacyDispenseModel) _then;

/// Create a copy of PharmacyDispenseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? prescriptionId = null,Object? quantityDispensed = null,Object? status = null,Object? dispensedAt = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,quantityDispensed: null == quantityDispensed ? _self.quantityDispensed : quantityDispensed // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dispensedAt: null == dispensedAt ? _self.dispensedAt : dispensedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PharmacyDispenseModel].
extension PharmacyDispenseModelPatterns on PharmacyDispenseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacyDispenseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacyDispenseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacyDispenseModel value)  $default,){
final _that = this;
switch (_that) {
case _PharmacyDispenseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacyDispenseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacyDispenseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int prescriptionId,  int quantityDispensed,  String status,  DateTime dispensedAt,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacyDispenseModel() when $default != null:
return $default(_that.id,_that.prescriptionId,_that.quantityDispensed,_that.status,_that.dispensedAt,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int prescriptionId,  int quantityDispensed,  String status,  DateTime dispensedAt,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _PharmacyDispenseModel():
return $default(_that.id,_that.prescriptionId,_that.quantityDispensed,_that.status,_that.dispensedAt,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int prescriptionId,  int quantityDispensed,  String status,  DateTime dispensedAt,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _PharmacyDispenseModel() when $default != null:
return $default(_that.id,_that.prescriptionId,_that.quantityDispensed,_that.status,_that.dispensedAt,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PharmacyDispenseModel implements PharmacyDispenseModel {
  const _PharmacyDispenseModel({required this.id, required this.prescriptionId, required this.quantityDispensed, required this.status, required this.dispensedAt, this.notes});
  factory _PharmacyDispenseModel.fromJson(Map<String, dynamic> json) => _$PharmacyDispenseModelFromJson(json);

@override final  int id;
@override final  int prescriptionId;
@override final  int quantityDispensed;
@override final  String status;
@override final  DateTime dispensedAt;
@override final  String? notes;

/// Create a copy of PharmacyDispenseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacyDispenseModelCopyWith<_PharmacyDispenseModel> get copyWith => __$PharmacyDispenseModelCopyWithImpl<_PharmacyDispenseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacyDispenseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PharmacyDispenseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.quantityDispensed, quantityDispensed) || other.quantityDispensed == quantityDispensed)&&(identical(other.status, status) || other.status == status)&&(identical(other.dispensedAt, dispensedAt) || other.dispensedAt == dispensedAt)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,prescriptionId,quantityDispensed,status,dispensedAt,notes);

@override
String toString() {
  return 'PharmacyDispenseModel(id: $id, prescriptionId: $prescriptionId, quantityDispensed: $quantityDispensed, status: $status, dispensedAt: $dispensedAt, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$PharmacyDispenseModelCopyWith<$Res> implements $PharmacyDispenseModelCopyWith<$Res> {
  factory _$PharmacyDispenseModelCopyWith(_PharmacyDispenseModel value, $Res Function(_PharmacyDispenseModel) _then) = __$PharmacyDispenseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int prescriptionId, int quantityDispensed, String status, DateTime dispensedAt, String? notes
});




}
/// @nodoc
class __$PharmacyDispenseModelCopyWithImpl<$Res>
    implements _$PharmacyDispenseModelCopyWith<$Res> {
  __$PharmacyDispenseModelCopyWithImpl(this._self, this._then);

  final _PharmacyDispenseModel _self;
  final $Res Function(_PharmacyDispenseModel) _then;

/// Create a copy of PharmacyDispenseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? prescriptionId = null,Object? quantityDispensed = null,Object? status = null,Object? dispensedAt = null,Object? notes = freezed,}) {
  return _then(_PharmacyDispenseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,quantityDispensed: null == quantityDispensed ? _self.quantityDispensed : quantityDispensed // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,dispensedAt: null == dispensedAt ? _self.dispensedAt : dispensedAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PharmacyDispenseCreateRequest {

 int get prescriptionId; int get quantityDispensed; String? get notes;
/// Create a copy of PharmacyDispenseCreateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacyDispenseCreateRequestCopyWith<PharmacyDispenseCreateRequest> get copyWith => _$PharmacyDispenseCreateRequestCopyWithImpl<PharmacyDispenseCreateRequest>(this as PharmacyDispenseCreateRequest, _$identity);

  /// Serializes this PharmacyDispenseCreateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PharmacyDispenseCreateRequest&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.quantityDispensed, quantityDispensed) || other.quantityDispensed == quantityDispensed)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prescriptionId,quantityDispensed,notes);

@override
String toString() {
  return 'PharmacyDispenseCreateRequest(prescriptionId: $prescriptionId, quantityDispensed: $quantityDispensed, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $PharmacyDispenseCreateRequestCopyWith<$Res>  {
  factory $PharmacyDispenseCreateRequestCopyWith(PharmacyDispenseCreateRequest value, $Res Function(PharmacyDispenseCreateRequest) _then) = _$PharmacyDispenseCreateRequestCopyWithImpl;
@useResult
$Res call({
 int prescriptionId, int quantityDispensed, String? notes
});




}
/// @nodoc
class _$PharmacyDispenseCreateRequestCopyWithImpl<$Res>
    implements $PharmacyDispenseCreateRequestCopyWith<$Res> {
  _$PharmacyDispenseCreateRequestCopyWithImpl(this._self, this._then);

  final PharmacyDispenseCreateRequest _self;
  final $Res Function(PharmacyDispenseCreateRequest) _then;

/// Create a copy of PharmacyDispenseCreateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prescriptionId = null,Object? quantityDispensed = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,quantityDispensed: null == quantityDispensed ? _self.quantityDispensed : quantityDispensed // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PharmacyDispenseCreateRequest].
extension PharmacyDispenseCreateRequestPatterns on PharmacyDispenseCreateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacyDispenseCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacyDispenseCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacyDispenseCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int prescriptionId,  int quantityDispensed,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest() when $default != null:
return $default(_that.prescriptionId,_that.quantityDispensed,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int prescriptionId,  int quantityDispensed,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest():
return $default(_that.prescriptionId,_that.quantityDispensed,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int prescriptionId,  int quantityDispensed,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest() when $default != null:
return $default(_that.prescriptionId,_that.quantityDispensed,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PharmacyDispenseCreateRequest implements PharmacyDispenseCreateRequest {
  const _PharmacyDispenseCreateRequest({required this.prescriptionId, required this.quantityDispensed, this.notes});
  factory _PharmacyDispenseCreateRequest.fromJson(Map<String, dynamic> json) => _$PharmacyDispenseCreateRequestFromJson(json);

@override final  int prescriptionId;
@override final  int quantityDispensed;
@override final  String? notes;

/// Create a copy of PharmacyDispenseCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PharmacyDispenseCreateRequestCopyWith<_PharmacyDispenseCreateRequest> get copyWith => __$PharmacyDispenseCreateRequestCopyWithImpl<_PharmacyDispenseCreateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PharmacyDispenseCreateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PharmacyDispenseCreateRequest&&(identical(other.prescriptionId, prescriptionId) || other.prescriptionId == prescriptionId)&&(identical(other.quantityDispensed, quantityDispensed) || other.quantityDispensed == quantityDispensed)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prescriptionId,quantityDispensed,notes);

@override
String toString() {
  return 'PharmacyDispenseCreateRequest(prescriptionId: $prescriptionId, quantityDispensed: $quantityDispensed, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$PharmacyDispenseCreateRequestCopyWith<$Res> implements $PharmacyDispenseCreateRequestCopyWith<$Res> {
  factory _$PharmacyDispenseCreateRequestCopyWith(_PharmacyDispenseCreateRequest value, $Res Function(_PharmacyDispenseCreateRequest) _then) = __$PharmacyDispenseCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 int prescriptionId, int quantityDispensed, String? notes
});




}
/// @nodoc
class __$PharmacyDispenseCreateRequestCopyWithImpl<$Res>
    implements _$PharmacyDispenseCreateRequestCopyWith<$Res> {
  __$PharmacyDispenseCreateRequestCopyWithImpl(this._self, this._then);

  final _PharmacyDispenseCreateRequest _self;
  final $Res Function(_PharmacyDispenseCreateRequest) _then;

/// Create a copy of PharmacyDispenseCreateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prescriptionId = null,Object? quantityDispensed = null,Object? notes = freezed,}) {
  return _then(_PharmacyDispenseCreateRequest(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,quantityDispensed: null == quantityDispensed ? _self.quantityDispensed : quantityDispensed // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
