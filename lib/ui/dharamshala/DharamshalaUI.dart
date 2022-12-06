import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../util/ColorUtil.dart';
import '../startup/DashboardUI.dart';
import 'package:flutter_barsalutemple/util/Utils.dart';

class DharamshalaUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashState();
  }
}

class DashState extends State<DharamshalaUI> {
  var dharamshalaTitle = ["कुरुक्षेत्र धर्मशाला", "करनाल धर्मशाला", "पानीपत धर्मशाला", "पंचकुला धर्मशाला", "हरिद्वार धर्मशाला"];
  var dharamshalaIcon = [
    "https://firebasestorage.googleapis.com/v0/b/ror-app-e2234.appspot.com/o/dharamshala%2Fkurukshetra.png?alt=media&token=4c01b0c9-48b2-4a09-a69b-6d6a30c30150",
    "https://firebasestorage.googleapis.com/v0/b/ror-app-e2234.appspot.com/o/dharamshala%2Fkarnal.png?alt=media&token=d16d40a4-e5df-40e1-8f9b-6defaeea6e35",
    "https://firebasestorage.googleapis.com/v0/b/ror-app-e2234.appspot.com/o/dharamshala%2Fpanipat.png?alt=media&token=c5e5c9b4-e3bf-4bc0-84fa-f11cddf36a95",
    "https://firebasestorage.googleapis.com/v0/b/ror-app-e2234.appspot.com/o/dharamshala%2Fpanchkula.png?alt=media&token=55599883-fde4-44fb-9ef4-c2edecd770ae",
    "https://firebasestorage.googleapis.com/v0/b/ror-app-e2234.appspot.com/o/dharamshala%2Fharidwar.png?alt=media&token=215c2ef8-3a57-4aad-93db-cfe30ec668ec"
  ];
  var dharamshalaInfo = [
    "रोड़ धर्मशाला कुरुक्षेत्र का निर्माण 1984 ई० में हुआ था | रोड़ धर्मशाला कुरुक्षेत्र में कुल 108 कमरे हैं, इनमें 85 समान्य कमरे, 10 वातानुकूलित कमरे, 10 विशेष कमरे, 3 बड़े हाल, पार्किंग सुविधा और सी.टी.वी. कवरेज हैं | रोड़ धर्मशाला कुरुक्षेत्र में 24 घंटे मुफ्त लंगर सुविधा हैं |",
    "रोड़ धर्मशाला करनाल का निर्माण 1960 ई० में हुआ था | रोड़ धर्मशाला करनाल में कुल 44 कमरे हैं, इनमें 34 सामान्य कमरे, 10 वातानुकूलित कमरे, 5 हाल, 9 दुकानें, पार्किंग सुविधा और सी.टी.वी. कवरेज हैं | रोड़ महासभा को गुरु ब्रह्मानंद सरस्वती के नाम से सेक्टर-32 करनाल में हुडा विभाग की और से 3000.00 स्क्वायर मीटर का प्लाट आवंटित किया हुआ है जिसकी कीमत 1,52,25000/- हैं और उसके 67.00 लाख रु की क़िस्त रोड़ महासभा ने हुडा विभाग में जमा करवा दी गई हैं |",
    "रोड़ भवन पानीपत का निर्माण 1996 ई० में हुआ था | रोड़ धर्मशाला पानीपत में कुल 64 कमरें है इनमें 18 वातानुकूलित कमरे, 2 बड़े हाल, पार्किंग सुविधा और सी.टी.वी. कवरेज हैं |",
    "रोड़ भवन पंचकुला का निर्माण 2011 ई० में हुआ था | रोड़ धर्मशाला पंचकुला में 31 वातानुकूलित कमरे, 2 बड़े हाल, पार्किंग सुविधा और सी.टी.वी. कवरेज हैं |",
    "रोड़ धर्मशाला हरिद्वार का निर्माण 1924 ई० में हुआ था | रोड़ धर्मशाला हरिद्वार में कुल 95 कमरे हैं, इनमें 73 सामान्य कमरे, 10 वातानुकूलित कमरे, 12 विशेष कमरे, 1 हाल, पार्किंग सुविधा और सी.टी.वी. कवरेज हैं |"
  ];

  var dharamshalaLocation = [
    "29.968432871237287, 76.82501337755434",
    "29.6927635832523, 76.98769212565445",
    "29.413923748781823, 76.97009964098784",
    "30.72415180866837, 76.85580322568639",
    "29.937781657334398, 78.14062022935848"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: colorPrimary,

        title: Text(
          'धर्मशाला',
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 24),
        )
      ),
      body: SingleChildScrollView(
            child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10
                  ),
                  child: Card(
                    color: cardColor,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5,
                      bottom: 10,
                      left: 15,
                      right: 15),
                      child: InkWell(
                        onTap: (){
                          Utils.openMap(dharamshalaLocation[index], dharamshalaTitle[index]);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              dharamshalaTitle[index],
                              style: TextStyle(
                                color: textColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.0),
                            ),
                            SizedBox(height: 5),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child:
                                /*FadeInImage.assetNetwork(
                                  placeholder: PLACE_HOLDER_IMAGE,
                                  image: dharamshalaIcon[index],
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height * 0.30,
                                  fit: BoxFit.cover,
                                )*/
                                CachedNetworkImage(
                                    imageUrl: dharamshalaIcon[index],
                                    placeholder: (context, url) => PlaceHolderWidget(),
                                    width: MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height * 0.30,
                                    fit: BoxFit.cover
                                ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Click to open MAP",
                              style: TextStyle(
                                  color: mapColor,
                                  fontSize: 14.0),
                            ),
                            SizedBox(height: 15),
                            Text(
                              dharamshalaInfo[index],
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 18.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: dharamshalaIcon.length,
            ),
          )

    );
  }
}
