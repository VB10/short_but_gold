import 'package:flutter/material.dart';

class InfiniteView extends StatefulWidget {
  const InfiniteView({Key? key}) : super(key: key);
  @override
  State<InfiniteView> createState() => _InfiniteViewState();
}

class _InfiniteViewState extends State<InfiniteView> {
  final List<String> _list = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
  final List<String> _list2 = ['x', 'y', 'z', 'w', 'v', 'u', 't'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(_list[index]),
            ),
          );
        },
      ).onLazyLoads(() async {
        await Future.delayed(const Duration(seconds: 4));
        setState(() {
          _list.addAll(_list2);
        });
      }),
    );
  }
}

extension ListViewExtension on ListView {
  // It will notify to each paging load
  // You should control the state for your widget
  Widget onLazyLoads(Future<void> Function() onPagingLoad, {Widget? itemLoadWidget}) {
    if (childrenDelegate is SliverChildListDelegate) throw Exception('You should use list view builder ');
    final delegate = childrenDelegate as SliverChildBuilderDelegate;
    final itemCount = delegate.childCount ?? 0;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
          onPagingLoad();
        }
        return true;
      },
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final childBuilder = delegate.builder(context, index) ?? const SizedBox.shrink();
          if (index == itemCount - 1) {
            return Column(
              children: [childBuilder, itemLoadWidget ?? const Center(child: CircularProgressIndicator())],
            );
          }
          return childBuilder;
        },
      ),
    );
  }
}
