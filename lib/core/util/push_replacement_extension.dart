import 'package:go_router/go_router.dart';

extension GoRouterExtension on GoRouter{
  void clearStackAndNavigate(String location)async{
    while(canPop()){
      pop();
    }
   await pushReplacement(location);
  }
}

