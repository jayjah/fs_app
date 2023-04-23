import 'package:backend/src/db/models/image.dart';
import 'package:backend/src/db/models/news.dart';
import 'package:backend/src/db/models/user.dart';
import 'package:shared/shared.dart' as shared;

extension NewsParser on NewsView? {
  shared.News toNews() {
    return shared.News(
      id: this?.id,
      image: this?.image.toImage(),
      createdAt: this?.createdAt == null
          ? null
          : shared.Timestamp.fromDateTime(this!.createdAt),
      name: this?.name,
      shortDescription: this?.shortDescription,
      text: this?.text,
    );
  }
}

extension ImageParser on ImageView? {
  shared.Image toImage() {
    return shared.Image(
      createdAt: this?.createdAt == null
          ? null
          : shared.Timestamp.fromDateTime(this!.createdAt),
      id: this?.id,
      file: shared.File(
        metaData: shared.MetaData(
          fileName: this?.fileName,
          extension_2: this?.fileExtension,
        ),
      ),
    );
  }
}

extension UserParser on UserView? {
  shared.User toUser() {
    return shared.User(
      id: this?.id,
      firstName: this?.firstName,
      lastName: this?.lastName,
      email: this?.email,
      birthDate: this?.birthDate == null
          ? null
          : shared.Timestamp.fromDateTime(this!.birthDate!),
    );
  }
}
