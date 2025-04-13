import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> fetchUserActivuty(String username) async {
  final url = Uri.parse("https://api.github.com/users/$username/events");
  try {
    final res = await http.get(url);

    if (res.statusCode == 404) {
      print("User $username not found.");
      return;
    }

    print("Fetching $username's activity...\n");
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      for (var event in data) {
        if (data is List && data.isNotEmpty) {
          final type = event['type'];
          final repo = event['repo']['name'];
          final createdAt = event['created_at'];
          printUserActivity(username, "$type on $repo at $createdAt");
        }
      }
    } else {
      print("Error: ${res.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
    return;
  }
}

void printUserActivity(String username, String activity) {
  print("$username's activity: $activity");
}
