import 'package:flutter/material.dart';

import '../../../../data/models/education.dart';
import 'education_ui_detail.dart';

class EducationList extends StatelessWidget {
  const EducationList({
    Key? key,
    required this.education,
  }) : super(key: key);
  final Education education;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EducationDetail(
              education: education,
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 7,
          width: MediaQuery.of(context).size.width / 1.4,
          child: Column(
            children: [
              Image.network(
                'https://placeimg.com/640/480/any',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 16,
                    right: 16,
                  ),
                  child: Text(
                    education.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 16,
                    right: 16,
                  ),
                  child: Text(
                    education.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
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

//     return SizedBox(
//       height: 250,
//       child: Container(
//         margin: const EdgeInsets.only(right: 10),
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => EducationDetail(
//                   education: education,
//                 ),
//               ),
//             );
//           },
//           child: Column(
//             children: [
//               EducationImageContainer(
//                 education: education,
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 imageUrl: education.imageUrl,
//               ),
//               Text(
//                 education.title,
//                 maxLines: 2,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
