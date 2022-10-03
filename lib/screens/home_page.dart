import 'package:flutter/material.dart';
import 'package:flutter_future_builder/models/photo_item.dart';
import 'package:flutter_future_builder/services/photos_service.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: FutureBuilder<List<PhotoItem>>(
        future: PhotoService().getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                ...snapshot.data!.map(
                  (e) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(e.url),
                    ),
                    title: Text(e.title),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
