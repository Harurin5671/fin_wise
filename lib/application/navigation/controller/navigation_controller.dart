abstract class NavigationController {
  int get currentIndex;
  Stream<int> get indexStream;
  void changeIndex(int index);
}
