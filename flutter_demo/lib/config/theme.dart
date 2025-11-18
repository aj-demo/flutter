

import 'package:flutter/material.dart';


final themeData = ThemeData(
  // 使用 Material3
  useMaterial3: true,
  
  // 亮度设置为浅色
  brightness: Brightness.light,
  
  // 主色调和颜色方案
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xFFFF6D00), // 橙色 - 主色
    onPrimary: Colors.white, // 主色上的文本颜色
    primaryContainer: Color(0xFFFFE0B2), // 橙色容器
    onPrimaryContainer: Color(0xFFBF360C), // 橙色容器上的文本颜色
    secondary: Color(0xFFFF8F00), // 深橙色 - 次要色
    onSecondary: Colors.white, // 次要色上的文本颜色
    secondaryContainer: Color(0xFFFFCC80), // 深橙色容器
    onSecondaryContainer: Color(0xFFE65100), // 深橙色容器上的文本颜色
    tertiary: Color(0xFFFFAB40), // 浅橙色 - 第三色
    onTertiary: Colors.black, // 第三色上的文本颜色
    surface: Color(0xFFFFF8E1), // 表面颜色 - 淡黄色背景
    onSurface: Color(0xFFBF360C), // 表面颜色上的文本颜色
    error: Color(0xFFB71C1C), // 错误颜色
    onError: Colors.white, // 错误颜色上的文本颜色
    outline: Color(0xFFBF360C), // 边框颜色
    outlineVariant: Color(0xFFBF360C), // 变体边框颜色
    shadow: Color(0xFFBF360C), // 阴影颜色
  ),
  
  // 应用栏主题
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFF6D00), // 背景色
    foregroundColor: Colors.white, // 前景色
    elevation: 0, // 阴影高度
    iconTheme: IconThemeData(color: Colors.white), // 图标主题
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  
  // 卡片主题
  cardTheme: CardThemeData(
    color: Colors.white, // 卡片颜色
    elevation: 2, // 阴影高度
    shadowColor: const Color(0xFFFF6D00).withValues(alpha: 0.2), // 阴影颜色
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // 圆角
    ),
  ),
  
  // 按钮主题
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFF6D00), // 背景色
      foregroundColor: Colors.white, // 前景色
      elevation: 2, // 阴影高度
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // 圆角
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // 内边距
    ),
  ),
  
  // 文本按钮主题
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFFFF6D00), // 前景色
      textStyle: TextStyle(
        fontWeight: FontWeight.bold, // 字体粗细
        decoration: TextDecoration.underline, // 下划线
      ),
    ),
  ),
  
  // 输入框主题
  inputDecorationTheme: InputDecorationTheme(
    filled: true, // 填充背景
    fillColor: Colors.white, // 填充颜色
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: Colors.grey.shade300, // 边框颜色
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: Colors.grey.shade300, // 边框颜色
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: const Color(0xFFFF6D00), // 聚焦时边框颜色
        width: 2, // 边框宽度
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: Colors.red, // 错误时边框颜色
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: Colors.red, // 聚焦且错误时边框颜色
        width: 2, // 边框宽度
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade500, // 提示文本颜色
    ),
    labelStyle: TextStyle(
      color: Colors.grey.shade700, // 标签文本颜色
    ),
  ),
  
  // 底部导航栏主题
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white, // 背景色
    selectedItemColor: Color(0xFFFF6D00), // 选中项颜色
    unselectedItemColor: Colors.grey, // 未选中项颜色
    type: BottomNavigationBarType.fixed, // 类型
    elevation: 0, // 阴影高度
  ),
  
  // 标签主题
  chipTheme: ChipThemeData(
    backgroundColor: Colors.white, // 背景色
    deleteIconColor: const Color(0xFFFF6D00), // 删除图标颜色
    disabledColor: Colors.grey.shade200, // 禁用颜色
    selectedColor: const Color(0xFFFF6D00), // 选中颜色
    secondarySelectedColor: const Color(0xFFFF8F00).withValues(alpha: 0.2), // 次要选中颜色
    shadowColor: Colors.transparent, // 阴影颜色
    selectedShadowColor: Colors.transparent, // 选中阴影颜色
    checkmarkColor: Colors.white, // 选中标记颜色
    labelStyle: TextStyle(
      color: Colors.grey.shade700, // 标签文本颜色
    ),
    secondaryLabelStyle: TextStyle(
      color: Colors.white, // 次要标签文本颜色
    ),
    brightness: Brightness.light, // 亮度
    elevation: 0, // 阴影高度
    pressElevation: 0, // 按下阴影高度
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // 内边距
    labelPadding: const EdgeInsets.symmetric(horizontal: 8), // 标签内边距
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // 圆角
    ),
    side: BorderSide(
      color: Colors.grey.shade300, // 边框颜色
    ),
  ),
  
  // 文本主题
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFFBF360C),
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Color(0xFFBF360C),
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFFBF360C),
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFFBF360C),
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFFBF360C),
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFFBF360C),
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFFBF360C),
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Color(0xFFBF360C),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFFBF360C),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xFFBF360C),
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Color(0xFFBF360C),
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFF6D00),
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xFFFF6D00),
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Color(0xFFFF6D00),
    ),
  ),
  
  // 图标主题
  iconTheme: const IconThemeData(
    color: Color(0xFFFF6D00), // 颜色
    size: 24, // 大小
  ),
  
  // 浮动操作按钮主题
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF6D00), // 背景色
    foregroundColor: Colors.white, // 前景色
    elevation: 4, // 阴影高度
    highlightElevation: 8, // 高亮阴影高度
    disabledElevation: 0, // 禁用阴影高度
  ),
  
  // 分割线主题
  dividerTheme: DividerThemeData(
    color: Color(0xFFBF360C).withValues(alpha: 0.2), // 颜色
    thickness: 1, // 厚度
    space: 1, // 间距
  ),
  
  
  // 滑动条主题
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(const Color(0xFFFF6D00).withValues(alpha: 0.5)), // 拇指颜色
    trackColor: WidgetStateProperty.all(const Color(0xFFFF6D00).withValues(alpha: 0.1)), // 轨道颜色
    thickness: WidgetStateProperty.all(6), // 厚度
    radius: const Radius.circular(3), // 圆角
  ),
  
  // 工具提示主题
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: Color(0xFFFF6D00), // 背景色
      borderRadius: BorderRadius.all(Radius.circular(4)), // 圆角
    ),
    textStyle: TextStyle(
      color: Colors.white, // 文本颜色
      fontSize: 12, // 字体大小
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), // 内边距
  ),
);

  // 构建深色主题
