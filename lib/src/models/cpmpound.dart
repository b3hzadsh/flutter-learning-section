class Compound {
  int time; // year +
  int benefit; // sood mahane + 0-100
  int firstMoney; // + < 200

  //resualt

  // Compound.fromBenefit({@required this.benefit});
  // Compound.fromTime({@required this.time});
  // Compound.fromMoney({@required this.firstMoney});
  // Compound.general({this.benefit, this.firstMoney, this.time});
}

// Compound cp = new Compound();
int fResualt(int money, int sood, int time, int periode) {
  switch (periode) {
    case 0:
      {
        return pResualt(money, sood, time, 52); // for weekly ,52 week in a year

      }
      break;
    case 1:
      {
        return pResualt(
            money, sood, time, 12); // for monthly ,12 month in a year

      }
      break;
    case 2:
      {
        return pResualt(money, sood, time, 1); // for annualy ,1 year in a year
      }
      break;
    default:
      {
        return 32;
      }
  }
}

int pResualt(int money, int sood, int time, int zarib) {
  double x = money * 1.0;
  for (int i = 0; i < time * zarib; i++) {
    x += x * sood / 100;
  }
  return x.floor();
}
