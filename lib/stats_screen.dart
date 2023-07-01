import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStatCard(),
            _buildPlanCard(),
            Row(
              children: [
                Expanded(child: _buildErrorCard()),
                Expanded(child: _buildCategoryCard()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard() {
    return Card(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/eye.png',
                  width: 50,
                ),
                Text(
                  '100 очков', // общее количество очков
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'K_Gotham Pro',
                  ),
                ),
              ],
            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 8.0,
                percent: 0.38, // процент выполнения
                center: Text(
                  '38%', // процент выполнения
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                progressColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard() {
    return Card(
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
              'План',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'K_Gotham Pro',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPlanOption('5'),
                _buildPlanOption('10'),
                _buildPlanOption('15'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanOption(String number) {
    return ChoiceChip(
      label: Text(
        number,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'K_Gotham Pro',
        ),
      ),
      selected: number == '10',
      onSelected: (bool selected) {
        // Обновить выбранный план
      },
      selectedColor: Color(0xFF101010),
      backgroundColor: Color(0xFF6F6F6F),
    );
  }

  Widget _buildErrorCard() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 150),
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

  Widget _buildCategoryCard() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 150),
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
