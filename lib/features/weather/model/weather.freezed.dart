// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  String get city => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  double get maxTemp => throw _privateConstructorUsedError;
  double get minTemp => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  double get humidity => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get lastUpdated => throw _privateConstructorUsedError;
  List<Forecast> get weeklyForecasts => throw _privateConstructorUsedError;
  List<Forecast> get hourlyForecasts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {String city,
      double temperature,
      double maxTemp,
      double minTemp,
      String icon,
      double humidity,
      String type,
      String lastUpdated,
      List<Forecast> weeklyForecasts,
      List<Forecast> hourlyForecasts});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? temperature = null,
    Object? maxTemp = null,
    Object? minTemp = null,
    Object? icon = null,
    Object? humidity = null,
    Object? type = null,
    Object? lastUpdated = null,
    Object? weeklyForecasts = null,
    Object? hourlyForecasts = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: null == maxTemp
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      minTemp: null == minTemp
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyForecasts: null == weeklyForecasts
          ? _value.weeklyForecasts
          : weeklyForecasts // ignore: cast_nullable_to_non_nullable
              as List<Forecast>,
      hourlyForecasts: null == hourlyForecasts
          ? _value.hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<Forecast>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String city,
      double temperature,
      double maxTemp,
      double minTemp,
      String icon,
      double humidity,
      String type,
      String lastUpdated,
      List<Forecast> weeklyForecasts,
      List<Forecast> hourlyForecasts});
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? temperature = null,
    Object? maxTemp = null,
    Object? minTemp = null,
    Object? icon = null,
    Object? humidity = null,
    Object? type = null,
    Object? lastUpdated = null,
    Object? weeklyForecasts = null,
    Object? hourlyForecasts = null,
  }) {
    return _then(_$WeatherImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTemp: null == maxTemp
          ? _value.maxTemp
          : maxTemp // ignore: cast_nullable_to_non_nullable
              as double,
      minTemp: null == minTemp
          ? _value.minTemp
          : minTemp // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyForecasts: null == weeklyForecasts
          ? _value._weeklyForecasts
          : weeklyForecasts // ignore: cast_nullable_to_non_nullable
              as List<Forecast>,
      hourlyForecasts: null == hourlyForecasts
          ? _value._hourlyForecasts
          : hourlyForecasts // ignore: cast_nullable_to_non_nullable
              as List<Forecast>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  const _$WeatherImpl(
      {required this.city,
      required this.temperature,
      required this.maxTemp,
      required this.minTemp,
      required this.icon,
      required this.humidity,
      required this.type,
      required this.lastUpdated,
      required final List<Forecast> weeklyForecasts,
      required final List<Forecast> hourlyForecasts})
      : _weeklyForecasts = weeklyForecasts,
        _hourlyForecasts = hourlyForecasts;

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  final String city;
  @override
  final double temperature;
  @override
  final double maxTemp;
  @override
  final double minTemp;
  @override
  final String icon;
  @override
  final double humidity;
  @override
  final String type;
  @override
  final String lastUpdated;
  final List<Forecast> _weeklyForecasts;
  @override
  List<Forecast> get weeklyForecasts {
    if (_weeklyForecasts is EqualUnmodifiableListView) return _weeklyForecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyForecasts);
  }

  final List<Forecast> _hourlyForecasts;
  @override
  List<Forecast> get hourlyForecasts {
    if (_hourlyForecasts is EqualUnmodifiableListView) return _hourlyForecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyForecasts);
  }

  @override
  String toString() {
    return 'Weather(city: $city, temperature: $temperature, maxTemp: $maxTemp, minTemp: $minTemp, icon: $icon, humidity: $humidity, type: $type, lastUpdated: $lastUpdated, weeklyForecasts: $weeklyForecasts, hourlyForecasts: $hourlyForecasts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.maxTemp, maxTemp) || other.maxTemp == maxTemp) &&
            (identical(other.minTemp, minTemp) || other.minTemp == minTemp) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality()
                .equals(other._weeklyForecasts, _weeklyForecasts) &&
            const DeepCollectionEquality()
                .equals(other._hourlyForecasts, _hourlyForecasts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      city,
      temperature,
      maxTemp,
      minTemp,
      icon,
      humidity,
      type,
      lastUpdated,
      const DeepCollectionEquality().hash(_weeklyForecasts),
      const DeepCollectionEquality().hash(_hourlyForecasts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherImplToJson(
      this,
    );
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required final String city,
      required final double temperature,
      required final double maxTemp,
      required final double minTemp,
      required final String icon,
      required final double humidity,
      required final String type,
      required final String lastUpdated,
      required final List<Forecast> weeklyForecasts,
      required final List<Forecast> hourlyForecasts}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  String get city;
  @override
  double get temperature;
  @override
  double get maxTemp;
  @override
  double get minTemp;
  @override
  String get icon;
  @override
  double get humidity;
  @override
  String get type;
  @override
  String get lastUpdated;
  @override
  List<Forecast> get weeklyForecasts;
  @override
  List<Forecast> get hourlyForecasts;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
