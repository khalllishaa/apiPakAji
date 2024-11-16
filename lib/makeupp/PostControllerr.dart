import 'package:get/get.dart';
import 'package:apipakaji/makeupp/ApiServicee.dart';

class PostControllerr extends GetxController {
  var isLoading = true.obs;
  var registerStatus = ''.obs;

  Future<void> registerUser(String username, String password, String fullName, String email) async {
    try {
      isLoading(true);
      var response = await ApiServicee().register(username, password, fullName, email);

      // Sesuaikan dengan respons dari API
      registerStatus.value = response.status
          ? 'Registration successful: ${response.message}'
          : 'Registration failed: ${response.message}';
    } catch (e) {
      registerStatus.value = 'Registration failed: $e';
    } finally {
      isLoading(false);
    }
  }
}
