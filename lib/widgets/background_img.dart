import 'package:flutter/material.dart';

class BackgroundImg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          Colors.black,
          Colors.black12
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.center
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black54, 
              BlendMode.darken
            ),
            image: AssetImage("assets/images/Foudy-bg.jpg"),
            fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
