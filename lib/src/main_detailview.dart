import 'package:flutter/material.dart';

class MainDetailView extends StatefulWidget {
  final String? name;
  final String? image;
  final String? description;
  final String? merk;

  const MainDetailView({
    Key? key,
    this.name,
    this.image,
    this.description,
    this.merk,
  }) : super(key: key);

  @override
  State<MainDetailView> createState() => _MainDetailViewState();
}

class _MainDetailViewState extends State<MainDetailView> {
  String myTitle = "";
  String myImage = "";
  String myDescription = "";
  String myMerk = "";

  @override
  void initState() {
    myTitle = widget.name ?? myTitle;
    myImage = widget.image ?? myImage;
    myDescription = widget.description ?? myDescription;
    myMerk = widget.merk ?? myMerk;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(myTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  myImage,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                Text(
                  myDescription,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify, // Paragraf rata kanan dan kiri
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}