import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pr0gramm/pr0gramm_theme.dart';
import 'package:pr0gramm/service/collection_service/collection_service.dart';
import 'package:pr0gramm/service/login_service/login_service.dart';
import 'package:pr0gramm/service/path_provider.dart';
import 'package:pr0gramm/service/preferences_service.dart';
import 'package:pr0gramm/service/stelz_service/stelz_service.dart';
import 'package:pr0gramm/service/vote_service/vote_service.dart';
import 'package:pr0gramm_api/pr0gramm_api.dart';

import 'modules/home/home_module.dart';
import 'service/sync_service/sync_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();
  await PathProvider.init();
  runApp(ModularApp(module: Pr0grammModule()));
}

class Pr0grammModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (_) => Pr0gramm(Dio()
            ..interceptors.add(
              Pr0grammCookieManager(
                PersistCookieJar(dir: PathProvider.applicationDocumentsDirectory.path),
              ),
            )),
        ),
        Bind(
          (_) => VoteService(),
        ),
        Bind(
          (_) => CollectionService(),
        ),
        Bind(
          (_) => StelzService(),
        ),
        Bind(
          (_) => SyncService(Modular.get<Pr0gramm>(), Modular.get<VoteService>(), Modular.get<CollectionService>(), Modular.get<StelzService>()),
        ),
        Bind(
          (_) => LoginService(Modular.get<Pr0gramm>(), Modular.get<SyncService>()),
        ),
        Bind(
          (_) => PreferencesService(),
        ),
      ];

  @override
  Widget get bootstrap => Pr0grammRoot();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/items', module: HomeModule()),
      ];
}

class Pr0grammRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesService, PreferencesState>(
      cubit: Modular.get<PreferencesService>(),
      builder: (context, state) => MaterialApp(
        title: 'pr0gramm',
        initialRoute: '/items',
        theme: themes[state.theme],
        debugShowCheckedModeBanner: false,
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
      ),
    );
  }
}
