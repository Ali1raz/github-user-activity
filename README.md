A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`.

Same Solution for [github-user-activvity](https://roadmap.sh/projects/github-user-activity) chanllenge from [roadmap.sh](roadmap.sh)

## clone this project:

```bash
git clone https://github.com/ali-raza-fa22/github-user-activity.git
cd github-user-activity
dart pub get
```

## Pre-requisities:

```yaml
dependencies:
  http: ^0.13.0
```

and then run `dart pub get`.

This will also add dependency.

# Usage

```bash
dart run bin/main.dart <username>
```

## Example:

```bash
dart run bin/main.dart ali-raza-fa22
```

---

# Notes:

## GET API example

```dart
final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

  try {
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      List<dynamic> data = jsonDecode(resp.body);
      for (var item in data.take(5)) { // hardcoded 5
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
    print("Usage: dart run bin/main.dart 4");
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
  // FETCH POSTS

  for (var item in data.take(postsCount)) { // PRINT POSTS
        print("Title: ${item['title']}");
      }
}
```
