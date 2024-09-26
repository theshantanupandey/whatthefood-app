import 'package:flutter/material.dart';
import 'userProfile.dart';
import 'main.dart';


class FoodDeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                _buildTopSection(context),
                _buildAdvtSection(),
                _buildQuickPicksSection(),
                SizedBox(
                  height: 200, // Adjust the height as needed
                  child: _buildCategoryGrid(),
                ),
                _buildQuickPicksSection(),
                _buildRestaurantsNearby(),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomNavBar(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildUserInfoSection(context),
          SizedBox(height: 16),
          _buildSearchBar(),
          SizedBox(height: 16),
          _buildDealsSection(),
        ],
      ),
    );
  }

  Widget _buildUserInfoSection(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserProfile())),
      child: Card(
        margin: const EdgeInsets.all(3),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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

  Widget _buildDealsSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Crazy Deals Get Crazier',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Items Starting at\nRs. 50',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 12),

            ],
          ),
        ),
        Image.asset(
          'assets/sale.png',
          width: 130,
          height: 130,
        ),
      ],
    );
  }

  Widget _buildAdvtSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.yellow[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NIC Ice creams',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Items at Rs. 179*',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Alphonso mango mania',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Order Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                      foregroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/OIP.jpeg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categories = ['Pizzas', 'North Ind', 'South Ind', 'Rolls', 'Pasta', 'Biryani', 'Shakes', 'Cakes'];
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(child: Icon(Icons.fastfood)),
            SizedBox(height: 4),
            Text(categories[index], style: TextStyle(fontSize: 12)),
          ],
        );
      },
    );
  }

  Widget _buildQuickPicksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text('QUICK PICKS FOR YOU',
              style: TextStyle(fontSize:17,fontWeight: FontWeight.bold)),
        ),
        Container(
          height:180, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6, // Number of cards
            itemBuilder: (context, index) {
              return Container(
                width: 120, // Adjust the width as needed
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Dominik pizza',
                        style: TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
                    Text('₹47-20-25 mins',
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
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
            Navigator.pushReplacementNamed(context, '/foodcart');
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

  Widget _buildRestaurantsNearby() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Top 100 Restaurants to Choose From',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,  // Adjust this number based on your data source
          itemBuilder: (context, index) {
            return _buildRestaurantCard();
          },
        ),
      ],
    );
  }

  Widget _buildRestaurantCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 150.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dominik Pizza',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16.0, color: Colors.orange),
                        SizedBox(width: 4.0),
                        Text('4.7'),
                        SizedBox(width: 8.0),
                        Text('•'),
                        SizedBox(width: 8.0),
                        Text('20-25 mins'),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'South Indian, Pizza, Fast Food',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'Sector 117 • 6km',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}