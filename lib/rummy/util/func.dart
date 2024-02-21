extension ListExtension<T> on List<T> {
  List<List<T>> groupConsecutive(bool Function(T, T) isConsecutive) {
    final allConsecutive = <List<T>>[];
    if (isNotEmpty) {
      List<T> consecutive = [first];
      for (var i = 1; i < length; i++) {
        if (isConsecutive(consecutive.last, this[i])) {
          consecutive.add(this[i]);
        } else {
          allConsecutive.add(consecutive);
          consecutive = [this[i]];
        }
      }
      allConsecutive.add(consecutive);
      consecutive = [];
    }
    return allConsecutive;
  }
}
