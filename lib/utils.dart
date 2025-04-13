import 'package:http/http.dart' as http;

void fetchUserActivuty(String username) async {
  final url = Uri.parse("https://api.github.com/users/$username/events");
  try {
    final res = await http.get(url);

    if (res.statusCode == 404) {
      print("User $username not found.");
      return;
    }

    print("Fetching $username's activity...");
    if (res.statusCode == 200) {
      print("User $username found.");
    } else {
      print("Error: ${res.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    return;
  }
}
