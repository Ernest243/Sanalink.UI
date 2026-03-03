part of 'prescription_model.dart';


T _$identity<T>(T value) => value;

mixin _$PrescriptionModel {

 int get id; int get patientId; String get prescribedBy; String get medicationName; String get dosage; String get status; DateTime get createdAt;
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionModelCopyWith<PrescriptionModel> get copyWith => _$PrescriptionModelCopyWithImpl<PrescriptionModel>(this as PrescriptionModel, _$identity);

  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.prescribedBy, prescribedBy) || other.prescribedBy == prescribedBy)&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,prescribedBy,medicationName,dosage,status,createdAt);

@override
String toString() {
  return 'PrescriptionModel(id: $id, patientId: $patientId, prescribedBy: $prescribedBy, medicationName: $medicationName, dosage: $dosage, status: $status, createdAt: $createdAt)';
}


}

abstract mixin class $PrescriptionModelCopyWith<$Res>  {
  factory $PrescriptionModelCopyWith(PrescriptionModel value, $Res Function(PrescriptionModel) _then) = _$PrescriptionModelCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, String prescribedBy, String medicationName, String dosage, String status, DateTime createdAt
});




}
class _$PrescriptionModelCopyWithImpl<$Res>
    implements $PrescriptionModelCopyWith<$Res> {
  _$PrescriptionModelCopyWithImpl(this._self, this._then);

  final PrescriptionModel _self;
  final $Res Function(PrescriptionModel) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? prescribedBy = null,Object? medicationName = null,Object? dosage = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,prescribedBy: null == prescribedBy ? _self.prescribedBy : prescribedBy // ignore: cast_nullable_to_non_nullable
as String,medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


extension PrescriptionModelPatterns on PrescriptionModel {


@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrescriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrescriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _PrescriptionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrescriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}


@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  String prescribedBy,  String medicationName,  String dosage,  String status,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
return $default(_that.id,_that.patientId,_that.prescribedBy,_that.medicationName,_that.dosage,_that.status,_that.createdAt);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  String prescribedBy,  String medicationName,  String dosage,  String status,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PrescriptionModel():
return $default(_that.id,_that.patientId,_that.prescribedBy,_that.medicationName,_that.dosage,_that.status,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  String prescribedBy,  String medicationName,  String dosage,  String status,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PrescriptionModel() when $default != null:
return $default(_that.id,_that.patientId,_that.prescribedBy,_that.medicationName,_that.dosage,_that.status,_that.createdAt);case _:
  return null;

}
}

}

@JsonSerializable()

class _PrescriptionModel implements PrescriptionModel {
  const _PrescriptionModel({required this.id, required this.patientId, required this.prescribedBy, required this.medicationName, required this.dosage, required this.status, required this.createdAt});
  factory _PrescriptionModel.fromJson(Map<String, dynamic> json) => _$PrescriptionModelFromJson(json);

@override final  int id;
@override final  int patientId;
@override final  String prescribedBy;
@override final  String medicationName;
@override final  String dosage;
@override final  String status;
@override final  DateTime createdAt;

@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrescriptionModelCopyWith<_PrescriptionModel> get copyWith => __$PrescriptionModelCopyWithImpl<_PrescriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrescriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrescriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.prescribedBy, prescribedBy) || other.prescribedBy == prescribedBy)&&(identical(other.medicationName, medicationName) || other.medicationName == medicationName)&&(identical(other.dosage, dosage) || other.dosage == dosage)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,prescribedBy,medicationName,dosage,status,createdAt);

@override
String toString() {
  return 'PrescriptionModel(id: $id, patientId: $patientId, prescribedBy: $prescribedBy, medicationName: $medicationName, dosage: $dosage, status: $status, createdAt: $createdAt)';
}


}

abstract mixin class _$PrescriptionModelCopyWith<$Res> implements $PrescriptionModelCopyWith<$Res> {
  factory _$PrescriptionModelCopyWith(_PrescriptionModel value, $Res Function(_PrescriptionModel) _then) = __$PrescriptionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, String prescribedBy, String medicationName, String dosage, String status, DateTime createdAt
});




}
class __$PrescriptionModelCopyWithImpl<$Res>
    implements _$PrescriptionModelCopyWith<$Res> {
  __$PrescriptionModelCopyWithImpl(this._self, this._then);

  final _PrescriptionModel _self;
  final $Res Function(_PrescriptionModel) _then;

@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? prescribedBy = null,Object? medicationName = null,Object? dosage = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_PrescriptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,prescribedBy: null == prescribedBy ? _self.prescribedBy : prescribedBy // ignore: cast_nullable_to_non_nullable
as String,medicationName: null == medicationName ? _self.medicationName : medicationName // ignore: cast_nullable_to_non_nullable
as String,dosage: null == dosage ? _self.dosage : dosage // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

