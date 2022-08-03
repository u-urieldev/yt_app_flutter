import 'package:flutter/material.dart';

class ReusableVideoCard extends StatelessWidget {
  String text, image;
  ReusableVideoCard({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Picado pa'),
      child: Container(
        height: 220,
        width: double.infinity,
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
        child: Card(
          elevation: 5,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 170,
                width: double.infinity,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 8, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                      ),
                      flex: 6,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => print('Options'),
                        child: const Icon(Icons.more_horiz),
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
