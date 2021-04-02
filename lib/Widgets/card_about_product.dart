import 'package:flutter/material.dart';

class CardAboutProduct extends StatelessWidget {
  final String category;

  CardAboutProduct(
    this.category,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'About Product',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.25*.25,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Category',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.25*.22,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),),

                Expanded(
                  flex: 5,
                  child:  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.green.shade700),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize:MediaQuery.of(context).size.width * 0.25*.22,
                      ),
                    ),
                  ),
                ),)

              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
