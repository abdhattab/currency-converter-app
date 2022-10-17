import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanuchScreen extends StatefulWidget {
  const LanuchScreen({Key? key}) : super(key: key);

  @override
  State<LanuchScreen> createState() => _LanchScreenState();
}

class _LanchScreenState extends State<LanuchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000),(){
      Navigator.pushReplacementNamed(context, 'HomeScreen') ;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient:  LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [ Color(0xffE4DCCF), Color(0xffF0EBE3)],
            )),
        child: Center(
          child: Text(
            'Simple Currency App',
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),

      ),

    );
  }
}
