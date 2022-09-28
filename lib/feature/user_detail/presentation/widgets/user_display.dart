import 'package:clean_code_practice/feature/user_detail/presentation/pages/initial_page.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user_entities.dart';

class UserInfoDisplay extends StatelessWidget {
  final UserEntity userEntity;
  const UserInfoDisplay({Key? key, required this.userEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(userEntity.avatar),
            Container(
              height: 30,
            ),
            Text(
              "FIRST NAME: ${userEntity.firstName} ",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              " LAST NAME:${userEntity.lastName} ",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "EMAIL: ${userEntity.email} ",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "ID: ${userEntity.id}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            // TextButton(
            //     onPressed: () {
            //       Navigator.pop(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const InitialPage()),
            //       );
            //     },
            //     child: Text(
            //       "GO BACK",
            //       style: TextStyle(
            //           backgroundColor: Colors.grey.shade400,
            //           color: Colors.black,
            //           fontSize: 25),
            //     ))
          ],
        ),
      ),
    );
  }
}
