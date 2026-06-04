// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encounter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EncounterModel {

 int get id; String get encounterNumber; int get patientId;@JsonKey(defaultValue: '') String get patientName; String get doctorName; String? get nurseName; String get status; String get chiefComplaint; String? get vitals; String? get diagnosis; String? get clinicalNotes; DateTime get createdAt; DateTime? get updatedAt; DateTime? get closedAt;
/// Create a copy of EncounterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterModelCopyWith<EncounterModel> get copyWith => _$EncounterModelCopyWithImpl<EncounterModel>(this as EncounterModel, _$identity);

  /// Serializes this EncounterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.encounterNumber, encounterNumber) || other.encounterNumber == encounterNumber)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.nurseName, nurseName) || other.nurseName == nurseName)&&(identical(other.status, status) || other.status == status)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.vitals, vitals) || other.vitals == vitals)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.clinicalNotes, clinicalNotes) || other.clinicalNotes == clinicalNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,encounterNumber,patientId,patientName,doctorName,nurseName,status,chiefComplaint,vitals,diagnosis,clinicalNotes,createdAt,updatedAt,closedAt);

@override
String toString() {
  return 'EncounterModel(id: $id, encounterNumber: $encounterNumber, patientId: $patientId, patientName: $patientName, doctorName: $doctorName, nurseName: $nurseName, status: $status, chiefComplaint: $chiefComplaint, vitals: $vitals, diagnosis: $diagnosis, clinicalNotes: $clinicalNotes, createdAt: $createdAt, updatedAt: $updatedAt, closedAt: $closedAt)';
}


}

