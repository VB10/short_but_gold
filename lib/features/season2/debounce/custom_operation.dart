import 'package:async/async.dart';

class CancelableCustomOperation<T> {
  CancelableOperation<T?>? _cancellableOperation;
  final _delayTime = const Duration(milliseconds: 300);
  final void Function(T value) onChanged;
  T? data;
  CancelableCustomOperation(
    this.onChanged, {
    this.data,
  }) {
    _init();
  }

  void _init() {
    _cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(_delayTime, () {
        if (data == null) return null;
        return data;
      }),
      onCancel: () {
        _cancellableOperation = null;
      },
    );
  }

  Future<void> onItemChanged(T value) async {
    await _cancellableOperation?.cancel();
    data = value;
    _init();
    final response = await _cancellableOperation?.value;
    if (response == null) return;
    onChanged(response);
  }
}
