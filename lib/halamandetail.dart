import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/disease_data.dart';
import 'package:url_launcher/url_launcher.dart';

class HalamanDetail extends StatelessWidget {
  final Diseases id;

  const HalamanDetail({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Detail'),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            child: Image.network(id.imgUrls),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                id.name,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.deepOrange,
                ),
              ),
              Text(id.plantName),
              Text(id.symptom),
              Text(id.nutshell[0]),
            ],
          ),
        ],
      ),
      floatingActionButton: MyFloatingButton(url: id.imgUrls),
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  final String url;

  const MyFloatingButton({Key? key, required this.url}) : super(key: key);

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunch(_url.toString())) {
      await launch(_url.toString());
    } else {
      throw 'Tidak dapat membuka URL: $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0, // Ubah lebar tombol
      height: 60.0, // Ubah tinggi tombol
      child: FloatingActionButton(
        onPressed: () {
          _launchUrl(url);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.link),
            Text('Link', style: TextStyle(fontSize: 12.0)), // Ubah ukuran teks
          ],
        ),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}

