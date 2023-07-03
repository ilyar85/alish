import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isSoundOn = false;
  bool isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildAccountInfoCard(),
            _buildPurchaseProCard(),
            _buildSettingsCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountInfoCard() {
    return Card(
      color: Color(0xFF101010),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38.0),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: Image.asset(
            'assets/eye.png',
            width: 50,
          ),
          title: Text(
            'name@gmail.com',
            style: TextStyle(
              color: Color(0xFF6F6F6F),
              fontSize: 24,
              fontFamily: 'K_Gotham Pro',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPurchaseProCard() {
    return Card(
      color: Color(0xFF101010),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(38.0),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity, // Make button take all horizontal space
          child: ElevatedButton(
            child: Text('Купить Pro'),
            onPressed: () {
              // Код покупки Pro
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF003AFF),
              onPrimary: Color(0xFF6F6F6F),
              textStyle: TextStyle(
                fontSize: 18,
                fontFamily: 'K_Gotham Pro',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard() {
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
            ListTile(
              leading: Image.asset(
                'assets/settings.png',
                width: 50,
              ),
              title: Text(
                'Настройки',
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontSize: 24,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
              trailing: Text(
                'RU/KZ',
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontSize: 18,
                  fontFamily: 'K_Gotham Pro',
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SwitchListTile(
              title: Text(
                'Звук',
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontSize: 18,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
              value: isSoundOn,
              onChanged: (value) {
                setState(() {
                  isSoundOn = value;
                });
              },
              activeColor: Colors.white,
            ),
            SwitchListTile(
              title: Text(
                'Уведомления',
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontSize: 18,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
              value: isNotificationOn,
              onChanged: (value) {
                setState(() {
                  isNotificationOn = value;
                });
              },
              activeColor: Colors.white,
            ),
            TextButton(
              onPressed: () {
                // Написать разработчикам
              },
              child: Text(
                'Написать разработчикам',
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontSize: 18,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Политика конфиденциальности
              },
              child: Text(
                'Политика конфиденциальности',
                style: TextStyle(
                  color: Color(0xFF6F6F6F),
                  fontSize: 18,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Выйти
              },
              child: Text(
                'Выйти',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'K_Gotham Pro',
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
