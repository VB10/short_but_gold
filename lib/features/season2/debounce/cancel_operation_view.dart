import 'package:flutter/material.dart';
import 'package:short_but_gold/features/season2/debounce/debounce_manager.dart';

class CancelOperationView extends StatefulWidget {
  const CancelOperationView({Key? key}) : super(key: key);
  @override
  State<CancelOperationView> createState() => _CancelOperationViewState();
}

class _CancelOperationViewState extends State<CancelOperationView> {
  late CancelableCustomOperation<bool> cancelableCustomOperation;

  bool _isLike = false;
  bool _isLoading = false;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cancelableCustomOperation = CancelableCustomOperation((value) {
      _controlService(value);
    });
  }

  Future<void> _controlService(bool value) async {
    _changeLoading();
    print('called it service $value');
    await Future.delayed(const Duration(seconds: 1));
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Changed is like');
          setState(() {
            _isLike = !_isLike;
          });
          cancelableCustomOperation.onItemChanged(_isLike);
        },
      ),
      appBar: AppBar(
        actions: [
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
        ],
      ),
      body: Center(
        child: Icon(
          Icons.favorite,
          size: kToolbarHeight,
          color: _isLike ? Colors.pink : Colors.grey,
        ),
      ),
    );
  }
}
