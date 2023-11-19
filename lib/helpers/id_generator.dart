import 'dart:math';

String generateID() {
  const String charSet =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final Random random = Random();

  String id = '';
  for (int i = 0; i < 6; i++) {
    final int randomIndex = random.nextInt(charSet.length);
    id += charSet[randomIndex];
  }

  return id;
}
