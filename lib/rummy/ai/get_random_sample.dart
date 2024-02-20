part of 'rummy_ai.dart';

extension on Meld {
  List<Card>? getRandomSample(List<Card> cards, {Random? random}) {
    final rnd = random ?? Random();

    List<Card>? samples;
    switch (this) {
      case Run():
        final allSamples = getAllPossibleSamples(cards);

        if (allSamples.isNotEmpty) {
          final randomIndex = rnd.nextInt(allSamples.length);
          final randomSamples = allSamples[randomIndex];
          final randomLength = rnd.nextInt(randomSamples.length - (minMeldNum - 1)) + minMeldNum;
          final randomRunStart = rnd.nextInt(randomSamples.length - (randomLength - 1));
          samples = randomSamples.sublist(randomRunStart, randomRunStart + randomLength - 1);
        }
      case Group():
        final allSamples = getAllPossibleSamples(cards);
        if (allSamples.isNotEmpty) {
          final randomIndex = rnd.nextInt(allSamples.length);
          final randomSamples = allSamples[randomIndex];
          final randomLength = rnd.nextInt(randomSamples.length - (minMeldNum - 1)) + minMeldNum;
          randomSamples.shuffle(rnd);
          samples = randomSamples.sublist(0, randomLength - 1);
        }
    }

    if (samples == null) {
      return null;
    }
    assert(checkCards(samples));
    return arrangeCards(samples);
  }
}
