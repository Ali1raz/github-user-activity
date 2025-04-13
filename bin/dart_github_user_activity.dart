import 'dart:convert';

import 'package:http/http.dart' as http;

void main(List<String> args) async {
  if (args.isEmpty || args.length > 1) {
    print("Please provide a single argument.");
    print("Please provide posts count.");
    print("Usage: dart run bin/dart_github_user_activity.dart 3");
    return;
  }

  final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  final postsCount = int.tryParse(args[0]);
  print("You wanted $postsCount posts.");

  if (postsCount == null) {
    print("Please provide a valid number.");
    return;
  }
  if (postsCount > 7) {
    print("Cant be > 7.");
    return;
  } else if (postsCount < 1) {
    print("Cant be < 1.");
    return;
  }
  print("Fetching posts...");

  try {
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      List<dynamic> data = jsonDecode(resp.body);
      for (var item in data.take(postsCount)) {
        print("Title: ${item['title']}");
      }
    } else {
      print("Error: ${resp.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
