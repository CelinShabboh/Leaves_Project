import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class MyAppController extends GetxController {
  @override
  Connectivity connectivity = Connectivity();
  void onInit() async {
    checkConnection();
    super.onInit();
  }

  void checkConnection() async {
    // ConnectivityStatus status =
    //     connectivitySerivce.getStatus(await connectivity.checkConnectivity());

    // connectivitySerivce.connectivityStatusController.add(status);
    // isOnline = status == ConnectivityStatus.ONLINE;

    // connectivitySerivce.connectivityStatusController.stream.listen((event) {
    //   isOnline = event == ConnectivityStatus.ONLINE;
    // });
  }
}
