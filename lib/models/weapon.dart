class Weapon {
  final String name;
  final int amount;
  final int atk;
  final int critRate;
  final int critDmg;
  final String description;

  static List<Weapon> weaponList = [];

  Weapon(this.name, this.amount, this.atk, this.critRate, this.critDmg, this.description);
}