import 'dart:async';

class BloC {
  final StreamController strOne = new StreamController();
  get steChange => strOne.sink.add;
  get str => strOne.stream;
  //
  final StreamController strTwo = new StreamController();
  get str2change => strTwo.sink.add;
  get str2 => strTwo.stream;
  dispose() {
    strOne.close();
    strTwo.close();
  }
}

BloC bloc = new BloC();
