import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key?key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  DateTime _firstDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        top:true,
        bottom:false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: _firstDay,
            ),
            _CoupleImage(),
          ],
        )
      )
    );
  }
  void onHeartPressed(){
    showCupertinoDialog(
    context: context,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height:300,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    _firstDay = date;
                  });
                },
              ),
            ),
          ) ;
        },
      barrierDismissible: true,
    );
  }
}
class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({
    required this.onHeartPressed,
    required this.firstDay,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();
    return Column(
      children: [
        const SizedBox(height: 16),
        Text('U&I', style: textTheme.headline1),
        const SizedBox(height: 16),
        Text('우리 처음 만난 날', style: textTheme.bodyText1),
        Text('${firstDay.year}.${firstDay.month}.${firstDay.day}', style: textTheme.bodyText2),
        const SizedBox(height: 16),
        IconButton(
          iconSize:60,
          onPressed: onHeartPressed ,
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        const SizedBox(height: 16),
        Text('D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}', style: textTheme.headline2),
      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
      child: Image.asset(
        'asset/img/middle_image.png',
        height:MediaQuery.of(context).size.height / 2,
      ),
      ),
    );
  }
}