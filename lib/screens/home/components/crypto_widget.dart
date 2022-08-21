import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/constants.dart';
import 'package:news/models/crypto_provider.dart';
import 'package:news/models/cryptocurrency.dart';
import 'package:news/screens/home/components/DetailPage.dart';
import 'package:news/screens/main/components/Footer.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  bool _isElevated = false;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 45, right: 45, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  Crypto Today",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Consumer<MarketProvider>(
                        builder: (context, marketProvider, child) {
                          if (marketProvider.isLoading == true) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            if (marketProvider.markets.length > 0) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics(),
                                  ),
                                  itemCount: marketProvider.markets.length,
                                  itemBuilder: (context, index) {
                                    Cryptocurrency currentCrypto =
                                        marketProvider.markets[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Card(

                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        color: Colors.white,
                                        elevation: 20,
                                        shadowColor: Colors.white,

                                        child: ListTile(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsPage(
                                                        id: currentCrypto.id!,
                                                      )),
                                            );
                                          },
                                          contentPadding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          // leading: CircleAvatar(
                                          //   backgroundColor: Colors.white,
                                          //   backgroundImage:
                                          //   NetworkImage(currentCrypto.image!),
                                          // ),
                                          title: Text(currentCrypto.name! +
                                              " #${currentCrypto.marketCapRank}"),
                                          subtitle: Text(currentCrypto.symbol!
                                              .toUpperCase()),
                                          trailing: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "₹" +
                                                    currentCrypto
                                                        .currentPrice!
                                                        .toStringAsFixed(4),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  double priceChange =
                                                      currentCrypto
                                                          .priceChange24!;
                                                  double
                                                      priceChangePercentage =
                                                      currentCrypto
                                                          .priceChangePercentage24!;

                                                  if (priceChange < 0) {
                                                    //negative
                                                    return Text(
                                                      "${priceChangePercentage.toStringAsFixed(2)}% (${priceChange.toStringAsFixed(4)})",
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    );
                                                  } else {
                                                    //positive
                                                    return Text(
                                                      "${priceChangePercentage.toStringAsFixed(2)}% (+${priceChange.toStringAsFixed(4)})",
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                      ),
                                                    );
                                                    return Text("");
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Container(
                                  child: Center(child: Text("Data not found",
                                    style: GoogleFonts.poppins(
                                      fontSize: 25
                                    ),
                                  ),),);
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
                //Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
