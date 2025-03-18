import 'package:flutter/material.dart';

class DoctorAppointmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointments",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: SizedBox(),
      ),
      body: Column(
        children: [
          SearchBarWidget(),
          DateSelectorWidget(),
          Expanded(child: AppointmentsListWidget()),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color(0xFFD0DAEC),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Text("Sort by", style: TextStyle(color: Colors.blue, fontSize: 14)),
        ],
      ),
    );
  }
}

class DateSelectorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            "February 2025",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                9,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          index == 7 ? Colors.blue[900] : Colors.white,
                      foregroundColor: index == 7 ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("${index + 1}"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        bool isUpcoming = index < 2;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index == 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Saturday 8/2/2025",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ListTile(
              title: Text("Ahmed Khaled"),
              subtitle: Text("5:00PM"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isUpcoming ? Colors.blue : Colors.grey,
                      ),
                    ),
                    child: Text(
                      isUpcoming ? "Upcoming" : "Completed",
                      style: TextStyle(
                        color: isUpcoming ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
