import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marksheet_scanner/output/widgets/header-text.dart';

class Output extends StatelessWidget {
  const Output(
      {super.key,
      required this.subjects,
      required this.date,
      required this.grandTotal,
      required this.result,
      required this.name,
      required this.roll,
      required this.campus,
      required this.yearPart,
      required this.examType,
      required this.level,
      required this.program,
      required this.crn});

  final List<String> subjects;
  final String date,
      crn,
      grandTotal,
      result,
      name,
      roll,
      campus,
      yearPart,
      examType,
      level,
      program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: showOutput(subjects),
          ),
        ));
  }

  Widget? showOutput(List<String> subjects) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          headerComponent(
              name, examType, roll, campus, yearPart, level, program, crn),
          const SizedBox(
            height: 20.0,
          ),
          // tableComponent(),
          tableComponent(subjects),
          const SizedBox(
            height: 30.0,
          ),
          footerComponent(date, grandTotal, result)
        ],
      ),
    );
  }
}

Widget headerComponent(String name, String examType, String roll, String campus,
    String yearPart, String level, String program, String crn) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/tu_logo.png',
            height: 90.0,
          ),
          Flexible(
            child: Column(
              children: [
                const HeaderText(
                  text: 'Tribhuvan University',
                  fontSize: 16,
                ),
                const HeaderText(
                  text: 'Institute of Engineering',
                  fontSize: 16,
                ),
                const HeaderText(
                  text: 'Examination Control Division',
                  fontSize: 16,
                ),
                const HeaderText(
                  text: 'Chakupat, Lalitpur',
                  fontSize: 12,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                HeaderText(
                  text: examType,
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const HeaderText(
                  text: 'STATEMENT OF MARKS',
                  fontSize: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                  text: name,
                  textHeight: 1.6,
                ),
                HeaderText(
                  text: 'Level:- $level',
                  textHeight: 1.6,
                ),
                HeaderText(
                  text: campus,
                  textHeight: 1.6,
                ),
                HeaderText(
                  text: yearPart,
                  textHeight: 1.6,
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                  text: roll,
                  textHeight: 1.6,
                ),
                HeaderText(
                  text: 'CRN:- $crn',
                  textHeight: 1.6,
                ),
                const HeaderText(
                  text: 'T.U. Regd. No:-',
                  textHeight: 1.6,
                ),
                HeaderText(
                  text: 'Programme:- $program',
                  textHeight: 1.6,
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}

Widget tableComponent(List<String> subjects) {
  return Column(children: [
    Row(
      children: [
        Expanded(
          flex: 3,
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(10),
            },
            border: const TableBorder(
                right: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black)),
            children: const [
              TableRow(
                decoration: BoxDecoration(color: Colors.white),
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 18,
                      child: Text('Subjects',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                              fontFamily: 'Times',
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(10),
              1: FlexColumnWidth(10),
              2: FlexColumnWidth(10),
            },
            border: const TableBorder(
                verticalInside: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black)),
            children: [
              TableRow(
                decoration: const BoxDecoration(color: Colors.white),
                children: [
                  buildCell('Full Marks',
                      color: Colors.black, isFontBold: true),
                  buildCell('Pass Marks',
                      color: Colors.black, isFontBold: true),
                  buildCell('Marks Obtained',
                      color: Colors.black, isFontBold: true),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(50),
              1: FlexColumnWidth(50),
            },
            border: const TableBorder(
                verticalInside: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
                top: BorderSide(color: Colors.black)),
            children: [
              TableRow(
                decoration: const BoxDecoration(color: Colors.white),
                children: [
                  buildCell('', color: Colors.black, isFontBold: true),
                  buildCell('', color: Colors.black, isFontBold: true),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    Table(
      columnWidths: const {
        0: FlexColumnWidth(12),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
        7: FlexColumnWidth(2),
        8: FlexColumnWidth(2),
        9: FlexColumnWidth(2),
      },
      border: const TableBorder(
        verticalInside: BorderSide(color: Colors.black),
        left: BorderSide(color: Colors.black),
        right: BorderSide(color: Colors.black),
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(color: Colors.white),
          children: [
            buildCell('Code     Title',
                color: Colors.black,
                isFontBold: true,
                textAlign: TextAlign.start),
            buildCell('Asst.', color: Colors.black, isFontBold: true),
            buildCell('Final', color: Colors.black, isFontBold: true),
            buildCell('Asst.', color: Colors.black, isFontBold: true),
            buildCell('Final', color: Colors.black, isFontBold: true),
            buildCell('Asst.', color: Colors.black, isFontBold: true),
            buildCell('Final', color: Colors.black, isFontBold: true),
            buildCell('Total', color: Colors.black, isFontBold: true),
            buildCell('Remarks', color: Colors.black, isFontBold: true),
          ],
        ),
      ],
    ),
    Table(
      columnWidths: const {
        0: FlexColumnWidth(12),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
        7: FlexColumnWidth(2),
        8: FlexColumnWidth(2),
        9: FlexColumnWidth(2),
      },
      border: TableBorder.all(
        color: Colors.black,
        style: BorderStyle.solid,
      ),
      children: subjects.map((subject) {
        return TableRow(
          decoration: const BoxDecoration(color: Colors.white),
          children: [
            buildCell(subject, isFontBold: true, textAlign: TextAlign.start),
            buildCell('20'),
            buildCell('80'),
            buildCell('8'),
            buildCell('32'),
            buildCell('19'),
            buildCell('37'),
            buildCell('56'),
            buildCell(''),
          ],
        );
      }).toList(),
    )
  ]);
}

Widget footerComponent(String date, String grandTotal, String result) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all()),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderText(
                    text: 'Marks Enter By:-',
                    textHeight: 1.6,
                  ),
                  const HeaderText(
                    text: 'Verified By:-',
                    textHeight: 1.6,
                  ),
                  HeaderText(
                    text: 'Date:- $date',
                    textHeight: 1.6,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(
                    text: 'Grand Total:- $grandTotal',
                    textHeight: 2.0,
                  ),
                  HeaderText(
                    text: 'Result:- $result',
                    textHeight: 2.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 5.0,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(text: '* - Fail   A - Absent'),
            Column(
              children: [
                SizedBox(
                  child: Image.asset(
                    'assets/images/tu_logo.png',
                    height: 50.0,
                  ),
                ),
                const HeaderText(text: 'Asst. Dean')
              ],
            )
          ],
        ),
      )
    ],
  );
}

Widget buildCell(dynamic text,
    {Color? color,
    bool isFontBold = false,
    TextAlign textAlign = TextAlign.center}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: SizedBox(
      height: 18,
      child: Text(text,
          style: TextStyle(
              color: color,
              fontSize: 12,
              fontFamily: 'Times',
              fontWeight: isFontBold ? FontWeight.bold : FontWeight.normal),
          textAlign: textAlign),
    ),
  );
}
