import 'package:drawer/model/member.dart';
import 'package:drawer/pages/member/member_detail.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {

  final names = [
      Member("Don"),
      Member("Max"),
      Member("Chester"),
      Member("Hawkins"),
      Member("Yuk"),
      Member("Miyako"),
      Member("Jet"),
      Member("Ethan"),
      Member("Ells"),
      Member("James"),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: ListView.separated(
            itemBuilder: (context, index) => Container (
              child: ListTile (
                title: Text(names[index].name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemberDetailPage(),
                      // Pass the arguments as part of the RouteSettings. The
                      // DetailScreen reads the arguments from these settings.
                      settings: RouteSettings(
                        arguments: names[index],
                      ),
                    ),
                  );
                }
              ),
              height: 60,
            ),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
            ),
            itemCount: names.length,
          )
        )
    );
  }
}
