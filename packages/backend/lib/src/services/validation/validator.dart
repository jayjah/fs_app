import 'package:shared/shared.dart';

typedef ValidationRule<T> = GrpcError? Function(T obj);

abstract class Validator<T> {
  final List<ValidationRule<T>> _rules = <ValidationRule<T>>[];

  void addRule(ValidationRule<T> rule) => _rules.add(rule);

  GrpcError? validate(T obj) {
    for (final ValidationRule<T> rule in _rules) {
      final GrpcError? validationError = rule(obj);
      if (validationError != null) return validationError;
    }

    return null;
  }
}
