# Start from dart base image
FROM dart:stable as build

# Add Maintainer info
LABEL maintainer="Markus Krebs"

# Install git.
# Git is required for fetching the dependencies.
#RUN apk update && apk add --no-cache git && apk add --no-cach bash && apk add build-base

# Setup folders
RUN mkdir /app
RUN mkdir /shared
WORKDIR /app

# Set up packages and set up dependencies
RUN echo huhu
WORKDIR /shared
COPY ./packages/shared/pubspec.* /shared
RUN dart pub get
WORKDIR /app
COPY ./packages/backend/pubspec.* ./
RUN dart pub get
RUN echo huhu

# Copy the source
COPY ./packages/backend .
COPY ./packages/shared/ ../shared/
COPY .env .

# Ensure packages are still up-to-date if anything has changed
RUN dart pub get --offline
RUN dart compile exe bin/backend.dart -o bin/backend

# Build minimal serving image from AOT-compiled `/server` and required system
# libraries and configuration files stored in `/runtime/` from the build stage.
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/backend /app/bin/

# Expose port 8080 to the outside world
EXPOSE 8080

# Set user as non root
USER nonroot:nonroot

# Run the executable
CMD ["/app/bin/backend"]