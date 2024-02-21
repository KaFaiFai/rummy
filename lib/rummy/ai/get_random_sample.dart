part of 'rummy_ai.dart';

extension on Meld {
  List<Tile>? getRandomSample(List<Tile> tiles, {Random? random, int maxLength = 10000}) {
    final rnd = random ?? Random();

    List<Tile>? samples;
    switch (this) {
      case Run():
        final allSamples = getSamplePools(tiles);
        if (allSamples.isNotEmpty) {
          final randomIndex = rnd.nextInt(allSamples.length);
          final randomSamples = allSamples[randomIndex];
          final randomLength = rnd.nextInt(min(randomSamples.length, maxLength) - (minMeldUnit - 1)) + minMeldUnit;
          final randomStart = rnd.nextInt(randomSamples.length - (randomLength - 1));
          samples = randomSamples.sublist(randomStart, randomStart + randomLength);
        }
      case Group():
        final allSamples = getSamplePools(tiles);
        if (allSamples.isNotEmpty) {
          final randomIndex = rnd.nextInt(allSamples.length);
          final randomSamples = allSamples[randomIndex];
          final randomLength = rnd.nextInt(min(randomSamples.length, maxLength) - (minMeldUnit - 1)) + minMeldUnit;
          randomSamples.shuffle(rnd);
          samples = randomSamples.sublist(0, randomLength);
        }
      case Pairs():
        final allSamples = getSamplePools(tiles);
        if (allSamples.isNotEmpty) {
          final randomIndex = rnd.nextInt(allSamples.length);
          final randomSamples = allSamples[randomIndex];
          final rankBegin = randomSamples.first.rank;
          final rankEnd = randomSamples.last.rank;
          final rankLength = rankEnd - rankBegin + 1;
          final randomLength = rnd.nextInt(min(rankLength, maxLength) - (minMeldUnit - 1)) + minMeldUnit;
          final randomStart = rnd.nextInt(rankLength - (randomLength - 1));
          samples = [];
          for (var i = randomStart; i < randomStart + randomLength; i++) {
            final randomPair = (randomSamples.where((e) => e.rank == i).toList()..shuffle(rnd)).sublist(0, 2);
            samples = samples! + randomPair;
          }
        }
    }

    if (samples == null) {
      return null;
    }
    assert(checkTiles(samples));
    return arrangeTiles(samples);
  }
}
