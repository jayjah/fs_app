part of '../image_screen.dart';

typedef OnImageTap = void Function(BuildContext context, int id);

class Content extends StatelessWidget {
  const Content({
    super.key,
    required this.onGetAllImages,
    required this.onUploadImage,
    required this.onImageTap,
    required this.allImages,
    required this.onDelete,
  });
  final VoidCallback onUploadImage;
  final VoidCallback onGetAllImages;
  final OnItem<shared.Image> onDelete;
  final OnItem<shared.Image> onImageTap;
  final List<shared.Image> allImages;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        k12Spacer,
        ElevatedButton(
          onPressed: onUploadImage,
          child: const Text('Upload Image'),
        ),
        k12Spacer,
        ElevatedButton(
          onPressed: onGetAllImages,
          child: const Text('Get All Images'),
        ),
        k12Spacer,
        if (allImages.isEmpty)
          const Expanded(
            child: Placeholder(),
          )
        else
          Expanded(
            child: ListView.builder(
              padding: kPadding12,
              itemCount: allImages.length,
              itemBuilder: (BuildContext context, int index) {
                final shared.Image image = allImages[index];

                return Item<shared.Image>(
                  object: image,
                  onDelete: onDelete,
                  onTap: onImageTap,
                  textBuilder: (BuildContext context, shared.Image image) =>
                      'Image :: ${image.id} :: ${image.file.metaData.fileName}.${image.file.metaData.extension_2}',
                );
              },
            ),
          ),
      ],
    );
  }
}
