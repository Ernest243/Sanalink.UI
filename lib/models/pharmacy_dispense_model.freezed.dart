
part of 'pharmacy_dispense_model.dart';

T _$identity<T>(T value) => value;

mixin _$PharmacyDispenseModel {

 int get id; int get prescriptionId; int get quantityDispensed; String get status; DateTime get dispensedAt; String? get notes;
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacyDispenseModelCopyWith<PharmacyDispenseModel> get copyWith => _$PharmacyDispenseModelCopyWithImpl<PharmacyDispenseModel>(this as PharmacyDispenseModel, _$identity);

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

abstract mixin class $PharmacyDispenseModelCopyWith<$Res>  {
  factory $PharmacyDispenseModelCopyWith(PharmacyDispenseModel value, $Res Function(PharmacyDispenseModel) _then) = _$PharmacyDispenseModelCopyWithImpl;
@useResult
$Res call({
 int id, int prescriptionId, int quantityDispensed, String status, DateTime dispensedAt, String? notes
});




}
class _$PharmacyDispenseModelCopyWithImpl<$Res>
    implements $PharmacyDispenseModelCopyWith<$Res> {
  _$PharmacyDispenseModelCopyWithImpl(this._self, this._then);

  final PharmacyDispenseModel _self;
  final $Res Function(PharmacyDispenseModel) _then;

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


extension PharmacyDispenseModelPatterns on PharmacyDispenseModel {


@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacyDispenseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacyDispenseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}


@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacyDispenseModel value)  $default,){
final _that = this;
switch (_that) {
case _PharmacyDispenseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacyDispenseModel value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacyDispenseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}


@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int prescriptionId,  int quantityDispensed,  String status,  DateTime dispensedAt,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacyDispenseModel() when $default != null:
return $default(_that.id,_that.prescriptionId,_that.quantityDispensed,_that.status,_that.dispensedAt,_that.notes);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int prescriptionId,  int quantityDispensed,  String status,  DateTime dispensedAt,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _PharmacyDispenseModel():
return $default(_that.id,_that.prescriptionId,_that.quantityDispensed,_that.status,_that.dispensedAt,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int prescriptionId,  int quantityDispensed,  String status,  DateTime dispensedAt,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _PharmacyDispenseModel() when $default != null:
return $default(_that.id,_that.prescriptionId,_that.quantityDispensed,_that.status,_that.dispensedAt,_that.notes);case _:
  return null;

}
}

}

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

abstract mixin class _$PharmacyDispenseModelCopyWith<$Res> implements $PharmacyDispenseModelCopyWith<$Res> {
  factory _$PharmacyDispenseModelCopyWith(_PharmacyDispenseModel value, $Res Function(_PharmacyDispenseModel) _then) = __$PharmacyDispenseModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int prescriptionId, int quantityDispensed, String status, DateTime dispensedAt, String? notes
});




}
class __$PharmacyDispenseModelCopyWithImpl<$Res>
    implements _$PharmacyDispenseModelCopyWith<$Res> {
  __$PharmacyDispenseModelCopyWithImpl(this._self, this._then);

  final _PharmacyDispenseModel _self;
  final $Res Function(_PharmacyDispenseModel) _then;

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


mixin _$PharmacyDispenseCreateRequest {

 int get prescriptionId; int get quantityDispensed; String? get notes;
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PharmacyDispenseCreateRequestCopyWith<PharmacyDispenseCreateRequest> get copyWith => _$PharmacyDispenseCreateRequestCopyWithImpl<PharmacyDispenseCreateRequest>(this as PharmacyDispenseCreateRequest, _$identity);

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

abstract mixin class $PharmacyDispenseCreateRequestCopyWith<$Res>  {
  factory $PharmacyDispenseCreateRequestCopyWith(PharmacyDispenseCreateRequest value, $Res Function(PharmacyDispenseCreateRequest) _then) = _$PharmacyDispenseCreateRequestCopyWithImpl;
@useResult
$Res call({
 int prescriptionId, int quantityDispensed, String? notes
});




}
class _$PharmacyDispenseCreateRequestCopyWithImpl<$Res>
    implements $PharmacyDispenseCreateRequestCopyWith<$Res> {
  _$PharmacyDispenseCreateRequestCopyWithImpl(this._self, this._then);

  final PharmacyDispenseCreateRequest _self;
  final $Res Function(PharmacyDispenseCreateRequest) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? prescriptionId = null,Object? quantityDispensed = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,quantityDispensed: null == quantityDispensed ? _self.quantityDispensed : quantityDispensed // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


extension PharmacyDispenseCreateRequestPatterns on PharmacyDispenseCreateRequest {


@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PharmacyDispenseCreateRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}


@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PharmacyDispenseCreateRequest value)  $default,){
final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PharmacyDispenseCreateRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}


@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int prescriptionId,  int quantityDispensed,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest() when $default != null:
return $default(_that.prescriptionId,_that.quantityDispensed,_that.notes);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int prescriptionId,  int quantityDispensed,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest():
return $default(_that.prescriptionId,_that.quantityDispensed,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int prescriptionId,  int quantityDispensed,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _PharmacyDispenseCreateRequest() when $default != null:
return $default(_that.prescriptionId,_that.quantityDispensed,_that.notes);case _:
  return null;

}
}

}

@JsonSerializable()

class _PharmacyDispenseCreateRequest implements PharmacyDispenseCreateRequest {
  const _PharmacyDispenseCreateRequest({required this.prescriptionId, required this.quantityDispensed, this.notes});
  factory _PharmacyDispenseCreateRequest.fromJson(Map<String, dynamic> json) => _$PharmacyDispenseCreateRequestFromJson(json);

@override final  int prescriptionId;
@override final  int quantityDispensed;
@override final  String? notes;

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

abstract mixin class _$PharmacyDispenseCreateRequestCopyWith<$Res> implements $PharmacyDispenseCreateRequestCopyWith<$Res> {
  factory _$PharmacyDispenseCreateRequestCopyWith(_PharmacyDispenseCreateRequest value, $Res Function(_PharmacyDispenseCreateRequest) _then) = __$PharmacyDispenseCreateRequestCopyWithImpl;
@override @useResult
$Res call({
 int prescriptionId, int quantityDispensed, String? notes
});




}
class __$PharmacyDispenseCreateRequestCopyWithImpl<$Res>
    implements _$PharmacyDispenseCreateRequestCopyWith<$Res> {
  __$PharmacyDispenseCreateRequestCopyWithImpl(this._self, this._then);

  final _PharmacyDispenseCreateRequest _self;
  final $Res Function(_PharmacyDispenseCreateRequest) _then;

@override @pragma('vm:prefer-inline') $Res call({Object? prescriptionId = null,Object? quantityDispensed = null,Object? notes = freezed,}) {
  return _then(_PharmacyDispenseCreateRequest(
prescriptionId: null == prescriptionId ? _self.prescriptionId : prescriptionId // ignore: cast_nullable_to_non_nullable
as int,quantityDispensed: null == quantityDispensed ? _self.quantityDispensed : quantityDispensed // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

