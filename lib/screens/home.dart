import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_clone_ui/models/chats_model.dart';
import 'package:messenger_clone_ui/models/story_model.dart';
import 'package:messenger_clone_ui/screens/people_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, Object>> _pages = [
    {
      'page': Home(),
      'title': 'Chats',
    },
    {
      'page': PeopleScreen(),
      'title': 'People',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://z-p3-scontent.flos9-1.fna.fbcdn.net/v/t1.0-9/p720x720/60653187_1321016204740963_7852033814405578752_o.jpg?_nc_cat=103&_nc_sid=85a577&_nc_ohc=arxKBRJjolsAX-lh4Zu&_nc_ht=z-p3-scontent.flos9-1.fna&_nc_tp=6&oh=f44def8d048495f8e7880606d967f1e5&oe=5EB5D281'),),
            ),
            
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.solidEdit, color: Colors.black),
            onPressed: null,
          )
        ],
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidComment),
            title: Text('Chats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('People'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 10.0),
                child: Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dummyImages.length,
                  itemBuilder: (_, index) {
                    return Container(
                      width: 80,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              NetworkImage(dummyImages[index].image),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemCount: dummyText.length,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 80,
                      child: ListTile(
                        leading: Container(
                          height: 80,
                          width: 55,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                NetworkImage(dummyText[index].image),
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              dummyText[index].name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                dummyText[index].isRed == true ? Text(
                                  dummyText[index].message,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ) : Text(
                                  dummyText[index].message,
                                  style: TextStyle(),
                                ),
                                Text(
                                  " ・${dummyText[index].time}",
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            dummyText[index].isRed == true
                                ? Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  )
                                : Text(""),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
