import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<String>> usersInChat(UsersInChatRef ref) async* {
  // Aquí puedes implementar la lógica para obtener la lista de usuarios en el chat
  // y emitirla a través del stream
  final names = <String>[];
  await for (final name in RandomGenerator.randomNameStream()) {
    names.add(name);
    yield names;
  }
  
}
