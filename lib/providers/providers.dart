
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'bannernotifier.dart';
import 'fixturenotifier.dart';
import 'newsnotifier.dart';
import 'oddsnotifier.dart';

final newsProvider = ChangeNotifierProvider(
  (ref) => NewsProvider(),
);
final fixtureProvider = ChangeNotifierProvider(
  (ref) => FixtureProvider(),
);
final bannerProvider = ChangeNotifierProvider(
  (ref) => BannerProvider(),
);
final oddsProvider = ChangeNotifierProvider(
  (ref) => OddsProvider(),
);