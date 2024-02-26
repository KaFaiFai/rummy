abstract class CharacterBase {
  final int maxHP;
  int curHP;
  int _damage = 0;
  int _shield = 0;

  CharacterBase(this.maxHP) : curHP = maxHP;

  int get damage => _damage;

  void setDamage(int value) {
    _damage = value;
  }

  int get shield => _shield;

  void setShield(int value) {
    _shield = value;
  }

  void receiveDamage(int value) {
    if (value < shield) {
      setShield(shield - value);
    } else {
      setShield(0);
      curHP = curHP - (value - shield);
    }
  }

  void attack(CharacterBase other) {
    final finalDamage = damage - other.shield;
    other.receiveDamage(finalDamage);
  }
}
