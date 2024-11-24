// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vnac365/presentation/quiz/controller/quiz_controller.dart';

// class ReviewScreen extends StatelessWidget {
//   final QuizController controller = Get.find<QuizController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Review Quiz')),
//       body: ListView.builder(
//         itemCount: controller.questions.length,
//         itemBuilder: (context, index) {
//           final question = controller.questions[index];
//           final userAnswers = controller.selectedAnswers;

//           return Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${index + 1}. ${question.text}',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Column(
//                   children: List.generate(
//                     question.options.length,
//                     (optionIndex) {
//                       final option = question.options[optionIndex];
//                       final isCorrect = option.isCorrect;
//                       final isSelected = userAnswers.contains(optionIndex);

//                       return Container(
//                         padding: EdgeInsets.all(10),
//                         margin: EdgeInsets.only(bottom: 8),
//                         decoration: BoxDecoration(
//                           color: isSelected
//                               ? (isCorrect ? Colors.blue[50] : Colors.red[50])
//                               : (isCorrect ? Colors.green[50] : null),
//                           border: Border.all(
//                             color: isCorrect
//                                 ? Colors.green
//                                 : (isSelected ? Colors.red : Colors.grey[300]!),
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Text(
//                           option.text,
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: isSelected
//                                 ? (isCorrect ? Colors.blue : Colors.red)
//                                 : Colors.black,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
