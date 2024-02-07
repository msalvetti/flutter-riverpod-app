import 'package:riverpod_annotation/riverpod_annotation.dart';
// voy a crear un provider que me permita exponer el texto de hello world
// para que pueda ser consumido por cualquier widget que lo necesite

part 'hello_world_provider.g.dart';

@riverpod
String helloWorld (HelloWorldRef ref) {
   return "Hello World!";
}