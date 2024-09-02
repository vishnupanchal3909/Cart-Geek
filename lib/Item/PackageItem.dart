import 'package:flutter/material.dart';

import '../Model/PackageModel.dart';

class PackageItem extends StatefulWidget {
  final PackageModel item;
  final Color backgroundColor;
  PackageItem({required this.item, required this.backgroundColor});

  @override
  State<PackageItem> createState() => _PackageItemState();
}

class _PackageItemState extends State<PackageItem> {
  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: widget.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '₹ ${item.price.toString()}',
                      style:
                      const TextStyle(fontSize: 18, color: Colors.pink),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.desc.toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Book package
                        },
                        child: Text('Book Now'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
