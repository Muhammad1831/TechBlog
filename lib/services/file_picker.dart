import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/file_picker_controller.dart';

FilePickerController filePickerController = Get.put(FilePickerController());

Future filePicker() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);

  if (result != null) {
    filePickerController.fileImage.value = result.files.first;
  }
}
