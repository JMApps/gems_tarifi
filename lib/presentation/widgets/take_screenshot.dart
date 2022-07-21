import 'package:flutter/material.dart';
import 'package:gems_tarifi/data/model/content_model_item.dart';

class TakeScreenShot extends StatelessWidget {
  const TakeScreenShot({Key? key, required this.item}) : super(key: key);

  final ContentModelItem item;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Wrap(
        children: [
          ListView(
            controller: ScrollController(),
            shrinkWrap: true,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 1,
                margin: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown[800],
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.brown.withOpacity(0.1), BlendMode.dstATop),
                      image: AssetImage('assets/images/pattern.jpg'),
                      fit: BoxFit.fill,
                    )
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.contentForShare,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Шейх ‘Абдуль-‘Азиз ат-Тарифи',
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Divider(indent: 16, endIndent: 16, color: Colors.white,),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/asgp.png',
                            width: 70,
                            height: 40,
                          ),
                          const SizedBox(width: 16),
                          Image.asset(
                            'assets/images/pearl_50.png',
                            width: 40,
                            height: 40,
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            'Жемчужины Тарифи',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Gilroy',
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}