part of '../image_screen.dart';

class SaveImageDialog extends StatelessWidget {
  const SaveImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const YesNoDialog(header: 'Do you want to save the image locally?');
  }
}

class DeleteImageDialog extends StatelessWidget {
  const DeleteImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const YesNoDialog(header: 'Do you want to delete this image?');
  }
}
