

import 'package:flutter/material.dart';
import 'package:flutter_demo/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

const Icon defAvater = Icon(Icons.person, color: Colors.white,size: 40);

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider?>();
    return Stack(
      children: [
        Opacity(
          opacity: 0.1,
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
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('基本信息'),
            toolbarHeight: 40,
            titleTextStyle: const TextStyle(fontSize: 16.0, color: Colors.black54),
            leading: IconButton(
              onPressed: () => context.pop(),
              hoverColor: Colors.transparent,
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Colors.black38,
              ),
            ),
            actions: [
              PopupMenuButton(
                position: PopupMenuPosition.over,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () => _showModalBottomSheet(context),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: 16
                          ),
                          SizedBox(width: 8),
                          Text(
                            '设置', 
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                        ],
                      )
                    ),
                    PopupMenuItem(
                      onTap: () => _showCustomDialog(context),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_alarm,
                            size: 16
                          ),
                          SizedBox(width: 8),
                          Text(
                            '设置', 
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                        ],
                      )
                    )
                  ];
                },
              )
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
          body: _getMainLayout([
            Row(
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
                  onPressed: () => context.pushNamed('use_info'),
                  icon: Icon(
                    Icons.chevron_right,
                    size: 24,
                    color: Colors.black45,
                  )
                )
              ]
            )
          ]),
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
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // 让底部面板的圆角只出现在顶部
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          // 给面板内容一些内边距
          padding: const EdgeInsets.all(20),
          // 使用 ListView 来确保内容过长时可以滚动
          child: Column(
            // 使用 MainAxisSize.min 让 Column 的高度适应内容
            mainAxisSize: MainAxisSize.min, 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '选择一个操作',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('分享'),
                onTap: () {
                  Navigator.pop(context); // 关闭面板
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('分享功能被点击了')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.bookmark_border),
                title: const Text('收藏'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('收藏功能被点击了')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('删除', style: TextStyle(color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('删除功能被点击了')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero, 
          backgroundColor: Colors.transparent,
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '添加备注',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // 在 Dialog 中添加任何你想要的 Widget
                const TextField(
                  decoration: InputDecoration(
                    labelText: '请输入备注内容',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('取消'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // 获取输入框的值...
                        context.pop();
                      },
                      child: const Text('确定'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}