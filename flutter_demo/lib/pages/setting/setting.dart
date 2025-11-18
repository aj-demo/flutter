

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_demo/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const Icon defAvater = Icon(Icons.person, color: Colors.white,size: 40);

class PageSetting extends HookConsumerWidget {
  const PageSetting({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final opacity = useState(0.0);
    
    final py = useState(0.0);
    final dropdownCtr = useAnimationController(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 500),
      animationBehavior: AnimationBehavior.preserve,
    );

    final ropdownTween = useAnimation(Tween<double>(begin: 0, end: 100).animate(dropdownCtr));

    return Stack(
      children: [
        AnimatedOpacity(
          opacity: opacity.value,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeOut,
          child: Container(
            height: 64,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            )
          ),
        ),
        // Opacity(
        //   opacity: 0.1,
        //   child: 
        // ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text('设置'),
            toolbarHeight: 40,
            titleTextStyle: const TextStyle(fontSize: 16.0, color: Colors.black54),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_accessibility),
                onPressed: () {
                  // 调用登出方法
                },
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          drawer: Drawer(
            child: Center(
              child: Text('侧边栏内容'),
            ),
          ),
          endDrawer: Drawer(
            child: Center(
              child: Text('侧边栏内容xxx'),
            ),
          ),
          body: GestureDetector(
            onPanStart: (details) {
              // dropdownCtr.stop();R
              // dropdownCtr.reset();
            },
            onPanUpdate: (details) {
              // details.delta 表示自上次事件以来，指针移动的物理偏移量
              // 我们把这个偏移量加到当前盒子的位置上
              py.value = py.value + details.delta.dy;
              print("${py.value}");
            },
            // 可选：当手指离开屏幕时，可以在这里添加惯性逻辑（更复杂）
            onPanEnd: (details) {
              // final double dySpead = details.velocity.pixelsPerSecond.dy;
              // if (dySpead == 0.0) {
              //   return;
              // }
              
            },
            child: Transform.translate(
              offset: Offset(0, py.value),
              child: Container(
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: Scrollable(
                  controller: ScrollController(),
                  axisDirection:  AxisDirection.down,
                  physics: const BouncingScrollPhysics(),
                  viewportBuilder: (BuildContext context, ViewportOffset position) {
                    return LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          children: [
                            Text('${dropdownCtr.value}'),
                            IconButton(
                              onPressed: () => dropdownCtr.isCompleted ? dropdownCtr.reverse() : dropdownCtr.forward(),
                              icon: Icon(Icons.ad_units)
                            ),
                          ]
                        );
                      }
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _getMainLayout(children) {
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
  }
  Widget _getUserInfoCard(BuildContext context) {
    final authProvider = context.read<AuthProvider?>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getAvater(authProvider?.user?.avatar),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    Text(
                      authProvider?.user?.displayName ?? "未知",
                      style: TextStyle(
                        fontSize: 16.0,
                        height: 1,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "高级会员",
                      style: TextStyle(
                        fontSize: 12,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
              ],
            )
          ],
        ),
        IconButton(
          onPressed: () => context.pushNamed('user_info'),
          icon: Icon(
            Icons.chevron_right,
            size: 24,
            color: Colors.black45,
          )
        )
      ]
    );
  }
  Widget _getAvater(avatar) {
    return ClipOval(
      child: Container(
        color: Colors.grey[300],
        width: 48,
        height: 48,
        child: avatar != null
        ? Image.network(
          avatar as String,
          width: 48,
          height: 48,
          errorBuilder: (context, error, stackTrace) => defAvater
        )
        : defAvater,
      ),
    );
  }
}
