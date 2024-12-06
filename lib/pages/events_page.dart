import 'package:flutter/material.dart';
import '../widgets/event_card.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
} 

class _EventsPageState extends State<EventsPage> {
  List<Map<String, String>> events = [
    {"title": "OG", "date": "2024-12-10"},
    {"title": "PSG-LGD", "date": "2024-12-12"},
    {"title": "TEAM SPIRIT", "date": "2024-12-15"},
    {"title": "TEAM OLD G", "date": "2024-12-16"}
  ];

  void _editEvent(int index) {
    final event = events[index];
    final titleController = TextEditingController(text: event['title']);
    final dateController = TextEditingController(text: event['date']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Teams'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Teams Title'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Teams Date'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                events[index] = {
                  'title': titleController.text,
                  'date': dateController.text,
                };
              });
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  void _addEvent() {
    final titleController = TextEditingController();
    final dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Teams'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Teams Title'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Teams Date'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                events.add({
                  'title': titleController.text,
                  'date': dateController.text,
                });
              });
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teams')),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return EventCard(
            title: events[index]['title']!,
            date: events[index]['date']!,
            onEdit: () => _editEvent(index),
            onDelete: () => _deleteEvent(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
