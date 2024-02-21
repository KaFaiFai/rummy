part of 'rummy_ai.dart';

extension on Meld {
  List<Tile>? getRandomSample(List<Tile> tiles, {Random? random, int maxLength = 10000}) {
    final rnd = random ?? Random();

    List<Tile>? samples;
    switch (this) {
      case Run():
        final allSamples = getAllPossibleSamples(tiles);

        if (allSamples.isNotEmpty) {
          final randomIndex = rnd.nextInt(allSamples.length);
          final randomSamples = allSamples[randomIndex];
          final randomLength = rnd.nextInt(min(randomSamples.length, maxLength) - (minMeldNum - 1)) + minMeldNum;
          final randomRunStart = rnd.nextInt(randomSamples.length - (randomLength - 1));
          samples = randomSamples.sublist(randomRunStart, randomRunStart + randomLength);
        }
      case Group():
        final allSamples = getAllPossibleSamples(tiles);
        if (allSamples.isNotEmpty) {
          final randomIndex = rnd.nextInt(allSamples.length);
          final randomSamples = allSamples[randomIndex];
          final randomLength = rnd.nextInt(min(randomSamples.length, maxLength) - (minMeldNum - 1)) + minMeldNum;
          randomSamples.shuffle(rnd);
          samples = randomSamples.sublist(0, randomLength);
        }
    }

    if (samples == null) {
      return null;
    }
    assert(checkTiles(samples));
    return arrangeTiles(samples);
  }
}
