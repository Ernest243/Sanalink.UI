// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encounter_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EncounterUpdateRequest {

 String? get chiefComplaint; String? get vitals; String? get diagnosis; String? get clinicalNotes; String? get nurseId;
/// Create a copy of EncounterUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterUpdateRequestCopyWith<EncounterUpdateRequest> get copyWith => _$EncounterUpdateRequestCopyWithImpl<EncounterUpdateRequest>(this as EncounterUpdateRequest, _$identity);

  /// Serializes this EncounterUpdateRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EncounterUpdateRequest&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.vitals, vitals) || other.vitals == vitals)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.clinicalNotes, clinicalNotes) || other.clinicalNotes == clinicalNotes)&&(identical(other.nurseId, nurseId) || other.nurseId == nurseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chiefComplaint,vitals,diagnosis,clinicalNotes,nurseId);

@override
String toString() {
  return 'EncounterUpdateRequest(chiefComplaint: $chiefComplaint, vitals: $vitals, diagnosis: $diagnosis, clinicalNotes: $clinicalNotes, nurseId: $nurseId)';
}


}

/// @nodoc
abstract mixin class $EncounterUpdateRequestCopyWith<$Res>  {
  factory $EncounterUpdateRequestCopyWith(EncounterUpdateRequest value, $Res Function(EncounterUpdateRequest) _then) = _$EncounterUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String? chiefComplaint, String? vitals, String? diagnosis, String? clinicalNotes, String? nurseId
});




}
/// @nodoc
class _$EncounterUpdateRequestCopyWithImpl<$Res>
    implements $EncounterUpdateRequestCopyWith<$Res> {
  _$EncounterUpdateRequestCopyWithImpl(this._self, this._then);

  final EncounterUpdateRequest _self;
  final $Res Function(EncounterUpdateRequest) _then;

/// Create a copy of EncounterUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chiefComplaint = freezed,Object? vitals = freezed,Object? diagnosis = freezed,Object? clinicalNotes = freezed,Object? nurseId = freezed,}) {
  return _then(_self.copyWith(
chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,vitals: freezed == vitals ? _self.vitals : vitals // ignore: cast_nullable_to_non_nullable
as String?,diagnosis: freezed == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String?,clinicalNotes: freezed == clinicalNotes ? _self.clinicalNotes : clinicalNotes // ignore: cast_nullable_to_non_nullable
as String?,nurseId: freezed == nurseId ? _self.nurseId : nurseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EncounterUpdateRequest].
extension EncounterUpdateRequestPatterns on EncounterUpdateRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _EncounterUpdateRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterUpdateRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  String? nurseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterUpdateRequest() when $default != null:
return $default(_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.nurseId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  String? nurseId)  $default,) {final _that = this;
switch (_that) {
case _EncounterUpdateRequest():
return $default(_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.nurseId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  String? nurseId)?  $default,) {final _that = this;
switch (_that) {
case _EncounterUpdateRequest() when $default != null:
return $default(_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.nurseId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EncounterUpdateRequest implements EncounterUpdateRequest {
  const _EncounterUpdateRequest({this.chiefComplaint, this.vitals, this.diagnosis, this.clinicalNotes, this.nurseId});
  factory _EncounterUpdateRequest.fromJson(Map<String, dynamic> json) => _$EncounterUpdateRequestFromJson(json);

@override final  String? chiefComplaint;
@override final  String? vitals;
@override final  String? diagnosis;
@override final  String? clinicalNotes;
@override final  String? nurseId;

/// Create a copy of EncounterUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EncounterUpdateRequestCopyWith<_EncounterUpdateRequest> get copyWith => __$EncounterUpdateRequestCopyWithImpl<_EncounterUpdateRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EncounterUpdateRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EncounterUpdateRequest&&(identical(other.chiefComplaint, chiefComplaint) || other.chiefComplaint == chiefComplaint)&&(identical(other.vitals, vitals) || other.vitals == vitals)&&(identical(other.diagnosis, diagnosis) || other.diagnosis == diagnosis)&&(identical(other.clinicalNotes, clinicalNotes) || other.clinicalNotes == clinicalNotes)&&(identical(other.nurseId, nurseId) || other.nurseId == nurseId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chiefComplaint,vitals,diagnosis,clinicalNotes,nurseId);

@override
String toString() {
  return 'EncounterUpdateRequest(chiefComplaint: $chiefComplaint, vitals: $vitals, diagnosis: $diagnosis, clinicalNotes: $clinicalNotes, nurseId: $nurseId)';
}


}

/// @nodoc
abstract mixin class _$EncounterUpdateRequestCopyWith<$Res> implements $EncounterUpdateRequestCopyWith<$Res> {
  factory _$EncounterUpdateRequestCopyWith(_EncounterUpdateRequest value, $Res Function(_EncounterUpdateRequest) _then) = __$EncounterUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String? chiefComplaint, String? vitals, String? diagnosis, String? clinicalNotes, String? nurseId
});




}
/// @nodoc
class __$EncounterUpdateRequestCopyWithImpl<$Res>
    implements _$EncounterUpdateRequestCopyWith<$Res> {
  __$EncounterUpdateRequestCopyWithImpl(this._self, this._then);

  final _EncounterUpdateRequest _self;
  final $Res Function(_EncounterUpdateRequest) _then;

/// Create a copy of EncounterUpdateRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chiefComplaint = freezed,Object? vitals = freezed,Object? diagnosis = freezed,Object? clinicalNotes = freezed,Object? nurseId = freezed,}) {
  return _then(_EncounterUpdateRequest(
chiefComplaint: freezed == chiefComplaint ? _self.chiefComplaint : chiefComplaint // ignore: cast_nullable_to_non_nullable
as String?,vitals: freezed == vitals ? _self.vitals : vitals // ignore: cast_nullable_to_non_nullable
as String?,diagnosis: freezed == diagnosis ? _self.diagnosis : diagnosis // ignore: cast_nullable_to_non_nullable
as String?,clinicalNotes: freezed == clinicalNotes ? _self.clinicalNotes : clinicalNotes // ignore: cast_nullable_to_non_nullable
as String?,nurseId: freezed == nurseId ? _self.nurseId : nurseId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
