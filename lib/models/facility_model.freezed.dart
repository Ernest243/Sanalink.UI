part of 'facility_model.dart';

T _$identity<T>(T value) => value;

mixin _$FacilityModel {

 int get id; String get name; String get address; String get type;// e.g., "Hospital", "Clinic"
 DateTime get createdAt;
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacilityModelCopyWith<FacilityModel> get copyWith => _$FacilityModelCopyWithImpl<FacilityModel>(this as FacilityModel, _$identity);

  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacilityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,type,createdAt);

@override
String toString() {
  return 'FacilityModel(id: $id, name: $name, address: $address, type: $type, createdAt: $createdAt)';
}


}

abstract mixin class $FacilityModelCopyWith<$Res>  {
  factory $FacilityModelCopyWith(FacilityModel value, $Res Function(FacilityModel) _then) = _$FacilityModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String address, String type, DateTime createdAt
});




}
class _$FacilityModelCopyWithImpl<$Res>
    implements $FacilityModelCopyWith<$Res> {
  _$FacilityModelCopyWithImpl(this._self, this._then);

  final FacilityModel _self;
  final $Res Function(FacilityModel) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? type = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


extension FacilityModelPatterns on FacilityModel {


@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacilityModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}


@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacilityModel value)  $default,){
final _that = this;
switch (_that) {
case _FacilityModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _FacilityModel() when $default != null:
return $default(_that);case _:
  return null;

}
}


@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String address,  String type,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacilityModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.type,_that.createdAt);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String address,  String type,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FacilityModel():
return $default(_that.id,_that.name,_that.address,_that.type,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String address,  String type,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FacilityModel() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.type,_that.createdAt);case _:
  return null;

}
}

}

@JsonSerializable()

class _FacilityModel implements FacilityModel {
  const _FacilityModel({required this.id, required this.name, required this.address, required this.type, required this.createdAt});
  factory _FacilityModel.fromJson(Map<String, dynamic> json) => _$FacilityModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String address;
@override final  String type;
// e.g., "Hospital", "Clinic"
@override final  DateTime createdAt;

@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacilityModelCopyWith<_FacilityModel> get copyWith => __$FacilityModelCopyWithImpl<_FacilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FacilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacilityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,type,createdAt);

@override
String toString() {
  return 'FacilityModel(id: $id, name: $name, address: $address, type: $type, createdAt: $createdAt)';
}


}

abstract mixin class _$FacilityModelCopyWith<$Res> implements $FacilityModelCopyWith<$Res> {
  factory _$FacilityModelCopyWith(_FacilityModel value, $Res Function(_FacilityModel) _then) = __$FacilityModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String address, String type, DateTime createdAt
});




}
class __$FacilityModelCopyWithImpl<$Res>
    implements _$FacilityModelCopyWith<$Res> {
  __$FacilityModelCopyWithImpl(this._self, this._then);

  final _FacilityModel _self;
  final $Res Function(_FacilityModel) _then;

@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? type = null,Object? createdAt = null,}) {
  return _then(_FacilityModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}
