// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrescriptionModel {

 int get id; int get patientId; String get medicationName; String get dosage; String get instructions; String get doctorName;// Status is not stored on the Prescription entity in the backend;
// it defaults to 'Pending' until the pharmacist creates a dispense.
 String get status; DateTime get createdAt;
/// Create a copy of PrescriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionModelCopyWith<PrescriptionModel> get copyWith => _$PrescriptionModelCopyWithImpl<PrescriptionModel>(this as PrescriptionModel, _$identity);

  /// Serializes this PrescriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,medicationName,dosage,instructions,doctorName,status,createdAt);

@override
String toString() {
  return 'PrescriptionModel(id: $id, patientId: $patientId, medicationName: $medicationName, dosage: $dosage, instructions: $instructions, doctorName: $doctorName, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PrescriptionModelCopyWith<$Res>  {
  factory $PrescriptionModelCopyWith(PrescriptionModel value, $Res Function(PrescriptionModel) _then) = _$PrescriptionModelCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, String medicationName, String dosage, String instructions, String doctorName, String status, DateTime createdAt
});




}
/// @nodoc
class _$PrescriptionModelCopyWithImpl<$Res>
    implements $PrescriptionModelCopyWith<$Res> {
  _$PrescriptionModelCopyWithImpl(this._self, this._then);

  final PrescriptionModel _self;
  final $Res Function(PrescriptionModel) _then;

/// Create a copy of PrescriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? medicationName = null,Object? dosage = null,Object? instructions = null,Object? doctorName = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PrescriptionModel].
extension PrescriptionModelPatterns on PrescriptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  String medicationName,  String dosage,  String instructions,  String doctorName,  String status,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
return $default(_that.id,_that.patientId,_that.medicationName,_that.dosage,_that.instructions,_that.doctorName,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  String medicationName,  String dosage,  String instructions,  String doctorName,  String status,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionModel():
return $default(_that.id,_that.patientId,_that.medicationName,_that.dosage,_that.instructions,_that.doctorName,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  String medicationName,  String dosage,  String instructions,  String doctorName,  String status,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
return $default(_that.id,_that.patientId,_that.medicationName,_that.dosage,_that.instructions,_that.doctorName,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrescriptionModel implements PrescriptionModel {
  const _PrescriptionModel({required this.id, required this.patientId, required this.medicationName, required this.dosage, this.instructions = '', required this.doctorName, this.status = 'Pending', required this.createdAt});
  factory _PrescriptionModel.fromJson(Map<String, dynamic> json) => _$PrescriptionModelFromJson(json);

@override final  int id;
@override final  int patientId;
@override final  String medicationName;
@override final  String dosage;
@override@JsonKey() final  String instructions;
@override final  String doctorName;
// Status is not stored on the Prescription entity in the backend;
// it defaults to 'Pending' until the pharmacist creates a dispense.
@override@JsonKey() final  String status;
@override final  DateTime createdAt;

/// Create a copy of PrescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionModelCopyWith<_PrescriptionModel> get copyWith => __$PrescriptionModelCopyWithImpl<_PrescriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,medicationName,dosage,instructions,doctorName,status,createdAt);

@override
String toString() {
  return 'PrescriptionModel(id: $id, patientId: $patientId, medicationName: $medicationName, dosage: $dosage, instructions: $instructions, doctorName: $doctorName, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PrescriptionModelCopyWith<$Res> implements $PrescriptionModelCopyWith<$Res> {
  factory _$PrescriptionModelCopyWith(_PrescriptionModel value, $Res Function(_PrescriptionModel) _then) = __$PrescriptionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, String medicationName, String dosage, String instructions, String doctorName, String status, DateTime createdAt
});




}
/// @nodoc
class __$PrescriptionModelCopyWithImpl<$Res>
    implements _$PrescriptionModelCopyWith<$Res> {
  __$PrescriptionModelCopyWithImpl(this._self, this._then);

  final _PrescriptionModel _self;
  final $Res Function(_PrescriptionModel) _then;

/// Create a copy of PrescriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? medicationName = null,Object? dosage = null,Object? instructions = null,Object? doctorName = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_PrescriptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
