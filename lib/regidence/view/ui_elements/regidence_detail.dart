import 'package:flutter/material.dart';
import 'package:flutter_tutorial/regidence/model/regidence.dart';

class HouseDetailWidget extends StatelessWidget {
  final Regidence regidence;

  const HouseDetailWidget({Key? key, required this.regidence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: List.generate(
                regidence.imagePath.length,
                (int imgIndex) => Expanded(
                  child: Image.network(regidence.imagePath[imgIndex]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 2.0, bottom: 1.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  regidence.buildingNamePath,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 1.0, bottom: 4.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  regidence.roomPrice,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 1.0, bottom: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.train, size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      regidence.nearStation,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 1.0, bottom: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      regidence.roomSize,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 1.0, bottom: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.house_siding_sharp, size: 15),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      regidence.buildingSize,
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        icon: const Icon(
                          Icons.restore_from_trash,
                          color: Colors.grey,
                        ),
                        label: const Text(
                          '興味なし',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: SizedBox(
                      width: 160,
                      height: 40,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                        label: const Text(
                          'お気に入り',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
