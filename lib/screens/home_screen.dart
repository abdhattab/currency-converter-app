import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pop_up_menu/items.dart';
import '../widget/text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownvalue = "\$ - USD";
  String dropdownvalue2 = "\$ - USD";

  late TextEditingController _price;
  late TextEditingController _firstCurrency;
  late TextEditingController _secondCurrency;
  late double _result;
  late double _first;
  late double _exchange;

  var items = [
    const Item(name: "\$ - USD"),
    const Item(name: "₪ - ILS"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _price = TextEditingController();
    _firstCurrency = TextEditingController();
    _secondCurrency = TextEditingController();
  }

  @override
  void dispose() {
    _price.dispose();
    _firstCurrency.dispose();
    _secondCurrency.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: GoogleFonts.adventPro(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        titleSpacing: 1,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            Text(
              'Enter Price of currency',
              style: GoogleFonts.adventPro(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
            const SizedBox(height: 20),
            TextWidget(
              textController: _price,
              hint: 'Price',
              icon: Icons.price_change_outlined,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: items.map((items) {
                      return DropdownMenuItem(
                        value: items.name,
                        child: Text(
                          items.name,
                          style: GoogleFonts.gabriela(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextWidget(
                    textController: _firstCurrency,
                    hint: '1st Currency',
                    icon: Icons.change_circle,
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),

            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    // Initial Value
                    value: dropdownvalue2,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((items) {
                      return DropdownMenuItem(
                        value: items.name,
                        child: Text(
                          items.name,
                          style: GoogleFonts.gabriela(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue2 = newValue!;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextWidget(
                    hint: '2n Currency',
                    icon: Icons.change_circle,
                    textController: _secondCurrency,
                  ),
                ),
              ],
            ),
            //
            const SizedBox(height: 60),
            ///////////////////////////////////////////
            ElevatedButton(
                onPressed: () {
                  if (_firstCurrency.text.isEmpty &&
                      _secondCurrency.text.isEmpty) {
                    infoMessage(
                        'Enter 1st Currency or 2nd Currency', Colors.red);
                  } else if (_firstCurrency.text.isNotEmpty &&
                      _secondCurrency.text.isEmpty &&
                      dropdownvalue == "\$ - USD" &&
                      dropdownvalue2 == "₪ - ILS") {
                    _first = double.parse(_firstCurrency.text);
                    _exchange = double.parse(_price.text).toDouble();
                    _result = _first * _exchange;
                    _secondCurrency.text = _result.toString();
                  } else if (_firstCurrency.text.isNotEmpty &&
                      _secondCurrency.text.isEmpty &&
                      dropdownvalue == "₪ - ILS" &&
                      dropdownvalue2 == "\$ - USD") {
                    _first = double.parse(_firstCurrency.text);
                    _exchange = double.parse(_price.text);
                    _result = _first / _exchange;
                    _secondCurrency.text = _result.toString();
                  } else if (_firstCurrency.text.isNotEmpty &&
                      _secondCurrency.text.isNotEmpty &&
                      dropdownvalue == "\$ - USD" &&
                      dropdownvalue2 == "₪ - ILS") {
                    _first = double.parse(_firstCurrency.text);
                    _exchange = double.parse(_price.text);
                    _result = _first * _exchange;
                    _secondCurrency.text = _result.toString();

                  }  else if (_firstCurrency.text.isNotEmpty &&
                      _secondCurrency.text.isNotEmpty &&
                      dropdownvalue2 == "\$ - USD" &&
                      dropdownvalue == "₪ - ILS") {
                    _first = double.parse(_firstCurrency.text);
                    _exchange = double.parse(_price.text);
                    _result = _first / _exchange;
                    _secondCurrency.text = _result.toString();
                  }
                  else {
                    _firstCurrency.text = '';
                    _secondCurrency.text = '';
                  }
                },
                child: const Text('Convert')),
            SizedBox(height: 180),
            Text('''                                   Version 1.0 
            
            Developed By Abdallah Osama Al-Hattab                 ''',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100) ,),

          ],
        ),
      ),
    );
  }

  void infoMessage(String message, Color fill) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: fill,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
