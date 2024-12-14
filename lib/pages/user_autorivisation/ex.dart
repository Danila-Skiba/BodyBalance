import 'package:flutter/material.dart';

class Exempl extends StatefulWidget {
  const Exempl({super.key});

  @override
  State<Exempl> createState() => _ExemplState();
}

class _ExemplState extends State<Exempl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      


      body: Container(
        child: Image.network(
  'https://avatars.mds.yandex.net/i?id=0d4e81037ad8122d3d224b1915f04c5d_l-13595317-images-thumbs&n=13',
  fit: BoxFit.cover, // Как изображение должно заполнять место
  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
    return const Icon(Icons.error); // Замена на иконку ошибки при ошибке загрузки
  },
)
      ),
    );
  }
}