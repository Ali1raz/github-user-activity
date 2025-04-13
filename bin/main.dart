import '../lib/utils.dart';

void main(List<String> args) async {
  if (args.isEmpty || args.length > 1) {
    print("Please provide a single argument.");
    print("Please provide a username.");
    print("Usage: dart run bin/main.dart ali-raza-fa22");
    return;
  }

  final username = args[0];
  fetchUserActivuty(username);
}