final dartThemeData = ThemeData(
  // 使用 Material3
  useMaterial3: true,
  
  // 亮度设置为深色
  brightness: Brightness.dark,
  
  // 主色调和颜色方案
  colorScheme: ColorScheme.dark(
    primary: Color(0xFFFF8F00), // 橙色 - 主色 (比浅色主题稍亮)
    onPrimary: Colors.black, // 主色上的文本颜色
    primaryContainer: Color(0xFFFF6D00).withValues(alpha: 0.2), // 橙色容器
    onPrimaryContainer: Color(0xFFFFE0B2), // 橙色容器上的文本颜色
    secondary: Color(0xFFFFAB40), // 浅橙色 - 次要色 (比浅色主题稍亮)
    onSecondary: Colors.black, // 次要色上的文本颜色
    secondaryContainer: Color(0xFFFF8F00).withValues(alpha: 0.2), // 深橙色容器
    onSecondaryContainer: Color(0xFFFFCC80), // 深橙色容器上的文本颜色
    tertiary: Color(0xFFFFCC80), // 浅橙色 - 第三色 (比浅色主题稍暗)
    onTertiary: Colors.black, // 第三色上的文本颜色
    surface: Color(0xFF1F1F1F), // 表面颜色 - 深灰色
    onSurface: Color(0xFFE0E0E0), // 表面颜色上的文本颜色
    error: Color(0xFFB71C1C), // 错误颜色
    onError: Colors.white, // 错误颜色上的文本颜色
    outline: Color(0xFFBF360C).withValues(alpha: 0.3), // 边框颜色 (降低透明度)
    outlineVariant: Color(0xFFBF360C).withValues(alpha: 0.1), // 变体边框颜色 (降低透明度)
    shadow: Color(0xFFBF360C).withValues(alpha: 0.3), // 阴影颜色 (降低透明度)
  ),
  
  // 应用栏主题
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1F1F1F), // 背景色 (深色)
    foregroundColor: Color(0xFFFF8F00), // 前景色 (橙色)
    elevation: 0, // 阴影高度
    iconTheme: IconThemeData(color: Color(0xFFFF8F00)), // 图标主题
    titleTextStyle: TextStyle(
      color: Color(0xFFFF8F00),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  
  // 卡片主题
  cardTheme: CardThemeData(
    color: Color(0xFF2F2F2F), // 卡片颜色 (深灰色)
    elevation: 2, // 阴影高度
    shadowColor: const Color(0xFFFF8F00).withValues(alpha: 0.2), // 阴影颜色 (橙色透明)
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // 圆角
    ),
  ),
  
  // 按钮主题
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFF8F00), // 背景色 (橙色)
      foregroundColor: Colors.black, // 前景色 (黑色)
      elevation: 2, // 阴影高度
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // 圆角
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // 内边距
    ),
  ),
  
  // 文本按钮主题
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFFFF8F00), // 前景色 (橙色)
      textStyle: TextStyle(
        fontWeight: FontWeight.bold, // 字体粗细
        decoration: TextDecoration.underline, // 下划线
      ),
    ),
  ),
  
  // 输入框主题
  inputDecorationTheme: InputDecorationTheme(
    filled: true, // 填充背景
    fillColor: Color(0xFF2F2F2F), // 填充颜色 (深灰色)
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: Colors.grey.shade700, // 边框颜色 (深灰色)
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: Colors.grey.shade700, // 边框颜色 (深灰色)
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: const Color(0xFFFF8F00), // 聚焦时边框颜色 (橙色)
        width: 2, // 边框宽度
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: Colors.red, // 错误时边框颜色
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // 圆角
      borderSide: BorderSide(
        color: Colors.red, // 聚焦且错误时边框颜色
        width: 2, // 边框宽度
      ),
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade400, // 提示文本颜色 (浅灰色)
    ),
    labelStyle: TextStyle(
      color: Colors.grey.shade300, // 标签文本颜色 (中灰色)
    ),
  ),
  
  // 底部导航栏主题
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1F1F1F), // 背景色 (深灰色)
    selectedItemColor: Color(0xFFFF8F00), // 选中项颜色 (橙色)
    unselectedItemColor: Colors.grey, // 未选中项颜色 (中灰色)
    type: BottomNavigationBarType.fixed, // 类型
    elevation: 0, // 阴影高度
  ),
  // 标签主题
  chipTheme: ChipThemeData(
    backgroundColor: Color(0xFF2F2F2F), // 背景色 (深灰色)
    deleteIconColor: const Color(0xFFFF8F00), // 删除图标颜色 (橙色)
    disabledColor: Colors.grey.shade800, // 禁用颜色 (深灰色)
    selectedColor: const Color(0xFFFF8F00), // 选中颜色 (橙色)
    secondarySelectedColor: const Color(0xFFFFAB40).withValues(alpha: 0.2), // 次要选中颜色 (浅橙色透明)
    shadowColor: Colors.transparent, // 阴影颜色
    selectedShadowColor: Colors.transparent, // 选中阴影颜色
    checkmarkColor: Colors.black, // 选中标记颜色
    labelStyle: TextStyle(
      color: Colors.grey.shade300, // 标签文本颜色 (中灰色)
    ),
    secondaryLabelStyle: TextStyle(
      color: Colors.black, // 次要标签文本颜色
    ),
    brightness: Brightness.dark, // 亮度
    elevation: 0, // 阴影高度
    pressElevation: 0, // 按下阴影高度
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // 内边距
    labelPadding: const EdgeInsets.symmetric(horizontal: 8), // 标签内边距
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16), // 圆角
    ),
    side: BorderSide(
      color: Colors.grey, // 边框颜色 (深灰色)
    ),
  ),
  
  // 文本主题
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFCC80),
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFCC80),
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color(0xFFFFCC80),
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFCC80),
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFCC80),
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFCC80),
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFCC80),
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFCC80),
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: Color(0xFFE0E0E0),
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Color(0xFFBDBDBD),
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: Color(0xFF9E9E9E),
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xFFFF8F00),
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xFFFF8F00),
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: Color(0xFFFF8F00),
    ),
  ),
  
  // 图标主题
  iconTheme: const IconThemeData(
    color: Color(0xFFFF8F00), // 颜色 (橙色)
    size: 24, // 大小
  ),
  
  // 浮动操作按钮主题
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFFF8F00), // 背景色 (橙色)
    foregroundColor: Colors.black, // 前景色 (黑色)
    elevation: 4, // 阴影高度
    highlightElevation: 8, // 高亮阴影高度
    disabledElevation: 0, // 禁用阴影高度
  ),
  
  // 分割线主题
  dividerTheme: const DividerThemeData(
    color: Color(0xFF424242), // 颜色 (深灰色)
    thickness: 1, // 厚度
    space: 1, // 间距
  ),
  
  // 滑动条主题
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(const Color(0xFFFF8F00).withValues(alpha: 0.5)), // 拇指颜色 (橙色透明)
    trackColor: WidgetStateProperty.all(const Color(0xFFFF8F00).withValues(alpha: 0.1)), // 轨道颜色 (橙色透明)
    thickness: WidgetStateProperty.all(6), // 厚度
    radius: const Radius.circular(3), // 圆角
  ),
  
  // 工具提示主题
  tooltipTheme: const TooltipThemeData(
    decoration: BoxDecoration(
      color: Color(0xFFFF8F00), // 背景色 (橙色)
      borderRadius: BorderRadius.all(Radius.circular(4)), // 圆角
    ),
    textStyle: TextStyle(
      color: Colors.black, // 文本颜色 (黑色)
      fontSize: 12, // 字体大小
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), // 内边距
  ),
);