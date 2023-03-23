import 'package:flutter/material.dart';

class SimpleAppBarPopupMenuButton extends StatelessWidget {
  const SimpleAppBarPopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              PopupMenuButton(
                shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.circular(20).copyWith(topRight: Radius.circular(0))
                    borderRadius: BorderRadius.circular(20)
                ),
                padding: EdgeInsets.all(10),
                elevation: 10,
                color: Colors.grey.shade100,
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 4, color: Colors.blue)],
                      color: Colors.white,
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.blue,
                  ),
                ),
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$value item pressed')));
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                        value: 'Home',
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        )),
                    PopupMenuItem(
                        value: 'Chats',
                        child: Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.chat,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Chats',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        )),
                    PopupMenuItem(
                        value: 'Sign out',
                        child: Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Sign out',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        )),
                  ];
                },
              )
            ],
          ),
          body: Center(
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(20).copyWith(topRight: Radius.circular(0))
                  borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(10),
              elevation: 10,
              color: Colors.grey.shade100,
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 4, color: Colors.blue)],
                    color: Colors.white,
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
              ),
              onSelected: (value) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$value item pressed')));
              },
              itemBuilder: (context) => [
                // popupmenu item 1
                PopupMenuItem(
                  value: "Get The App",
                  // row has two child icon and text.
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("Get The App")
                    ],
                  ),
                ),
                // popupmenu item 2
                PopupMenuItem(
                  value: "About",
                  // row has two child icon and text
                  child: Row(
                    children: [
                      Icon(Icons.chrome_reader_mode),
                      SizedBox(
                        // sized box with width 10
                        width: 10,
                      ),
                      Text("About")
                    ],
                  ),
                ),
              ],
              offset: Offset(0, 100),
            ),
          ),
        ));
  }
}

