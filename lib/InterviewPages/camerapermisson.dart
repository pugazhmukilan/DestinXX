import "package:camera/camera.dart";
import "package:destin/constants.dart";
import "package:flutter/material.dart";
import "package:permission_handler/permission_handler.dart";


class permission{
  void _checkPermission(BuildContext context) async {
  if (await Permission.camera.request().isGranted) {
    // Permission is granted
    // Initialize camera here
    try {
      List<CameraDescription> cameras = await availableCameras();
      CameraController cameraController =
          CameraController(cameras[0], ResolutionPreset.ultraHigh);
      await cameraController.initialize();
      // Add your camera handling logic here
      print('Camera permission is granted');
    } on CameraException catch (e) {
      if (e.code == "CameraAccessDenied") {
        print("User denied camera access.");
        showErrorDialog(context,"error", "User denied camera access.");
      } else {
        print("Handle other camera errors: ${e.code}");
        showErrorDialog(context,"error",
            "An error occurred: ${e.code}\nTry restarting the app");
      }
    } catch (e) {
      print("No camera found on the device: $e");
    }
  } else {
    // Permission denied
    // Handle the denial here, show a message to the user, or request again
    print('Camera permission is denied');
    showErrorDialog(context,"error", "error occured in the camera fetching.");
    
}}

}