import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialogs in Flutter"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// this is [AlertDialog]
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Log out"),
                        content:
                            const Text("Are you sure you want to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              const snackBar = SnackBar(
                                  content:
                                      Text("You have logged out sucessfully"));

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.pop(context);
                            },
                            child: const Text("Log out"),
                          )
                        ],
                      );
                    });
              },
              child: const Text("Alert Dialog"),
            ),

            /// this is [Simple Dialog]
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return const SimpleDialog(
                      title: Text("User Accounts"),
                      children: [
                        ListTile(
                          title: Text("mustafaaktar294@gmail.com"),
                          subtitle: Text("Google Account"),
                          leading: CircleAvatar(child: FlutterLogo()),
                        ),
                        ListTile(
                          title: Text("mustafaaktar294@gmail.com"),
                          subtitle: Text("Google Account"),
                          leading: CircleAvatar(child: FlutterLogo()),
                        ),
                        ListTile(
                          title: Text("mustafaaktar294@gmail.com"),
                          subtitle: Text("Google Account"),
                          leading: CircleAvatar(child: FlutterLogo()),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Simple Dialog"),
            ),

            /// this is [Full Screen Dialog]
            ElevatedButton(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, animation1) {
                    return MyFullScreenDialog();
                  },
                );
              },
              child: const Text("Full Screen Dialog"),
            ),

            /// this is cupertino style dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("Cupertino Dialog sample"),
                        content: const Text("This is subtitle"),
                        actions: [
                          CupertinoButton(
                              child: const Text("ok"),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ],
                      );
                    });
              },
              child: const Text("Cupertino Alert Dialog"),
            ),

            /// this is bottomsheet in flutter
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(context: context, builder: (context) {
                  return const Center(
                    child: Text("this is bottom sheet"),
                  );
                });
              },
              child: const Text("Bottom Sheet"),
            )
          ],
        ),
      ),
    );
  }
}

/// full screen dialog widget
class MyFullScreenDialog extends StatelessWidget {
  const MyFullScreenDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
            const ListTile(
              title: Text("mustafaaktar294@gmail.com"),
              subtitle: Text("Google Account"),
              leading: CircleAvatar(child: FlutterLogo()),
            ),
            const ListTile(
              title: Text("mustafaaktar294@gmail.com"),
              subtitle: Text("Google Account"),
              leading: CircleAvatar(child: FlutterLogo()),
            ),
            const ListTile(
              title: Text("mustafaaktar294@gmail.com"),
              subtitle: Text("Google Account"),
              leading: CircleAvatar(child: FlutterLogo()),
            ),
          ],
        ),
      ),
    );
  }
}
