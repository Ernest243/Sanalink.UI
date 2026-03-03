part of 'encounter_update_request.dart';

T _$identity<T>(T value) => value;

mixin _$EncounterUpdateRequest {

 String? get chiefComplaint; String? get vitals; String? get diagnosis; String? get clinicalNotes; String? get nurseId;
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EncounterUpdateRequestCopyWith<EncounterUpdateRequest> get copyWith => _$EncounterUpdateRequestCopyWithImpl<EncounterUpdateRequest>(this as EncounterUpdateRequest, _$identity);

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

abstract mixin class $EncounterUpdateRequestCopyWith<$Res>  {
  factory $EncounterUpdateRequestCopyWith(EncounterUpdateRequest value, $Res Function(EncounterUpdateRequest) _then) = _$EncounterUpdateRequestCopyWithImpl;
@useResult
$Res call({
 String? chiefComplaint, String? vitals, String? diagnosis, String? clinicalNotes, String? nurseId
});




}
class _$EncounterUpdateRequestCopyWithImpl<$Res>
    implements $EncounterUpdateRequestCopyWith<$Res> {
  _$EncounterUpdateRequestCopyWithImpl(this._self, this._then);

  final EncounterUpdateRequest _self;
  final $Res Function(EncounterUpdateRequest) _then;

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


extension EncounterUpdateRequestPatterns on EncounterUpdateRequest {

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EncounterUpdateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EncounterUpdateRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EncounterUpdateRequest value)  $default,){
final _that = this;
switch (_that) {
case _EncounterUpdateRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EncounterUpdateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _EncounterUpdateRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}


@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  String? nurseId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EncounterUpdateRequest() when $default != null:
return $default(_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.nurseId);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  String? nurseId)  $default,) {final _that = this;
switch (_that) {
case _EncounterUpdateRequest():
return $default(_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.nurseId);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? chiefComplaint,  String? vitals,  String? diagnosis,  String? clinicalNotes,  String? nurseId)?  $default,) {final _that = this;
switch (_that) {
case _EncounterUpdateRequest() when $default != null:
return $default(_that.chiefComplaint,_that.vitals,_that.diagnosis,_that.clinicalNotes,_that.nurseId);case _:
  return null;

}
}

}

@JsonSerializable()

class _EncounterUpdateRequest implements EncounterUpdateRequest {
  const _EncounterUpdateRequest({this.chiefComplaint, this.vitals, this.diagnosis, this.clinicalNotes, this.nurseId});
  factory _EncounterUpdateRequest.fromJson(Map<String, dynamic> json) => _$EncounterUpdateRequestFromJson(json);

@override final  String? chiefComplaint;
@override final  String? vitals;
@override final  String? diagnosis;
@override final  String? clinicalNotes;
@override final  String? nurseId;

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

abstract mixin class _$EncounterUpdateRequestCopyWith<$Res> implements $EncounterUpdateRequestCopyWith<$Res> {
  factory _$EncounterUpdateRequestCopyWith(_EncounterUpdateRequest value, $Res Function(_EncounterUpdateRequest) _then) = __$EncounterUpdateRequestCopyWithImpl;
@override @useResult
$Res call({
 String? chiefComplaint, String? vitals, String? diagnosis, String? clinicalNotes, String? nurseId
});




}
class __$EncounterUpdateRequestCopyWithImpl<$Res>
    implements _$EncounterUpdateRequestCopyWith<$Res> {
  __$EncounterUpdateRequestCopyWithImpl(this._self, this._then);

  final _EncounterUpdateRequest _self;
  final $Res Function(_EncounterUpdateRequest) _then;

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
