import 'package:flutter/material.dart';

SizedBox todayClothing(String clothingRecommendation) {
  return SizedBox(
    width: 420,
    height: 250,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '今日の服装は...',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  clothingRecommendation,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
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
