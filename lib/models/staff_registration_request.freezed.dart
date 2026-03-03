

part of 'staff_registration_request.dart';


T _$identity<T>(T value) => value;

mixin _$StaffRegistrationRequest {

 String get fullName; String get email; String get password; String get role; int get facilityId; String? get department;

@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StaffRegistrationRequestCopyWith<StaffRegistrationRequest> get copyWith => _$StaffRegistrationRequestCopyWithImpl<StaffRegistrationRequest>(this as StaffRegistrationRequest, _$identity);

  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StaffRegistrationRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,password,role,facilityId,department);

@override
String toString() {
  return 'StaffRegistrationRequest(fullName: $fullName, email: $email, password: $password, role: $role, facilityId: $facilityId, department: $department)';
}


}


abstract mixin class $StaffRegistrationRequestCopyWith<$Res>  {
  factory $StaffRegistrationRequestCopyWith(StaffRegistrationRequest value, $Res Function(StaffRegistrationRequest) _then) = _$StaffRegistrationRequestCopyWithImpl;
@useResult
$Res call({
 String fullName, String email, String password, String role, int facilityId, String? department
});




}

class _$StaffRegistrationRequestCopyWithImpl<$Res>
    implements $StaffRegistrationRequestCopyWith<$Res> {
  _$StaffRegistrationRequestCopyWithImpl(this._self, this._then);

  final StaffRegistrationRequest _self;
  final $Res Function(StaffRegistrationRequest) _then;


@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? email = null,Object? password = null,Object? role = null,Object? facilityId = null,Object? department = freezed,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName
as String,email: null == email ? _self.email : email
as String,password: null == password ? _self.password : password
as String,role: null == role ? _self.role : role
as String,facilityId: null == facilityId ? _self.facilityId : facilityId
as int,department: freezed == department ? _self.department : department
as String?,
  ));
}

}



extension StaffRegistrationRequestPatterns on StaffRegistrationRequest {

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StaffRegistrationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StaffRegistrationRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StaffRegistrationRequest value)  $default,){
final _that = this;
switch (_that) {
case _StaffRegistrationRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StaffRegistrationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _StaffRegistrationRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}


@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String email,  String password,  String role,  int facilityId,  String? department)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StaffRegistrationRequest() when $default != null:
return $default(_that.fullName,_that.email,_that.password,_that.role,_that.facilityId,_that.department);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String email,  String password,  String role,  int facilityId,  String? department)  $default,) {final _that = this;
switch (_that) {
case _StaffRegistrationRequest():
return $default(_that.fullName,_that.email,_that.password,_that.role,_that.facilityId,_that.department);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String email,  String password,  String role,  int facilityId,  String? department)?  $default,) {final _that = this;
switch (_that) {
case _StaffRegistrationRequest() when $default != null:
return $default(_that.fullName,_that.email,_that.password,_that.role,_that.facilityId,_that.department);case _:
  return null;

}
}

}


@JsonSerializable()

class _StaffRegistrationRequest implements StaffRegistrationRequest {
  const _StaffRegistrationRequest({required this.fullName, required this.email, required this.password, required this.role, required this.facilityId, this.department});
  factory _StaffRegistrationRequest.fromJson(Map<String, dynamic> json) => _$StaffRegistrationRequestFromJson(json);

@override final  String fullName;
@override final  String email;
@override final  String password;
@override final  String role;
@override final  int facilityId;
@override final  String? department;


@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StaffRegistrationRequestCopyWith<_StaffRegistrationRequest> get copyWith => __$StaffRegistrationRequestCopyWithImpl<_StaffRegistrationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StaffRegistrationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StaffRegistrationRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.department, department) || other.department == department));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,email,password,role,facilityId,department);

@override
String toString() {
  return 'StaffRegistrationRequest(fullName: $fullName, email: $email, password: $password, role: $role, facilityId: $facilityId, department: $department)';
}


}


abstract mixin class _$StaffRegistrationRequestCopyWith<$Res> implements $StaffRegistrationRequestCopyWith<$Res> {
  factory _$StaffRegistrationRequestCopyWith(_StaffRegistrationRequest value, $Res Function(_StaffRegistrationRequest) _then) = __$StaffRegistrationRequestCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String email, String password, String role, int facilityId, String? department
});




}

class __$StaffRegistrationRequestCopyWithImpl<$Res>
    implements _$StaffRegistrationRequestCopyWith<$Res> {
  __$StaffRegistrationRequestCopyWithImpl(this._self, this._then);

  final _StaffRegistrationRequest _self;
  final $Res Function(_StaffRegistrationRequest) _then;

@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? email = null,Object? password = null,Object? role = null,Object? facilityId = null,Object? department = freezed,}) {
  return _then(_StaffRegistrationRequest(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

