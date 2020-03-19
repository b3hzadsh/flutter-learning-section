class Compound {
  int time; // year +
  int benefit; // sood mahane + 0-100
  int firstMoney; // + < 200
  double resualt() {
    double x = 0;
    for (int i = 0; i < time * 12; i++) {
      x += x * benefit / 100;
    }
    return x;
  }
  //resualt

  // Compound.fromBenefit({@required this.benefit});
  // Compound.fromTime({@required this.time});
  // Compound.fromMoney({@required this.firstMoney});
  // Compound.general({this.benefit, this.firstMoney, this.time});
}

Compound cp = new Compound();
