// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => _NoteModel(
  id: (json['id'] as num).toInt(),
  patientId: (json['patientId'] as num).toInt(),
  content: json['content'] as String,
  doctorName: json['doctorName'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$NoteModelToJson(_NoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientId': instance.patientId,
      'content': instance.content,
      'doctorName': instance.doctorName,
      'createdAt': instance.createdAt.toIso8601String(),
    };
