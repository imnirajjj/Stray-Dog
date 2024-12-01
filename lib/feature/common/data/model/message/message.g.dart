// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'message': instance.message,
    };

_$ConversationImpl _$$ConversationImplFromJson(Map<String, dynamic> json) =>
    _$ConversationImpl(
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      senderName: json['senderName'] as String,
      receiveName: json['receiveName'] as String,
    );

Map<String, dynamic> _$$ConversationImplToJson(_$ConversationImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'senderName': instance.senderName,
      'receiveName': instance.receiveName,
    };