/// @nodoc
abstract mixin class $EncounterModelCopyWith<$Res>  {
  factory $EncounterModelCopyWith(EncounterModel value, $Res Function(EncounterModel) _then) = _$EncounterModelCopyWithImpl;
@useResult
$Res call({
 int id, String encounterNumber, int patientId,@JsonKey(defaultValue: '') String patientName, String doctorName, String? nurseName, String status, String chiefComplaint, String? vitals, String? diagnosis, String? clinicalNotes, DateTime createdAt, DateTime? updatedAt, DateTime? closedAt
});




}
/// @nodoc
class _$EncounterModelCopyWithImpl<$Res>
    implements $EncounterModelCopyWith<$Res> {
  _$EncounterModelCopyWithImpl(this._self, this._then);

  final EncounterModel _self;
  final $Res Function(EncounterModel) _then;

/// Create a copy of EncounterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? encounterNumber = null,Object? patientId = null,Object? patientName = null,Object? doctorName = null,Object? nurseName = freezed,Object? status = null,Object? chiefComplaint = null,Object? vitals = freezed,Object? diagnosis = freezed,Object? clinicalNotes = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? closedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,encounterNumber: null == encounterNumber ? _self.encounterNumber : encounterNumber // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,nurseName: freezed == nurseName ? _self.nurseName : nurseName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,chiefComplaint: null == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String,vitals: freezed == vitals ? _self.vitals : vitals // ignore: cast_nullable_to_non_nullable
as String?,diagnosis: freezed == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String?,clinicalNotes: freezed == clinicalNotes ? _self.clinicalNotes : clinicalNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterModel].
extension EncounterModelPatterns on EncounterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterModel value)  $default,){
final _that = this;
switch (_that) {
case _EncounterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterModel value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String encounterNumber,  int patientId, @JsonKey(defaultValue: '')  String patientName,  String doctorName,  String? nurseName,  String status,  String chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  DateTime createdAt,  DateTime? updatedAt,  DateTime? closedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterModel() when $default != null:
return $default(_that.id,_that.encounterNumber,_that.patientId,_that.patientName,_that.doctorName,_that.nurseName,_that.status,_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.createdAt,_that.updatedAt,_that.closedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String encounterNumber,  int patientId, @JsonKey(defaultValue: '')  String patientName,  String doctorName,  String? nurseName,  String status,  String chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  DateTime createdAt,  DateTime? updatedAt,  DateTime? closedAt)  $default,) {final _that = this;
switch (_that) {
case _EncounterModel():
return $default(_that.id,_that.encounterNumber,_that.patientId,_that.patientName,_that.doctorName,_that.nurseName,_that.status,_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.createdAt,_that.updatedAt,_that.closedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String encounterNumber,  int patientId, @JsonKey(defaultValue: '')  String patientName,  String doctorName,  String? nurseName,  String status,  String chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  DateTime createdAt,  DateTime? updatedAt,  DateTime? closedAt)?  $default,) {final _that = this;
switch (_that) {
case _EncounterModel() when $default != null:
return $default(_that.id,_that.encounterNumber,_that.patientId,_that.patientName,_that.doctorName,_that.nurseName,_that.status,_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.createdAt,_that.updatedAt,_that.closedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterModel implements EncounterModel {
  const _EncounterModel({required this.id, required this.encounterNumber, required this.patientId, @JsonKey(defaultValue: '') required this.patientName, required this.doctorName, this.nurseName, required this.status, required this.chiefComplaint, this.vitals, this.diagnosis, this.clinicalNotes, required this.createdAt, this.updatedAt, this.closedAt});
  factory _EncounterModel.fromJson(Map<String, dynamic> json) => _$EncounterModelFromJson(json);

@override final  int id;
@override final  String encounterNumber;
@override final  int patientId;
@override@JsonKey(defaultValue: '') final  String patientName;
@override final  String doctorName;
@override final  String? nurseName;
@override final  String status;
@override final  String chiefComplaint;
@override final  String? vitals;
@override final  String? diagnosis;
@override final  String? clinicalNotes;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? closedAt;

/// Create a copy of EncounterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterModelCopyWith<_EncounterModel> get copyWith => __$EncounterModelCopyWithImpl<_EncounterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.encounterNumber, encounterNumber) || other.encounterNumber == encounterNumber)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.patientName, patientName) || other.patientName == patientName)&&(identical(other.doctorName, doctorName) || other.doctorName == doctorName)&&(identical(other.nurseName, nurseName) || other.nurseName == nurseName)&&(identical(other.status, status) || other.status == status)&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.vitals, vitals) || other.vitals == vitals)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.clinicalNotes, clinicalNotes) || other.clinicalNotes == clinicalNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,encounterNumber,patientId,patientName,doctorName,nurseName,status,chiefComplaint,vitals,diagnosis,clinicalNotes,createdAt,updatedAt,closedAt);

@override
String toString() {
  return 'EncounterModel(id: $id, encounterNumber: $encounterNumber, patientId: $patientId, patientName: $patientName, doctorName: $doctorName, nurseName: $nurseName, status: $status, chiefComplaint: $chiefComplaint, vitals: $vitals, diagnosis: $diagnosis, clinicalNotes: $clinicalNotes, createdAt: $createdAt, updatedAt: $updatedAt, closedAt: $closedAt)';
}


}

/// @nodoc
abstract mixin class _$EncounterModelCopyWith<$Res> implements $EncounterModelCopyWith<$Res> {
  factory _$EncounterModelCopyWith(_EncounterModel value, $Res Function(_EncounterModel) _then) = __$EncounterModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String encounterNumber, int patientId,@JsonKey(defaultValue: '') String patientName, String doctorName, String? nurseName, String status, String chiefComplaint, String? vitals, String? diagnosis, String? clinicalNotes, DateTime createdAt, DateTime? updatedAt, DateTime? closedAt
});




}
/// @nodoc
class __$EncounterModelCopyWithImpl<$Res>
    implements _$EncounterModelCopyWith<$Res> {
  __$EncounterModelCopyWithImpl(this._self, this._then);

  final _EncounterModel _self;
  final $Res Function(_EncounterModel) _then;

/// Create a copy of EncounterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? encounterNumber = null,Object? patientId = null,Object? patientName = null,Object? doctorName = null,Object? nurseName = freezed,Object? status = null,Object? chiefComplaint = null,Object? vitals = freezed,Object? diagnosis = freezed,Object? clinicalNotes = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? closedAt = freezed,}) {
  return _then(_EncounterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,encounterNumber: null == encounterNumber ? _self.encounterNumber : encounterNumber // ignore: cast_nullable_to_non_nullable
as String,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,patientName: null == patientName ? _self.patientName : patientName // ignore: cast_nullable_to_non_nullable
as String,doctorName: null == doctorName ? _self.doctorName : doctorName // ignore: cast_nullable_to_non_nullable
as String,nurseName: freezed == nurseName ? _self.nurseName : nurseName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,chiefComplaint: null == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String,vitals: freezed == vitals ? _self.vitals : vitals // ignore: cast_nullable_to_non_nullable
as String?,diagnosis: freezed == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String?,clinicalNotes: freezed == clinicalNotes ? _self.clinicalNotes : clinicalNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
