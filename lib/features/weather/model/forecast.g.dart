// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastImpl _$$ForecastImplFromJson(Map<String, dynamic> json) =>
    _$ForecastImpl(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      image: json['image'] as String,
      maxTemp: (json['maxTemp'] as num?)?.toDouble(),
      minTemp: (json['minTemp'] as num?)?.toDouble(),
      weatherType: json['weatherType'] as String,
      hour: json['hour'] as String?,
      day: json['day'] as String?,
    );

Map<String, dynamic> _$$ForecastImplToJson(_$ForecastImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'image': instance.image,
      'maxTemp': instance.maxTemp,
      'minTemp': instance.minTemp,
      'weatherType': instance.weatherType,
      'hour': instance.hour,
      'day': instance.day,
    };
