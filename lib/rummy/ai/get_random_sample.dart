part of 'rummy_ai.dart';

extension _RummyAiExtensionGetRandomSample on Meld {
  List<Card>? getRandomSample(List<Card> cards, {Random? random}) {
    final rnd = random ?? Random();

    List<Card>? samples;
    switch (this) {
      case Run():
        final List<List<Card>> runs = getAllPossibleSamples(cards);

        if (runs.isNotEmpty) {
          final randomRunIndex = rnd.nextInt(runs.length);
          final randomRun = runs[randomRunIndex];
          final randomRunLength = rnd.nextInt(randomRun.length - (minMeldNum - 1)) + minMeldNum;
          final randomRunStart = rnd.nextInt(randomRun.length - (randomRunLength - 1));
          samples = randomRun.sublist(randomRunStart, randomRunStart + randomRunLength);
        }
      case Group():
        throw UnimplementedError();
    }

    if (samples == null) {
      return null;
    }
    assert(checkCards(samples));
    return arrangeCards(samples);
  }
}
