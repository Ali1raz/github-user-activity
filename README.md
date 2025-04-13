A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# Usage

```dart
dart run
```

## GET example

```dart
final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  try {
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      List<dynamic> data = jsonDecode(resp.body);
      for (var item in data.take(5)) {
        print("Title: ${item['title']}");
      }
    } else {
      print("Error: ${resp.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }
```
