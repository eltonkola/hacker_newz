import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RowViewLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child:Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                color: Colors.grey,
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: 40.0,
                      height: 8.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
