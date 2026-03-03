part of 'lab_order_model.dart';

T _$identity<T>(T value) => value;

mixin _$LabOrderModel {

 int get id; int get patientId; String get requestedBy; String get testName; String get status; String? get result; String? get resultNotes; DateTime get createdAt;
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LabOrderModelCopyWith<LabOrderModel> get copyWith => _$LabOrderModelCopyWithImpl<LabOrderModel>(this as LabOrderModel, _$identity);

  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LabOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.testName, testName) || other.testName == testName)&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&(identical(other.resultNotes, resultNotes) || other.resultNotes == resultNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,requestedBy,testName,status,result,resultNotes,createdAt);

@override
String toString() {
  return 'LabOrderModel(id: $id, patientId: $patientId, requestedBy: $requestedBy, testName: $testName, status: $status, result: $result, resultNotes: $resultNotes, createdAt: $createdAt)';
}


}

abstract mixin class $LabOrderModelCopyWith<$Res>  {
  factory $LabOrderModelCopyWith(LabOrderModel value, $Res Function(LabOrderModel) _then) = _$LabOrderModelCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, String requestedBy, String testName, String status, String? result, String? resultNotes, DateTime createdAt
});




}
class _$LabOrderModelCopyWithImpl<$Res>
    implements $LabOrderModelCopyWith<$Res> {
  _$LabOrderModelCopyWithImpl(this._self, this._then);

  final LabOrderModel _self;
  final $Res Function(LabOrderModel) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? requestedBy = null,Object? testName = null,Object? status = null,Object? result = freezed,Object? resultNotes = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,testName: null == testName ? _self.testName : testName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,resultNotes: freezed == resultNotes ? _self.resultNotes : resultNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


extension LabOrderModelPatterns on LabOrderModel {


@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LabOrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LabOrderModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}


@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LabOrderModel value)  $default,){
final _that = this;
switch (_that) {
case _LabOrderModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LabOrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _LabOrderModel() when $default != null:
return $default(_that);case _:
  return null;

}
}


@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  String requestedBy,  String testName,  String status,  String? result,  String? resultNotes,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LabOrderModel() when $default != null:
return $default(_that.id,_that.patientId,_that.requestedBy,_that.testName,_that.status,_that.result,_that.resultNotes,_that.createdAt);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  String requestedBy,  String testName,  String status,  String? result,  String? resultNotes,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _LabOrderModel():
return $default(_that.id,_that.patientId,_that.requestedBy,_that.testName,_that.status,_that.result,_that.resultNotes,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  String requestedBy,  String testName,  String status,  String? result,  String? resultNotes,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _LabOrderModel() when $default != null:
return $default(_that.id,_that.patientId,_that.requestedBy,_that.testName,_that.status,_that.result,_that.resultNotes,_that.createdAt);case _:
  return null;

}
}

}

@JsonSerializable()

class _LabOrderModel implements LabOrderModel {
  const _LabOrderModel({required this.id, required this.patientId, required this.requestedBy, required this.testName, required this.status, this.result, this.resultNotes, required this.createdAt});
  factory _LabOrderModel.fromJson(Map<String, dynamic> json) => _$LabOrderModelFromJson(json);

@override final  int id;
@override final  int patientId;
@override final  String requestedBy;
@override final  String testName;
@override final  String status;
@override final  String? result;
@override final  String? resultNotes;
@override final  DateTime createdAt;

@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LabOrderModelCopyWith<_LabOrderModel> get copyWith => __$LabOrderModelCopyWithImpl<_LabOrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LabOrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LabOrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.requestedBy, requestedBy) || other.requestedBy == requestedBy)&&(identical(other.testName, testName) || other.testName == testName)&&(identical(other.status, status) || other.status == status)&&(identical(other.result, result) || other.result == result)&&(identical(other.resultNotes, resultNotes) || other.resultNotes == resultNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,requestedBy,testName,status,result,resultNotes,createdAt);

@override
String toString() {
  return 'LabOrderModel(id: $id, patientId: $patientId, requestedBy: $requestedBy, testName: $testName, status: $status, result: $result, resultNotes: $resultNotes, createdAt: $createdAt)';
}


}

abstract mixin class _$LabOrderModelCopyWith<$Res> implements $LabOrderModelCopyWith<$Res> {
  factory _$LabOrderModelCopyWith(_LabOrderModel value, $Res Function(_LabOrderModel) _then) = __$LabOrderModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, String requestedBy, String testName, String status, String? result, String? resultNotes, DateTime createdAt
});




}
class __$LabOrderModelCopyWithImpl<$Res>
    implements _$LabOrderModelCopyWith<$Res> {
  __$LabOrderModelCopyWithImpl(this._self, this._then);

  final _LabOrderModel _self;
  final $Res Function(_LabOrderModel) _then;

@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? requestedBy = null,Object? testName = null,Object? status = null,Object? result = freezed,Object? resultNotes = freezed,Object? createdAt = null,}) {
  return _then(_LabOrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,requestedBy: null == requestedBy ? _self.requestedBy : requestedBy // ignore: cast_nullable_to_non_nullable
as String,testName: null == testName ? _self.testName : testName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String?,resultNotes: freezed == resultNotes ? _self.resultNotes : resultNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

