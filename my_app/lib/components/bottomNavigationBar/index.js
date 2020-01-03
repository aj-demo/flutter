/*
 * @Author: apathyjade <apathyjade@outlook.com>
 * @Version: 0.0.1
 * @Date: 2020-01-03 19:21:45
 * @Last Modified by:   apathyjade
 * @Last Modified Time: 2020-01-03 19:21:45
 */

class AjBottomNavigationBar extends StatefulWidget implements BottomNavigationBar  {
  @override
  AjBottomNavigationBarState createData () {
    return new AjBottomNavigationBarState();
  }
}
class AjBottomNavigationBarState extends State<AjBottomNavigationBar> {
  with SingleTickerProviderStateMixin {
    final PageController _pageController = new PageController(initialPage: 0);
    int _tabIndex = 0;
    _onPageChange(int index) {
      setState(() {
        _tabIndex = index;
      });
    }
    Widget build(BuildContext context) {
      return new BottomNavigationBar(
        fixedColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        currentIndex: 1,
        onTap: (index) {
          _onPageChange(index);
        },
        items: <BottomNavigationBarItem> [
          new BottomNavigationBarItem(
            icon: Icon(Icons.hotel),
            title: Text('首页'),
            activeIcon: Icon(Icons.hotel),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('搜索'),
            activeIcon: Icon(Icons.security),
          ),
        ],
      );
    }
  }
}