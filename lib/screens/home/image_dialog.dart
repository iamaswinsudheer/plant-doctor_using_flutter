import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plant_doctor/services/api_request.dart';
import 'package:plant_doctor/shared/loading.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({Key? key, this.imageFile}) : super(key: key);

  final File? imageFile;

  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  bool isLoading = true;
  // ignore: unused_field
  late Future<void> _imageLoadingFuture;

  @override
  void initState() {
    super.initState();
    _imageLoadingFuture = loadImage();
  }

  Future<void> loadImage() async {
    final Completer<void> completer = Completer<void>();
    final imageProvider = FileImage(widget.imageFile!);

    // Listen for image loading completion
    imageProvider.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
            (info, synchronousCall) {
              setState(() {
                isLoading = false;
              });
              completer.complete();
            },
            onError: (dynamic exception, StackTrace? stackTrace) {
              completer.completeError(exception, stackTrace);
            },
          ),
        );

    await completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Image preview'),
      content: Stack(
        alignment: Alignment.center,
        children: [
          if (widget.imageFile != null && !isLoading)
            Image.file(widget.imageFile!),
          if (isLoading) CircularProgressIndicator(),
        ],
      ),
      actions: <Widget>[
        AbsorbPointer(
          absorbing: isLoading,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                isLoading ? Colors.grey : Colors.blue,
              ),
            ),
            child: Text('Cancel'),
          ),
        ),
        AbsorbPointer(
          absorbing: isLoading,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Loading(),
                  ));
              uploadImageToAPI(context, widget.imageFile!);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                isLoading ? Colors.grey : Colors.blue,
              ),
            ),
            child: Text('Continue'),
          ),
        ),
      ],
    );
  }
}
