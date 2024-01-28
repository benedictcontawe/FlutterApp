import 'dart:io';
import 'package:dart_file_picker/util/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FilesPage extends StatefulWidget {

  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const FilesPage ( {
    Key? key,
    required this.files,
    required this.onOpenedFile,
  }) : super(key: key);
  
  @override
  State<FilesPage> createState() {
    return _FilesPageState();
  }  
}

class _FilesPageState extends State<FilesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text("All Files"),
        centerTitle: true,
      ),
      body: Center (
        child:  GridView.builder (
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ), 
          itemCount: widget.files.length,
          itemBuilder: ((context, index) {
            final file = widget.files[index];
            return buidFile(file);
          } ),
        ),
      )
    );
  }

  Widget buidFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final fileSize = mb >= 1 ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';    

    return InkWell (
      onTap: () {
        widget.onOpenedFile(file);
      },
      child: Container (
        padding: const EdgeInsets.all(8),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded (
              child: buildThumbnail(file),
            ),
            const SizedBox(height: 8,),
                Text (
                  file.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text (
                  fileSize,
                  style: const TextStyle(fontSize:  16),
                )
          ],
        ),
      ),
    );
  }

  Widget buildThumbnail(PlatformFile file) {
    final color = Constants.kSolidButtonColor;//getColor(extension);
    final extension = file.extension ?? 'none';
    final isImage = extension.toLowerCase().contains("jpg") == true || extension.toLowerCase().contains("png") == true || extension.toLowerCase().contains("webp") == true; 

    if (isImage && file.bytes != null) {
      return Image.memory (
        file.bytes!, 
        fit: BoxFit.scaleDown,
        height: 250,
        width: 250,
      );
    } else if (isImage && file.path != null) {
      return Image.file(
        File(file.path!),
      );
    } else {
      return Container (
        alignment: Alignment.center,
        width:  double.infinity,
        decoration: BoxDecoration (
          color: color,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Text (
          '.$extension',
          style: const TextStyle (
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      );
    }
    
  }
}