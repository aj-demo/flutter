import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/global_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Upstairs extends HookConsumerWidget {
  final Widget child;
  final Widget? back;
  const Upstairs({super.key, required this.child, this.back});
  @override
  Widget build(BuildContext context, ref) {
    final upstairsChild =ref.watch(globalProvider.select((selector) => selector.upstairsChild));

    final (mediaQuery, width, height, padding) = useMemoized(() {
      final mediaQuery = MediaQuery.of(context);
      final width = mediaQuery.size.width;
      final height = mediaQuery.size.height;

      return (
        mediaQuery,
        width,
        height,
        mediaQuery.padding,
      );
    });

    final scrollCtr = useScrollController(
      initialScrollOffset: height,
    );
    final isAutoScrolling = useState(false);
    final isTopPageShow = useState(false);


    final scrollToTop = useCallback(() async {
      if (isTopPageShow.value || isAutoScrolling.value || upstairsChild == null) {
        return;
      }
      if (scrollCtr.offset < height) {
        isAutoScrolling.value = true;
        isTopPageShow.value = scrollCtr.offset < height - 128;
        await scrollCtr.animateTo(
          isTopPageShow.value ? 0 : height,
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
        
        isAutoScrolling.value = false;
      }
    }, [scrollCtr, upstairsChild]);

    final scrollToNormal = useCallback(() async {
      if (isAutoScrolling.value) {
        return;
      }
      isAutoScrolling.value = true;
      await scrollCtr.animateTo(
        height,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
      );
      isTopPageShow.value = false;
      isAutoScrolling.value = false;
    }, [scrollCtr]);

    final widgets = [
      Container(
        width: width,
        height: height,
        padding: EdgeInsets.fromLTRB(0, padding.top, 0, 0),
        color: Colors.orange,
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height - 64 - padding.top,
              child: upstairsChild ?? Text('no setting'),
            ),
            GestureDetector(
              onTap: () => scrollToNormal(),
              child: SizedBox(
                width: width,
                height: 64,
                child: back ?? Container(
                  color: Colors.black.withValues(alpha: 0.1),
                  child: Text(
                    "返回",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: width,
        height: height,
        padding: EdgeInsets.fromLTRB(0, padding.top, 0, 0),
        color: Colors.deepPurpleAccent,
        child: child,
      ),
    ];

    final physics = upstairsChild != null && isTopPageShow.value == false ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics();
    return Listener(
      onPointerUp: (onVerticalDragEnd) {
        Future.microtask(() => scrollToTop());
      },
      child: Stack(
        children: [
          Positioned(
            top: -1 * padding.top,
            bottom: -1 * padding.bottom,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.purple,
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (
                    upstairsChild != null
                    && isAutoScrolling.value == false
                    && notification is OverscrollNotification 
                    && notification.overscroll < 0) {
                    scrollCtr.jumpTo(scrollCtr.offset + notification.overscroll);
                  }
                  return false;
                },
                child: ListView.builder(
                  controller: scrollCtr,
                  physics: physics,
                  // itemExtent: height,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return widgets[index];
                  },
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}