A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# Usage

```dart
dart run bin/main.dart ali-raza-fa22
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

## CLI args:

```dart
void main(List<String> args) async {
  if (args.isEmpty || args.length > 1) {
    print("Please provide a single argument.");
    print("Please provide posts count.");
    print("Usage: dart run bin/main.dart ali-raza-fa22");
    return;
  }

  // ...
  final postsCount = int.tryParse(args[0]);
  print("You wanted $postsCount posts.");

  if (postsCount == null) {
    print("Please provide a valid number.");
    return;
  }

  // ...

  for (var item in data.take(postsCount)) {
        print("Title: ${item['title']}");
      }
}
```
