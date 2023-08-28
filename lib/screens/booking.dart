import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  @override
  _Booking createState() => _Booking();
}

class _Booking extends State<BookingScreen> {
  final List<Tab> tabs = <Tab>[
    Tab(text: 'Process'),
    Tab(text: 'Complete'),
    Tab(text: 'Cancelled'),
  ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Booking'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 46,
              child: TabBar(
                tabs: tabs,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  BookingList(bookingList: bookingList1),
                  BookingList(bookingList: bookingList2),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/home.png"),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/booking.png"),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/inbox.png"),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/account.png"),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

class Booking {
  final String orderId;
  final String from;
  final String to;
  final String date;
  final String paymentStatus;
  final String airWay;

  Booking({
    required this.orderId,
    required this.from,
    required this.to,
    required this.date,
    required this.paymentStatus,
    required this.airWay,
  });
}

class BookingList extends StatelessWidget {
  final List<Booking> bookingList;

  BookingList({required this.bookingList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: bookingList.length,
      itemBuilder: (context, index) {
        final booking = bookingList[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                padding: EdgeInsets.only(top: 10.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey[50]!.withOpacity(0.3), Colors.transparent],
                    begin: Alignment.bottomRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset("assets/dot.png"),
                    ),
                    Text(
                      '${booking.paymentStatus}',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/plane.png",
                        ),
                        SizedBox(width: 15.0),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${booking.from}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset("assets/arrow.png"),
                                Text(
                                  '${booking.to}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '${booking.airWay}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '${booking.date}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10.0),
                        Image.asset(
                          "assets/arrow2.png",
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Container(
                      height: 2.0,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Order ID: ${booking.orderId}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<Booking> bookingList1 = [
  Booking(
    orderId: '1120AKKA2B',
    from: 'Jakarta, Indonedia',
    to: 'Tokyo, Japan',
    date: 'Mon, 24 May 21 - 05:00',
    paymentStatus: 'WAITING PAYMENT',
    airWay: 'Lion Air',
  ),
];

List<Booking> bookingList2 = [
  Booking(
    orderId: '1119AKKA2B',
    from: 'Bali, Indonedia',
    to: 'Seoul, South Korea',
    date: 'Mon, 24 May 21 - 12:00',
    paymentStatus: 'WAITING PAYMENT',
    airWay: 'Lion Air',
  ),
];
