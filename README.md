### Fullstack Application 
    
This is a [gRPC](https://grpc.io) fullstack ([Dart](https://dart.dev) and [Flutter](https://flutter.dev)) CRUD  application.

NOTE: Application is configured with [melos](https://pub.dev/packages/melos).
    So look into `melos.yaml` for any relevant shell script/command.

Example:
```shell
dart pub get && dart run melos run test
```

#### Project requirements
- [Dart](https://dart.dev) must be installed
- [Flutter](https://flutter.dev) must be installed
- [Docker](https://docker.com) or [Podman](https://podman.io) should be installed

#### Project structure
- packages/frontend

    -> Frontend module (graphical user interface && gRPC client) build with flutter.


- packages/backend

    -> A backend module (gRPC server) build with dart.


- packages/shared

    -> This module is shared between `frontend` and `backend`.
        It consists mostly of [protobuf](https://protobuf.dev) files and generated code.
