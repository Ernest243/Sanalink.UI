
part of 'staff_user_model.dart';


T _$identity<T>(T value) => value;


mixin _$StaffUserModel {

@JsonKey(name: 'sub') String get id; String get email; String get role; String get fullName; String? get department;@JsonKey(fromJson: _parseInt) int? get facilityId;

@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffUserModelCopyWith<StaffUserModel> get copyWith => _$StaffUserModelCopyWithImpl<StaffUserModel>(this as StaffUserModel, _$identity);

  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.department, department) || other.department == department)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,fullName,department,facilityId);

@override
String toString() {
  return 'StaffUserModel(id: $id, email: $email, role: $role, fullName: $fullName, department: $department, facilityId: $facilityId)';
}


}


abstract mixin class $StaffUserModelCopyWith<$Res>  {
  factory $StaffUserModelCopyWith(StaffUserModel value, $Res Function(StaffUserModel) _then) = _$StaffUserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sub') String id, String email, String role, String fullName, String? department,@JsonKey(fromJson: _parseInt) int? facilityId
});




}

class _$StaffUserModelCopyWithImpl<$Res>
    implements $StaffUserModelCopyWith<$Res> {
  _$StaffUserModelCopyWithImpl(this._self, this._then);

  final StaffUserModel _self;
  final $Res Function(StaffUserModel) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? role = null,Object? fullName = null,Object? department = freezed,Object? facilityId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,facilityId: freezed == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


extension StaffUserModelPatterns on StaffUserModel {


@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffUserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffUserModel value)  $default,){
final _that = this;
switch (_that) {
case _StaffUserModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _StaffUserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sub')  String id,  String email,  String role,  String fullName,  String? department, @JsonKey(fromJson: _parseInt)  int? facilityId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffUserModel() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.fullName,_that.department,_that.facilityId);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sub')  String id,  String email,  String role,  String fullName,  String? department, @JsonKey(fromJson: _parseInt)  int? facilityId)  $default,) {final _that = this;
switch (_that) {
case _StaffUserModel():
return $default(_that.id,_that.email,_that.role,_that.fullName,_that.department,_that.facilityId);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sub')  String id,  String email,  String role,  String fullName,  String? department, @JsonKey(fromJson: _parseInt)  int? facilityId)?  $default,) {final _that = this;
switch (_that) {
case _StaffUserModel() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.fullName,_that.department,_that.facilityId);case _:
  return null;

}
}

}


@JsonSerializable()

class _StaffUserModel implements StaffUserModel {
  const _StaffUserModel({@JsonKey(name: 'sub') required this.id, required this.email, required this.role, required this.fullName, this.department, @JsonKey(fromJson: _parseInt) this.facilityId});
  factory _StaffUserModel.fromJson(Map<String, dynamic> json) => _$StaffUserModelFromJson(json);

/// Mappé depuis le claim 'sub'
@override@JsonKey(name: 'sub') final  String id;
@override final  String email;
@override final  String role;
@override final  String fullName;
@override final  String? department;
@override@JsonKey(fromJson: _parseInt) final  int? facilityId;


@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffUserModelCopyWith<_StaffUserModel> get copyWith => __$StaffUserModelCopyWithImpl<_StaffUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffUserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.department, department) || other.department == department)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,fullName,department,facilityId);

@override
String toString() {
  return 'StaffUserModel(id: $id, email: $email, role: $role, fullName: $fullName, department: $department, facilityId: $facilityId)';
}


}


abstract mixin class _$StaffUserModelCopyWith<$Res> implements $StaffUserModelCopyWith<$Res> {
  factory _$StaffUserModelCopyWith(_StaffUserModel value, $Res Function(_StaffUserModel) _then) = __$StaffUserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sub') String id, String email, String role, String fullName, String? department,@JsonKey(fromJson: _parseInt) int? facilityId
});




}

class __$StaffUserModelCopyWithImpl<$Res>
    implements _$StaffUserModelCopyWith<$Res> {
  __$StaffUserModelCopyWithImpl(this._self, this._then);

  final _StaffUserModel _self;
  final $Res Function(_StaffUserModel) _then;

@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? role = null,Object? fullName = null,Object? department = freezed,Object? facilityId = freezed,}) {
  return _then(_StaffUserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,facilityId: freezed == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

