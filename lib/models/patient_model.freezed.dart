part of 'patient_model.dart';

T _$identity<T>(T value) => value;

mixin _$PatientModel {

 int get id; String get firstName; String? get middleName; String get lastName; String get fullName; DateTime get dateOfBirth; String get gender; String? get phone; String? get email; int get facilityId; DateTime get createdAt;
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatientModelCopyWith<PatientModel> get copyWith => _$PatientModelCopyWithImpl<PatientModel>(this as PatientModel, _$identity);

  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatientModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,middleName,lastName,fullName,dateOfBirth,gender,phone,email,facilityId,createdAt);

@override
String toString() {
  return 'PatientModel(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phone: $phone, email: $email, facilityId: $facilityId, createdAt: $createdAt)';
}


}

abstract mixin class $PatientModelCopyWith<$Res>  {
  factory $PatientModelCopyWith(PatientModel value, $Res Function(PatientModel) _then) = _$PatientModelCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String? middleName, String lastName, String fullName, DateTime dateOfBirth, String gender, String? phone, String? email, int facilityId, DateTime createdAt
});




}
class _$PatientModelCopyWithImpl<$Res>
    implements $PatientModelCopyWith<$Res> {
  _$PatientModelCopyWithImpl(this._self, this._then);

  final PatientModel _self;
  final $Res Function(PatientModel) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? middleName = freezed,Object? lastName = null,Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phone = freezed,Object? email = freezed,Object? facilityId = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


extension PatientModelPatterns on PatientModel {

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatientModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatientModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}


@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatientModel value)  $default,){
final _that = this;
switch (_that) {
case _PatientModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatientModel value)?  $default,){
final _that = this;
switch (_that) {
case _PatientModel() when $default != null:
return $default(_that);case _:
  return null;

}
}


@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String? middleName,  String lastName,  String fullName,  DateTime dateOfBirth,  String gender,  String? phone,  String? email,  int facilityId,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatientModel() when $default != null:
return $default(_that.id,_that.firstName,_that.middleName,_that.lastName,_that.fullName,_that.dateOfBirth,_that.gender,_that.phone,_that.email,_that.facilityId,_that.createdAt);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String? middleName,  String lastName,  String fullName,  DateTime dateOfBirth,  String gender,  String? phone,  String? email,  int facilityId,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PatientModel():
return $default(_that.id,_that.firstName,_that.middleName,_that.lastName,_that.fullName,_that.dateOfBirth,_that.gender,_that.phone,_that.email,_that.facilityId,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String? middleName,  String lastName,  String fullName,  DateTime dateOfBirth,  String gender,  String? phone,  String? email,  int facilityId,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PatientModel() when $default != null:
return $default(_that.id,_that.firstName,_that.middleName,_that.lastName,_that.fullName,_that.dateOfBirth,_that.gender,_that.phone,_that.email,_that.facilityId,_that.createdAt);case _:
  return null;

}
}

}

@JsonSerializable()

class _PatientModel implements PatientModel {
  const _PatientModel({required this.id, required this.firstName, this.middleName, required this.lastName, required this.fullName, required this.dateOfBirth, required this.gender, this.phone, this.email, required this.facilityId, required this.createdAt});
  factory _PatientModel.fromJson(Map<String, dynamic> json) => _$PatientModelFromJson(json);

@override final  int id;
@override final  String firstName;
@override final  String? middleName;
@override final  String lastName;
@override final  String fullName;
@override final  DateTime dateOfBirth;
@override final  String gender;
@override final  String? phone;
@override final  String? email;
@override final  int facilityId;
@override final  DateTime createdAt;

@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatientModelCopyWith<_PatientModel> get copyWith => __$PatientModelCopyWithImpl<_PatientModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatientModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatientModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.facilityId, facilityId) || other.facilityId == facilityId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,middleName,lastName,fullName,dateOfBirth,gender,phone,email,facilityId,createdAt);

@override
String toString() {
  return 'PatientModel(id: $id, firstName: $firstName, middleName: $middleName, lastName: $lastName, fullName: $fullName, dateOfBirth: $dateOfBirth, gender: $gender, phone: $phone, email: $email, facilityId: $facilityId, createdAt: $createdAt)';
}


}

abstract mixin class _$PatientModelCopyWith<$Res> implements $PatientModelCopyWith<$Res> {
  factory _$PatientModelCopyWith(_PatientModel value, $Res Function(_PatientModel) _then) = __$PatientModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String? middleName, String lastName, String fullName, DateTime dateOfBirth, String gender, String? phone, String? email, int facilityId, DateTime createdAt
});




}
class __$PatientModelCopyWithImpl<$Res>
    implements _$PatientModelCopyWith<$Res> {
  __$PatientModelCopyWithImpl(this._self, this._then);

  final _PatientModel _self;
  final $Res Function(_PatientModel) _then;

@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? middleName = freezed,Object? lastName = null,Object? fullName = null,Object? dateOfBirth = null,Object? gender = null,Object? phone = freezed,Object? email = freezed,Object? facilityId = null,Object? createdAt = null,}) {
  return _then(_PatientModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,facilityId: null == facilityId ? _self.facilityId : facilityId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}
