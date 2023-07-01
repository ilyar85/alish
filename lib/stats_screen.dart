import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String _selectedPlan = '10';

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStatCard(screenHeight * 0.3),
            _buildPlanCard(screenHeight * 0.1),
            Row(
              children: [
                Expanded(child: _buildErrorCard(screenHeight * 0.4)),
                Expanded(child: _buildCategoryCard(screenHeight * 0.4)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(double height) {
    return Container(
      height: height,
      child: Card(
        color: Color(0xFF101010),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38.0),
        ),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/eye.png',
                    width: 50,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '100', // общее количество очков
                    style: TextStyle(
                      color: Color(0xFF003AFF),
                      fontSize: 24,
                      fontFamily: 'K_Gotham Pro',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Пройдено',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'K_Gotham Pro',
                        ),
                      ),
                      Text(
                        '38/100', // текущая статистика
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'K_Gotham Pro',
                        ),
                      ),
                      Text(
                        'Общее количество изученных слов',
                        style: TextStyle(
                          color: Color(0xFF6F6F6F),
                          fontSize: 14,
                          fontFamily: 'K_Gotham Pro',
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircularPercentIndicator(
                    radius: 60.0, // уменьшил радиус
                    lineWidth: 6.0,
                    percent: 0.38, // процент выполнения
                    center: Text(
                      '38%', // процент выполнения
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    progressColor: Color(0xffffffff),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(double height) {
    return Container(
      height: height,
      child: Card(
        color: Color(0xFF101010),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38.0),
        ),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'количество',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'K_Gotham Pro',
                    ),
                  ),
                  _buildPlanOption('5'),
                  _buildPlanOption('10'),
                  _buildPlanOption('15'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanOption(String number) {
    return Row(
      children: [
        Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'K_Gotham Pro',
          ),
        ),
        Radio<String>(
          value: number,
          groupValue: _selectedPlan,
          onChanged: (String? value) {
            setState(() {
              _selectedPlan = value!;
            });
          },
          activeColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white;
            }
            return Colors.white; // цвет кнопки когда она не выбрана
          }),
        ),
      ],
    );
  }

  Widget _buildErrorCard(double height) {
    return Container(
      height: height,
      child: Card(
        color: Color(0xFF101010),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38.0),
        ),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Ошибки',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
              Text(
                '31',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    '${index + 1}. Ошибка',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'K_Gotham Pro',
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Посмотреть'),
                onPressed: () {
                  // Посмотреть ошибки
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF101010),
                  onPrimary: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'K_Gotham Pro',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(double height) {
    return Container(
      height: height,
      child: Card(
        color: Color(0xFF101010),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(38.0),
        ),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Категории',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    'Категория ${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'K_Gotham Pro',
                    ),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Изучить'),
                onPressed: () {
                  // Изучить категории
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF101010),
                  onPrimary: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'K_Gotham Pro',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
