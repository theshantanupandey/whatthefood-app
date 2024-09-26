import 'package:flutter/material.dart';
import 'main.dart';

class TiffinCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusButtons(),
            SizedBox(height: 16),
            _buildDateSection(),
            _buildWeekDaySelector(),
            SizedBox(height: 16),
            MealSection(title: 'LUNCH'),
            SizedBox(height: 16),
            MealSection(title: 'DINNER'),
            SizedBox(height: 16),
            PlanWidget(),
            SizedBox(height: 16),
            BillingWidget(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      //leading: IconButton(
        //icon: Icon(Icons.arrow_back, color: Colors.black),
        //onPressed: () => Navigator.of(context).pop(),
      //),
      title: Text('Tiffin Cart', style: TextStyle(color: Colors.black)),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline, color: Colors.orange),
          onPressed: () {
            // Add action for info button if needed
          },
        ),
      ],
    );
  }
}

class StatusButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildStatusButton('Breakfast', Colors.orange),
          _buildDeliveredStatus(),
        ],
      ),
    );
  }

  Widget _buildStatusButton(String text, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildDeliveredStatus() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: Colors.white, size: 14),
          ),
          SizedBox(width: 6),
          Text(
            'Delivered',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDateSection() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today, 14 Oct 2023',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.chevron_right, color: Colors.red),
      ],
    ),
  );
}

Widget _buildWeekDaySelector() {
  return Container(
    height: 70,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildDayCard('Mon', '12', isCompleted: true),
        _buildDayCard('Tue', '13', isCompleted: true),
        _buildDayCard('Wed', '14', isSelected: true),
        _buildDayCard('Thu', '15'),
        _buildDayCard('Fri', '16'),
        _buildDayCard('Sat', '17'),
        _buildDayCard('Sun', '18'),
        _buildDayCard('Mon', '19', isSelected:false),
        _buildDayCard('Tue', '20', isSelected:false),
        _buildDayCard('Wed', '21', isSelected:false),
        _buildDayCard('Thu', '22', isSelected:false),
        _buildDayCard('Fri', '23', isSelected:false),
        _buildDayCard('Sat', '24', isSelected:false),
        _buildDayCard('Sun', '25', isSelected:false),
        _buildDayCard('Mom', '26', isSelected:false),
        _buildDayCard('Tue', '27', isSelected:false),
        _buildDayCard('Wed', '27', isSelected:false),
        _buildDayCard('Thu', '29', isSelected:false),
        _buildDayCard('Fri', '30', isSelected:false),
        _buildDayCard('Sat', '31', isSelected:false),
        _buildDayCard('Sun', '01', isSelected:false),
      ],
    ),
  );
}

Widget _buildDayCard(String day, String date, {bool isCompleted = false, bool isSelected = false}) {
  Color bgColor = Colors.transparent;
  Color textColor = Colors.black;

  if (isCompleted) {
    bgColor = Colors.green;
    textColor = Colors.white;
  } else if (isSelected) {
    bgColor = Colors.orange;
    textColor = Colors.white;
  }

  return Container(
    width: 50,
    margin: EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(day, style: TextStyle(color: textColor)),
        SizedBox(height: 4),
        Text(date, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}


class MealSection extends StatelessWidget {
  final String title;

  MealSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        MealCard(),
      ],
    );
  }
}

class MealCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'North Indian Thali -2R',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Change',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MealItem(name: 'Mixed Veg', imagePath: 'assets/mixedveg.png'),
              MealItem(name: 'Daal Fry', imagePath: 'assets/daal.png'),
              MealItem(name: 'Rice', imagePath: 'assets/rice.png'),
              MealItem(name: 'Tava Roti', imagePath: 'assets/roti.png'),
              MealItem(name: 'Sweet Dish', imagePath: 'assets/sweet.png'),
            ],
          ),
        ],
      ),
    );

  }
}

class MealItem extends StatelessWidget {
  final String name;
  final String imagePath;

  MealItem({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        SizedBox(height: 4),
        Text(
          name,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class PlanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Plan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student plan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '₹4300 savings',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Upgrade'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BillingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Billing',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          BillingRow(title: 'Todays total', amount: '₹140'),
          BillingRow(title: 'Delivery Fee', amount: '₹50'),
          BillingRow(title: 'Convenience Fee', amount: '₹5'),
          BillingRow(title: 'GST & Packaging Charges', amount: '₹50'),
          Divider(),
          BillingRow(title: 'Total', amount: '₹245'),
          BillingRow(title: 'Student Plan Discount', amount: '-₹110', isDiscount: true),
          Divider(),
          BillingRow(title: 'Payable', amount: '₹135', isPayable: true),
          SizedBox(height: 8),
          Text(
            '*We dont provide physical bills.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    ),
    ),
    ],
    );
  }
}

class BillingRow extends StatelessWidget {
  final String title;
  final String amount;
  final bool isDiscount;
  final bool isPayable;

  BillingRow({
    required this.title,
    required this.amount,
    this.isDiscount = false,
    this.isPayable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isPayable ? FontWeight.bold : FontWeight.normal,
              color: isDiscount ? Colors.red : Colors.black,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: isPayable ? FontWeight.bold : FontWeight.normal,
              color: isDiscount ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
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
