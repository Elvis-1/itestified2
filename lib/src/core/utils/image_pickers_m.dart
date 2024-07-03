// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:video_compress/video_compress.dart';

// class MarketzMediaPicker {
//   // Function to pick both images and videos, and compress them accordingly
//   Future<List<XFile>> pickImagesAndVideos() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.media,
//         allowMultiple: true,
//       );

//       if (result != null && result.files.isNotEmpty) {
//         List<XFile> mediaFiles = [];
//         for (var file in result.files) {
//           // Check if the file is an image
//           if (['jpg', 'jpeg', 'png'].contains(file.extension)) {
//             // It's an image file, attempt to compress
//             var compressedImage = await _compressImage(File(file.path!));
//             if (compressedImage != null) {
//               mediaFiles.add(XFile(compressedImage.path));
//             }
//           }
//           // Check if the file is a video
//           else if (['mp4', 'mov'].contains(file.extension)) {
//             // It's a video file, attempt to compress
//             var compressedVideo = await _compressVideo(File(file.path!));
//             if (compressedVideo != null) {
//               mediaFiles.add(XFile(compressedVideo.path));
//             }
//             //   mediaFiles.add(XFile(file.path!));
//           }
//         }
//         return mediaFiles;
//       } else {
//         throw Exception('No files picked');
//       }
//     } catch (e) {
//       debugPrint('Failed to pick media: $e');
//       throw Exception(e.toString());
//     }
//   }

//   Future<XFile?> pickImage(ImageSource source) async {
//     try {
//       final imagePicker = ImagePicker();
//       final file = await imagePicker.pickImage(source: source);

//       if (file != null) {
//         final compressedFile = await _compressImage(File(file.path));

//         return compressedFile;
//       }
//     } on PlatformException catch (e) {
//       debugPrint('Failed to pick image: $e');
//     }
//     return null;
//   }

//   // Function to compress image files
//   Future<XFile?> _compressImage(File file) async {
//     try {
//       final tempDir = await getTemporaryDirectory();
//       final path = tempDir.path;
//       final targetPath =
//           '$path/temp_${DateTime.now().millisecondsSinceEpoch}.jpg';

//       var compressedFile = await FlutterImageCompress.compressAndGetFile(
//         file.absolute.path,
//         targetPath,
//         quality: 60,
//       );

//       return compressedFile;
//     } catch (e) {
//       debugPrint('Error compressing image: $e');
//       return null;
//     }
//   }

//   // Function to compress video files
//   Future<File?> _compressVideo(File file) async {
//     try {
//       final compressedVideo = await VideoCompress.compressVideo(
//         file.path,
//         quality: VideoQuality.MediumQuality, // Adjust the quality as needed
//         deleteOrigin: false, // Choose whether to delete the original file
//       );
//       return compressedVideo?.file;
//     } catch (e) {
//       debugPrint('Error compressing video: $e');
//       return null;
//     }
//   }
// }
