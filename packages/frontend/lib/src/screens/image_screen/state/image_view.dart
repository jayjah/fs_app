// ignore_for_file: use_build_context_synchronously, curly_braces_in_flow_control_structures

part of '../image_screen.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    super.key,
    required this.imageBloc,
  });
  final Bloc<ImageEvent, ImageState> imageBloc;
  @override
  Widget build(BuildContext context) {
    return BlocView<Bloc<ImageEvent, ImageState>, ImageState>(
      bloc: imageBloc,
      builder: (BuildContext context, ImageState state) {
        return state.when(
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          displaying: (
            final Iterable<shared.Image> images,
            final String? message,
          ) {
            if (message != null) context.showSnackBar(message);

            return Content(
              allImages: images.toList(growable: false),
              onUploadImage: _onUploadImage,
              onImageTap: _onImageTap,
              onGetAllImages: _onGetAllImages,
              onDelete: _onDeleteImage,
            );
          },
        );
      },
    );
  }

  void _onDeleteImage(
    final BuildContext _,
    shared.Image image,
  ) =>
      imageBloc.add(DeleteImage(id: image.id));

  void _onUploadImage() => imageBloc.add(const UploadImage());

  void _onGetAllImages() => imageBloc.add(const GetAllImages());

  Future<void> _onImageTap(
    final BuildContext context,
    final shared.Image image,
  ) async {
    if (await showDialog<bool>(
          context: context,
          builder: (BuildContext innerContext) => const SaveImageDialog(),
        ) ==
        true) imageBloc.add(DownloadImage(id: image.id));
  }
}
