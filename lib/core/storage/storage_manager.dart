import 'package:get_storage/get_storage.dart';

class StorageManager {
  StorageManager._();
  static final GetStorage box = GetStorage();
  static saveData(String key, dynamic value) {
    box.write(key, value);
  }

  static removeData(String key) async {
    await box.remove(key);
  }

  static readData(String key) {
    return box.read(key);
  }

  static clearData() async {
    await box.erase(); // This clears all stored data
  }
}
