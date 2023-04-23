import 'package:frontend/src/domain/domain.dart';
import 'package:frontend/src/env/env.dart';
import 'package:frontend/src/local_storage/hive_storage.dart';
import 'package:frontend/src/local_storage/local_storage.dart';
import 'package:frontend/src/repository/image_repository.dart';
import 'package:frontend/src/repository/news_repository.dart';
import 'package:frontend/src/repository/repository.dart';
import 'package:frontend/src/repository/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared/shared.dart'
    show
        CallOptions,
        ChannelCredentials,
        ChannelOptions,
        ClientChannel,
        ClientInterceptor,
        ClientMethod,
        ClientStreamingInvoker,
        ClientUnaryInvoker,
        Image,
        ImageServiceClient,
        News,
        NewsServiceClient,
        ResponseFuture,
        ResponseStream,
        User,
        UserServiceClient,
        kAuthTokenHeader;

final GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  await _initHive();

  final ClientChannel channel = ClientChannel(
    Env.serverHost,
    port: Env.port,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
  final AuthTokenInterceptor authTokenInterceptor = AuthTokenInterceptor();

  locator
    ..registerSingleton<ClientChannel>(
      channel,
      dispose: (ClientChannel channel) => channel.shutdown(),
    )
    ..registerSingleton<LocalStorage<LocalUser>>(
      HiveStorage<LocalUser>(
        await Hive.openBox<LocalUser>(LocalUser.storageBox),
      ),
      dispose: (LocalStorage<LocalUser> storage) => storage.close(),
    )
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        UserServiceClient(
          channel,
          interceptors: <ClientInterceptor>[authTokenInterceptor],
        ),
      ),
      dispose: (Repository<User> repo) => repo.dispose(),
    )
    ..registerLazySingleton<ImageRepository>(
      () => ImageRepositoryImpl(
        ImageServiceClient(
          channel,
          interceptors: <ClientInterceptor>[authTokenInterceptor],
        ),
      ),
      dispose: (Repository<Image> repo) => repo.dispose(),
    )
    ..registerLazySingleton<Repository<News>>(
      () => NewsRepository(
        NewsServiceClient(
          channel,
          interceptors: <ClientInterceptor>[authTokenInterceptor],
        ),
      ),
      dispose: (Repository<News> repo) => repo.dispose(),
    )
    ..registerLazySingleton<AuthTokenInterceptor>(() => authTokenInterceptor);
}

Future<void> _initHive({String? path}) async {
  _initHiveAdapters();
  Hive.init(path ?? (await getApplicationDocumentsDirectory()).path);
}

void _initHiveAdapters() => Hive.registerAdapter(LocalUserAdapter());

class AuthTokenInterceptor implements ClientInterceptor {
  String _authToken = '';

  void updateToken(final String authToken) => _authToken = authToken;

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    ClientStreamingInvoker<Q, R> invoker,
  ) {
    return invoker(
      method,
      requests,
      options.mergedWith(
        CallOptions(
          metadata: <String, String>{kAuthTokenHeader: _authToken},
        ),
      ),
    );
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    ClientUnaryInvoker<Q, R> invoker,
  ) {
    return invoker(
      method,
      request,
      options.mergedWith(
        CallOptions(
          metadata: <String, String>{kAuthTokenHeader: _authToken},
        ),
      ),
    );
  }
}
