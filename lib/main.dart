import 'package:flutter/material.dart';
import 'TiffinServicePage.dart';
import 'userProfile.dart';
import 'fooddeliverypage.dart';
import 'AiDietPlan.dart';
import 'tiffincart.dart';
import 'foodcart.dart';
import 'healthTracker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What The Food',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: HomePage(),
      routes: {
        '/tiffin_service': (context) => TiffinServicePage(),
        '/aiDietPlan': (context) => QuizPage(),
        '/cart': (context) => TiffinCart(),
        '/food' : (context) => FoodDeliveryPage(),
        '/foodcart' : (context) => FoodCart(),
        '/tracker' : (context) => HealthTracker(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfoSection(context),
              _buildSearchBar(),
              _buildSectionTitle('Quick Actions'),
              _buildQuickActions(context),
              _buildSectionTitle('Nutrient Tracker'),
              _buildNutrientTracker(),
              _buildTrackButton(context),
              _buildSectionTitle('Health Score'),
              _buildHealthSection(),
              _buildSectionTitle('Offers & Tips'),
              _buildOffersSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildUserInfoSection(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserProfile())),
      child: Card(
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFFD8469),
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shantanu Pandey',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '1276D, Garden colony, Ranjit Nagar, Kharar Bus Stand, 140301',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('POINTS',
                        style: TextStyle(fontSize: 10, color: Colors.orange)),
                    Text('456', style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Here',
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.orange),
          suffixIcon: Icon(Icons.mic, color: Colors.orange),
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
            context, 'Tiffin', 'assets/tiffin.png', '/tiffin_service'),
        _buildActionButton(
            context, 'Food Delivery', 'assets/delivery.png', '/food'),
        _buildActionButton(
            context, 'AI Diet Plan', 'assets/plan.png', '/aiDietPlan'),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String label,
      String imagePath, String? route) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (route != null) {
            Navigator.pushNamed(context, route);
          }
        },
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutrientTracker() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // Light salmon color for the background
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildNutrientItem('MACRO', 60, Colors.purple),
            SizedBox(height: 10),
            buildNutrientItem('MICRO', 80, Colors.red),
            SizedBox(height: 10),
            buildNutrientItem('CALORIES', 45, Colors.yellow),
          ],
        ),
      ),
    );
  }

  Widget buildNutrientItem(String label, int percentage, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                //color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$percentage%',
              style: TextStyle(
                //color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: Colors.white70.withOpacity(1),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }

  Widget _buildTrackButton(context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: ElevatedButton(
        child: Text('TRACK'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HealthTracker()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildHealthSection() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Health Score', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.orange)),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('67/100', style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                'Increase your daily consumption of Zinc by 4mg.',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOffersSection() {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          _buildOfferItem(
              'Offers', 'Flat Discounts', Icons.percent, Colors.lightBlueAccent,
              Colors.blueAccent),
          _buildOfferItem(
              'Health Tips', 'Top Dieticians', Icons.health_and_safety_outlined,
              Colors.lightGreenAccent, Colors.greenAccent),
          _buildOfferItem(
              'Ayurvedics', 'Explore', Icons.accessibility_new_rounded,
              Colors.tealAccent, Colors.teal),
          _buildOfferItem(
              'Watch Videos', 'Explore', Icons.video_collection_rounded,
              Colors.redAccent, Colors.deepOrangeAccent),
        ],
      ),
    );
  }

  Widget _buildOfferItem(String title, String subtitle, IconData icon,
      Color gradientStart, Color gradientEnd) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [gradientStart, gradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                    SizedBox(height: 5),
                    Text(subtitle,
                        style: TextStyle(fontSize: 14, color: Colors.white70)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                      Icons.arrow_forward, color: gradientEnd, size: 20),
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: 30,
            child: Icon(icon, size: 40, color: Colors.white.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      // Increased horizontal margin
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(context, Icons.home, 0),
          _buildNavItem(context, Icons.store, 1),
          _buildNavItem(context, Icons.shopping_cart, 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, int index) {
    bool isSelected = index ==
        0; // Assuming home is always selected for this example
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            break;
          case 1:
          // Navigate to store page
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.withOpacity(0.1) : Colors
              .transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.orange : Colors.black54,
          size: 28,
        ),
      ),
    );
  }
}