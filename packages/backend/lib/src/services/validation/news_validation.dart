import 'package:backend/src/services/validation/validator.dart';
import 'package:shared/shared.dart';

class NewsCreateValidation extends Validator<CreateNews> {
  NewsCreateValidation() {
    addRule(
      (CreateNews obj) =>
          obj.hasName() ? null : GrpcError.invalidArgument('Name is not given'),
    );
    addRule(
      (CreateNews obj) => obj.hasShortDescription()
          ? null
          : GrpcError.invalidArgument('Short description is not given'),
    );
    addRule(
      (CreateNews obj) =>
          obj.hasText() ? null : GrpcError.invalidArgument('Text is not given'),
    );
  }
}

class NewsUpdateValidation extends Validator<UpdateNews> {
  NewsUpdateValidation() {
    addRule(
      (UpdateNews obj) =>
          obj.hasId() ? null : GrpcError.invalidArgument('Id is not given'),
    );
  }
}
