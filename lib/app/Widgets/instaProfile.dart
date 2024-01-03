import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstaProfile extends StatelessWidget {
  String? url;
  double? width;
  double? height;


   InstaProfile({super.key,this.url,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width??100,
        height:height?? 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          gradient: LinearGradient(
            colors: [
              Colors.amberAccent,
              Colors.purpleAccent,
              Colors.purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // Use a large value for a circular border
          border:
          Border.all(width: 2.0, color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  100.0),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(100.0),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      url??'https://i.pinimg.com/originals/64/26/36/6426364910d2f2c32e980888527f89f5.jpg', // Replace with your image URL
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
