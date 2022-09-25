import 'package:flutter/material.dart';
import 'package:short_but_gold/features/season2/asset/image_asset.dart';
import 'package:short_but_gold/features/season2/debounce/custom_operation.dart';
import 'package:short_but_gold/features/season2/padd%C4%B1ng/page_padding.dart';

import '../launch/gallery_launch.dart';

class CancelOperationView extends StatefulWidget {
  const CancelOperationView({Key? key}) : super(key: key);
  @override
  State<CancelOperationView> createState() => _CancelOperationViewState();
}

class _CancelOperationViewState extends State<CancelOperationView> with GalleryLaunch {
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
    return Padding(
      padding: const PagePadding.onlyLeft(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Changed is like');
            setState(() {
              _isLike = !_isLike;
            });
            cancelableCustomOperation.onItemChanged(_isLike);

            showModalBottomSheet(
              context: context,
              builder: (context) => const Text('a'),
            );

            const CustomPage().show(context);
          },
        ),
        appBar: AppBar(
          actions: [
            Image.asset(ImageConstants.instance.appIcon),
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
      ),
    );
  }
}

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

extension CustomPageSheet on CustomPage {
  Future<T?> show<T>(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) => this);
  }
}
