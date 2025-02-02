// generated by diplomat-tool

// https://github.com/dart-lang/sdk/issues/53946
// ignore_for_file: non_native_function_type_argument_to_pointer

part of 'lib.g.dart';

/// An ICU4X line-break segmenter, capable of finding breakpoints in strings.
///
/// See the [Rust documentation for `LineSegmenter`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html) for more information.
final class LineSegmenter implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _underlying;

  LineSegmenter._(this._underlying) {
    _finalizer.attach(this, _underlying.cast());
  }

  static final _finalizer = ffi.NativeFinalizer(_capi('ICU4XLineSegmenter_destroy'));

  /// Construct a [`LineSegmenter`] with default options. It automatically loads the best
  /// available payload data for Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_auto`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_auto) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.auto(DataProvider provider) {
    final result = _ICU4XLineSegmenter_create_auto(provider._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_create_auto =
    _capi<ffi.NativeFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>>('ICU4XLineSegmenter_create_auto')
      .asFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true);

  /// Construct a [`LineSegmenter`] with default options and LSTM payload data for
  /// Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_lstm`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_lstm) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.lstm(DataProvider provider) {
    final result = _ICU4XLineSegmenter_create_lstm(provider._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_create_lstm =
    _capi<ffi.NativeFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>>('ICU4XLineSegmenter_create_lstm')
      .asFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true);

  /// Construct a [`LineSegmenter`] with default options and dictionary payload data for
  /// Burmese, Khmer, Lao, and Thai..
  ///
  /// See the [Rust documentation for `new_dictionary`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_dictionary) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.dictionary(DataProvider provider) {
    final result = _ICU4XLineSegmenter_create_dictionary(provider._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_create_dictionary =
    _capi<ffi.NativeFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>>('ICU4XLineSegmenter_create_dictionary')
      .asFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true);

  /// Construct a [`LineSegmenter`] with custom options. It automatically loads the best
  /// available payload data for Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_auto_with_options`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_auto_with_options) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.autoWithOptionsV1(DataProvider provider, LineBreakOptionsV1 options) {
    final result = _ICU4XLineSegmenter_create_auto_with_options_v1(provider._underlying, options._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_create_auto_with_options_v1 =
    _capi<ffi.NativeFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsV1Ffi)>>('ICU4XLineSegmenter_create_auto_with_options_v1')
      .asFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsV1Ffi)>(isLeaf: true);

  /// Construct a [`LineSegmenter`] with custom options and LSTM payload data for
  /// Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_lstm_with_options`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_lstm_with_options) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.lstmWithOptionsV1(DataProvider provider, LineBreakOptionsV1 options) {
    final result = _ICU4XLineSegmenter_create_lstm_with_options_v1(provider._underlying, options._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_create_lstm_with_options_v1 =
    _capi<ffi.NativeFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsV1Ffi)>>('ICU4XLineSegmenter_create_lstm_with_options_v1')
      .asFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsV1Ffi)>(isLeaf: true);

  /// Construct a [`LineSegmenter`] with custom options and dictionary payload data for
  /// Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_dictionary_with_options`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_dictionary_with_options) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.dictionaryWithOptionsV1(DataProvider provider, LineBreakOptionsV1 options) {
    final result = _ICU4XLineSegmenter_create_dictionary_with_options_v1(provider._underlying, options._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_create_dictionary_with_options_v1 =
    _capi<ffi.NativeFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsV1Ffi)>>('ICU4XLineSegmenter_create_dictionary_with_options_v1')
      .asFunction<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsV1Ffi)>(isLeaf: true);

  /// Segments a (potentially ill-formed) UTF-8 string.
  ///
  /// See the [Rust documentation for `segment_utf8`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.segment_utf8) for more information.
  LineBreakIteratorUtf8 segmentUtf8(String input) {
    final alloc = ffi2.Arena();
    final inputSlice = _SliceFfi2Utf8._fromDart(input, alloc);
    final result = _ICU4XLineSegmenter_segment_utf8(_underlying, inputSlice._bytes, inputSlice._length);
    alloc.releaseAll();
    return LineBreakIteratorUtf8._(result);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_segment_utf8 =
    _capi<ffi.NativeFunction<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi2.Utf8>, ffi.Size)>>('ICU4XLineSegmenter_segment_utf8')
      .asFunction<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi2.Utf8>, int)>(isLeaf: true);

  /// Segments a UTF-16 string.
  ///
  /// See the [Rust documentation for `segment_utf16`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.segment_utf16) for more information.
  LineBreakIteratorUtf16 segmentUtf16(Uint16List input) {
    final alloc = ffi2.Arena();
    final inputSlice = _SliceFfiUint16._fromDart(input, alloc);
    final result = _ICU4XLineSegmenter_segment_utf16(_underlying, inputSlice._bytes, inputSlice._length);
    alloc.releaseAll();
    return LineBreakIteratorUtf16._(result);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_segment_utf16 =
    _capi<ffi.NativeFunction<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Uint16>, ffi.Size)>>('ICU4XLineSegmenter_segment_utf16')
      .asFunction<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Uint16>, int)>(isLeaf: true);

  /// Segments a Latin-1 string.
  ///
  /// See the [Rust documentation for `segment_latin1`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.segment_latin1) for more information.
  LineBreakIteratorLatin1 segmentLatin1(Uint8List input) {
    final alloc = ffi2.Arena();
    final inputSlice = _SliceFfiUint8._fromDart(input, alloc);
    final result = _ICU4XLineSegmenter_segment_latin1(_underlying, inputSlice._bytes, inputSlice._length);
    alloc.releaseAll();
    return LineBreakIteratorLatin1._(result);
  }

  // ignore: non_constant_identifier_names
  static final _ICU4XLineSegmenter_segment_latin1 =
    _capi<ffi.NativeFunction<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Uint8>, ffi.Size)>>('ICU4XLineSegmenter_segment_latin1')
      .asFunction<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Uint8>, int)>(isLeaf: true);
}
