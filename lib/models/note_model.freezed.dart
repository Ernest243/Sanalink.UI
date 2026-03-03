part of 'note_model.dart';

T _$identity<T>(T value) => value;

mixin _$NoteModel {

 int get id; int get patientId; String get authorId; String get content; DateTime get createdAt;
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteModelCopyWith<NoteModel> get copyWith => _$NoteModelCopyWithImpl<NoteModel>(this as NoteModel, _$identity);

  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,authorId,content,createdAt);

@override
String toString() {
  return 'NoteModel(id: $id, patientId: $patientId, authorId: $authorId, content: $content, createdAt: $createdAt)';
}


}

abstract mixin class $NoteModelCopyWith<$Res>  {
  factory $NoteModelCopyWith(NoteModel value, $Res Function(NoteModel) _then) = _$NoteModelCopyWithImpl;
@useResult
$Res call({
 int id, int patientId, String authorId, String content, DateTime createdAt
});




}
class _$NoteModelCopyWithImpl<$Res>
    implements $NoteModelCopyWith<$Res> {
  _$NoteModelCopyWithImpl(this._self, this._then);

  final NoteModel _self;
  final $Res Function(NoteModel) _then;

@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? patientId = null,Object? authorId = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


extension NoteModelPatterns on NoteModel {


@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteModel value)  $default,){
final _that = this;
switch (_that) {
case _NoteModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that);case _:
  return null;

}
}

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int patientId,  String authorId,  String content,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that.id,_that.patientId,_that.authorId,_that.content,_that.createdAt);case _:
  return orElse();

}
}


@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int patientId,  String authorId,  String content,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _NoteModel():
return $default(_that.id,_that.patientId,_that.authorId,_that.content,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}


@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int patientId,  String authorId,  String content,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _NoteModel() when $default != null:
return $default(_that.id,_that.patientId,_that.authorId,_that.content,_that.createdAt);case _:
  return null;

}
}

}

@JsonSerializable()

class _NoteModel implements NoteModel {
  const _NoteModel({required this.id, required this.patientId, required this.authorId, required this.content, required this.createdAt});
  factory _NoteModel.fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

@override final  int id;
@override final  int patientId;
@override final  String authorId;
@override final  String content;
@override final  DateTime createdAt;

@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteModelCopyWith<_NoteModel> get copyWith => __$NoteModelCopyWithImpl<_NoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.patientId, patientId) || other.patientId == patientId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,patientId,authorId,content,createdAt);

@override
String toString() {
  return 'NoteModel(id: $id, patientId: $patientId, authorId: $authorId, content: $content, createdAt: $createdAt)';
}


}

abstract mixin class _$NoteModelCopyWith<$Res> implements $NoteModelCopyWith<$Res> {
  factory _$NoteModelCopyWith(_NoteModel value, $Res Function(_NoteModel) _then) = __$NoteModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int patientId, String authorId, String content, DateTime createdAt
});




}
class __$NoteModelCopyWithImpl<$Res>
    implements _$NoteModelCopyWith<$Res> {
  __$NoteModelCopyWithImpl(this._self, this._then);

  final _NoteModel _self;
  final $Res Function(_NoteModel) _then;

@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? patientId = null,Object? authorId = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_NoteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,patientId: null == patientId ? _self.patientId : patientId // ignore: cast_nullable_to_non_nullable
as int,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

