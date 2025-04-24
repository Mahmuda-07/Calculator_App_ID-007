import 'package:flutter/material.dart';
import 'calculator_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  mySnackBar(msg, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  myAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hello!!!"),
          content: Text("Do you want to delete?"),
          actions: [
            TextButton(
              onPressed: () {
                mySnackBar("Successful!!", context);
                Navigator.of(context).pop();
              },
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("No"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
         backgroundColor: Colors.blueGrey,
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () => mySnackBar("Search", context),
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () => mySnackBar("Settings", context),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              mySnackBar("Home", context);
              break;
            case 1:
              mySnackBar("Message", context);
              break;
            case 2:
              mySnackBar("Profile", context);
              break;
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 100, 163, 179)),
                accountName: Text("Name"),
                accountEmail: Text("Email"),
                currentAccountPicture:
                    Image.asset("assets/images/calculator.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => mySnackBar("Home", context),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text("Contact"),
              onTap: () => mySnackBar("Contact", context),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () => mySnackBar("Profile", context),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.white, width: 6),
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              child: Image.asset("assets/images/calculator.png"),
            ),

            SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton(
                onPressed: () => myAlertDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: Text("Alert Button"),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalculatorPage()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                child: Text("Open Calculator"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

