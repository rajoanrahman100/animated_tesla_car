import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier{


  int selectedBottomNav=0;

  //Change the bottom nav while tap
  void onBottomNavigationTabChange(index){
    selectedBottomNav=index;
    notifyListeners();
  }

  bool isRightDoorLock=true;
  bool isLeftDoorLock=true;
  bool isTopDoorLock=true;
  bool isBottomDoorLock=true;

   updateRightDoorLock(){
    isRightDoorLock=!isRightDoorLock;
    notifyListeners();
  }

  updateLeftDoorLock(){
    isLeftDoorLock=!isLeftDoorLock;
    notifyListeners();
  }

  updateTopDoorLock(){
    isTopDoorLock=!isTopDoorLock;
    notifyListeners();
  }

  updateBottomDoorLock(){
    isBottomDoorLock=!isBottomDoorLock;
    notifyListeners();
  }


}