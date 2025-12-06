import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// For date formatting

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime selectedDate = DateTime.now(); // Default to today
  int? selectedDay;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000), // Start from year 2000
      lastDate: DateTime(2100), // Up to year 2100
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "House / Flat / Block No.",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Apartment / Road",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Area",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // **Date Picker Row**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Selected Date: ", style: TextStyle(fontSize: 16)),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(DateFormat('dd/MM/yyyy').format(selectedDate)), // Correct date formatting
                  ),
                ],
              ),

              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(31, (index) {
                          int day = index + 1;
                          return ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedDay = day;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: selectedDay == day ? Colors.orange : Colors.blue,
                            ),
                            child: Text("$day"),
                          );
                        }),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Continue Appointment"),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date Slot :"),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Start Date",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "End Date",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
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
