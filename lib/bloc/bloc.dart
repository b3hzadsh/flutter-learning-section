import 'dart:async';
import 'package:rxdart/rxdart.dart';

class BloC {
  final StreamController strOne = new StreamController.broadcast();
  get steChange => strOne.sink.add;
  get str => strOne.stream;
  //
  final BehaviorSubject streamMoney = new BehaviorSubject();
  get money => streamMoney.stream;
  get changeMoney => streamMoney.sink.add;
  //
  final BehaviorSubject streamBenefit = new BehaviorSubject();
  get benefit => streamBenefit.stream;
  get changeBenefit => streamBenefit.sink.add;
  //
  final BehaviorSubject streamTime = new BehaviorSubject();
  get time => streamTime.stream;
  get changeTime => streamTime.sink.add;
  // Stream<bool> get submitValid = Stream.CombineLatestStream
  //CombineLatestStreamCombineLatestStream

  Stream<bool> get submitValid => Rx.combineLatest3(streamTime.stream,
      streamMoney.stream, streamBenefit.stream, (a, b, c) => true);

  dispose() {
    strOne.close();
    streamMoney.close();
    streamBenefit.close();
    streamTime.close();
    // streamResualt.close();
  }
}

BloC bloc = new BloC();
