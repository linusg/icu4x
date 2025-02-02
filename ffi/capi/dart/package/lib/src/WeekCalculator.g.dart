// generated by diplomat-tool

// https://github.com/dart-lang/sdk/issues/53946
// ignore_for_file: non_native_function_type_argument_to_pointer

part of 'lib.g.dart';

/// A Week calculator, useful to be passed in to `week_of_year()` on Date and DateTime types
///
/// See the [Rust documentation for `WeekCalculator`](https://docs.rs/icu/latest/icu/calendar/week/struct.WeekCalculator.html) for more information.
final class WeekCalculator implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _underlying;

  WeekCalculator._(this._underlying) {
    _finalizer.attach(this, _underlying.cast());
  }

  static final _finalizer = ffi.NativeFinalizer(_capi('ICU4XWeekCalculator_destroy'));

  /// Creates a new [`WeekCalculator`] from locale data.
  ///
  /// See the [Rust documentation for `try_new`](https://docs.rs/icu/latest/icu/calendar/week/struct.WeekCalculator.html#method.try_new) for more information.
  ///
  /// Throws [Error] on failure.
  factory WeekCalculator(DataProvider provider, Locale locale) {
    final result = _ICU4XWeekCalculator_create(provider._underlying, locale._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return WeekCalculator._(result.union.ok);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XWeekCalculator_create =
    _capi<ffi.NativeFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>>('ICU4XWeekCalculator_create')
      .asFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true);

  /// Additional information: [1](https://docs.rs/icu/latest/icu/calendar/week/struct.WeekCalculator.html#structfield.first_weekday), [2](https://docs.rs/icu/latest/icu/calendar/week/struct.WeekCalculator.html#structfield.min_week_days)
  factory WeekCalculator.fromFirstDayOfWeekAndMinWeekDays(IsoWeekday firstWeekday, int minWeekDays) {
    final result = _ICU4XWeekCalculator_create_from_first_day_of_week_and_min_week_days(firstWeekday._underlying, minWeekDays);
    return WeekCalculator._(result);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XWeekCalculator_create_from_first_day_of_week_and_min_week_days =
    _capi<ffi.NativeFunction<ffi.Pointer<ffi.Opaque> Function(ffi.Int32, ffi.Uint8)>>('ICU4XWeekCalculator_create_from_first_day_of_week_and_min_week_days')
      .asFunction<ffi.Pointer<ffi.Opaque> Function(int, int)>(isLeaf: true);

  /// Returns the weekday that starts the week for this object's locale
  ///
  /// See the [Rust documentation for `first_weekday`](https://docs.rs/icu/latest/icu/calendar/week/struct.WeekCalculator.html#structfield.first_weekday) for more information.
  IsoWeekday get firstWeekday {
    final result = _ICU4XWeekCalculator_first_weekday(_underlying);
    return IsoWeekday.values.firstWhere((v) => v._underlying == result);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XWeekCalculator_first_weekday =
    _capi<ffi.NativeFunction<ffi.Int32 Function(ffi.Pointer<ffi.Opaque>)>>('ICU4XWeekCalculator_first_weekday')
      .asFunction<int Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true);

  /// The minimum number of days overlapping a year required for a week to be
  /// considered part of that year
  ///
  /// See the [Rust documentation for `min_week_days`](https://docs.rs/icu/latest/icu/calendar/week/struct.WeekCalculator.html#structfield.min_week_days) for more information.
  int get minWeekDays {
    final result = _ICU4XWeekCalculator_min_week_days(_underlying);
    return result;
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XWeekCalculator_min_week_days =
    _capi<ffi.NativeFunction<ffi.Uint8 Function(ffi.Pointer<ffi.Opaque>)>>('ICU4XWeekCalculator_min_week_days')
      .asFunction<int Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true);
}
