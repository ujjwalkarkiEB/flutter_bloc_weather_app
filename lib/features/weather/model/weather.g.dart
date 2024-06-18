// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      city: json['city'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      minTemp: (json['minTemp'] as num).toDouble(),
      icon: json['icon'] as String,
      humidity: (json['humidity'] as num).toDouble(),
      type: json['type'] as String,
      lastUpdated: json['lastUpdated'] as String,
      weeklyForecasts: (json['weeklyForecasts'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      hourlyForecasts: (json['hourlyForecasts'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'temperature': instance.temperature,
      'maxTemp': instance.maxTemp,
      'minTemp': instance.minTemp,
      'icon': instance.icon,
      'humidity': instance.humidity,
      'type': instance.type,
      'lastUpdated': instance.lastUpdated,
      'weeklyForecasts': instance.weeklyForecasts,
      'hourlyForecasts': instance.hourlyForecasts,
    };
