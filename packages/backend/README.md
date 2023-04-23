### Backend

A gRPC server written in dart. A database is used as a persistence layer.
The server uses [Isolates](https://dart.dev/language/concurrency) to have a `multithreaded` environment.

#### Requirements
- [Dart](https://dart.dev) must be installed
- [Docker](https://docker.com) or [Podman](https://podman.io) should be installed

#### Instructions

- Locally:
```shell
dart pub get
chmod +x tools/migration_ssed.sh
chmod +x tools/setup_local_db.sh
./tools/setup_local_db.sh
dart run bin/backend.art
```

- Docker:

go into the root project directory and run 
```shell
dart run melos run docker_up
```
That command will use the `Dockerfile` and `docker-compose.yml`
files in that directory to spin up the database and the server itself.

#### Simple Stress test
    Tested locally on a Apple Macbook Air M1 (8 Core) - 16GB RAM

###### Command: 
ghz -c 100 -n 5000 --insecure \
--proto protos/status.proto \
--call StatusService/ping \
-d '{}' \
localhost:8080

######  Summary:
- Count:        5000
- Total:        5.79 s
- Slowest:      370.01 ms
- Fastest:      33.18 ms
- Average:      115.37 ms
- Requests/sec: 863.00

###### Response time histogram:
- 33.183  [1]    |
- 66.865  [78]   |∎
- 100.548 [1233] |∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎
- 134.231 [3189] |∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎∎
- 167.913 [155]  |∎∎
- 201.596 [127]  |∎∎
- 235.278 [117]  |∎
- 268.961 [0]    |
- 302.643 [0]    |
- 336.326 [33]   |
- 370.009 [67]   |∎

###### Latency distribution:
- 10 % in 90.65 ms
- 25 % in 100.40 ms
- 50 % in 103.82 ms
- 75 % in 118.68 ms
- 90 % in 134.13 ms
- 95 % in 192.18 ms
- 99 % in 351.02 ms

###### Status code distribution:
[OK]   5000 responses