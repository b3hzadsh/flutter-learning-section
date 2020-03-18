import 'dart:async';

class BloC {
  final StreamController strOne = new StreamController();
  get steChange => strOne.sink.add;
  get str => strOne.stream;

  dispose() {
    strOne.close();
  }
}

BloC bloc = new BloC();
