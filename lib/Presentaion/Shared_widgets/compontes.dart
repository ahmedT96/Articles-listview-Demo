import 'package:flutter/material.dart';

Widget mainContainer(
    {required BuildContext context,
    required String containerName,
    required Function() function}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      height: MediaQuery.of(context).size.height / 20,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              containerName,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.grey,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    ),
  );
}

Widget mainDivider() {
  return const Divider(
    color: Colors.black,
    thickness: 2,
  );
}

Widget mainText({required String textName}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Text(textName,
        style: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
  );
}
