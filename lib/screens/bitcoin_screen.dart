import 'dart:async';

import 'package:consultation_heating/functions/fetch_block_height.dart';
import 'package:consultation_heating/functions/fetch_network_difficulty.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../functions/fetch_bitcoin_value.dart';
import '../widgets/bottom_reusable_row_home_screen.dart';

class BitcoinScreen extends StatefulWidget {
  const BitcoinScreen({super.key});

  @override
  State<BitcoinScreen> createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {
  double lastValue = 0.0;//change back to 0.0 when uncommenting api call
  //commented to avoid api calls limit

  var btcLastValue = '0.0';
  var blockHeightVal = '0';
  String networkDifficultyValue = '';
  int blockHeightValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    // Start the initial call
    fetchAndSetBitcoinLastValue();
    fetchAndSetNetworkDifficultyValue();
    fetchAndSetBlockHeightValue();


    // Setting up a timer to call the function every 5 minutes
    const Duration interval = Duration(minutes: 5);
    Timer.periodic(interval, (_) async {
      print('insider timer');
      fetchAndSetBitcoinLastValue();
      fetchAndSetNetworkDifficultyValue();
      fetchAndSetBlockHeightValue();
    });
    super.initState();
  }

  //function to get value from fetchBitcoinLastValue function
  Future<void> fetchAndSetBitcoinLastValue() async {
    try {
      final value = await fetchBitcoinValue();
      setState(() {
        String z = formatBtcValue(value);
        print(z);
        btcLastValue = z;
        lastValue = value;
        print(lastValue);
      });
    } catch (error) {
      print('Error fetching Bitcoin data: $error');
    }
  }
  String formatBtcValue(double value) {
    final formatter = NumberFormat("00,000.00", "en_US");
    return formatter.format(value);
  }
  String formatBlockHeightValue(double value) {
    final formatter = NumberFormat("000,000", "en_US");
    return formatter.format(value);
  }

  Future<void> fetchAndSetNetworkDifficultyValue() async {
    try {
      final value = await fetchNetworkDifficultyValue();
      setState(() {
        networkDifficultyValue = value;
        print(networkDifficultyValue);
      });
    } catch (error) {
      print('Error fetching Bitcoin data: $error');
    }
  }

  Future<void> fetchAndSetBlockHeightValue() async {
    try {
      final value = await fetchBlockHeightValue();
      setState(() {
        String z = formatBlockHeightValue(value as double);
        print(z);
        blockHeightValue = value;
        blockHeightVal = z;
        print(blockHeightValue);
      });
    } catch (error) {
      print('Error fetching Bitcoin data: $error');
    }
  }

  //selected option for content view for hashrate or profitability
  String selectedOption = 'Hashrate';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kWhiteColor,
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            //top section, top containers i.e btc container, network difficulty and block height
            Row(
              children: [
                //btc container
                Material(
                  elevation: 10,
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.25,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bitcoin',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        btcLastValue == '0.0'
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kGoldenColor,
                                ),
                              )
                            : BottomReusableRow(
                                icon: Icons.currency_bitcoin,
                                valueText: '$btcLastValue',
                                unitText: '\$')
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                //network difficulty container
                Material(
                  elevation: 10,
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.25,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Network Difficulty',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        networkDifficultyValue == ''
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kGoldenColor,
                                ),
                              )
                            : BottomReusableRow(
                                icon: Icons.tap_and_play_rounded,
                                valueText: networkDifficultyValue,
                                unitText: 'T')
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                //block height container
                Material(
                  elevation: 10,
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.25,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Block Height',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        blockHeightVal == '0'
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kGoldenColor,
                                ),
                              )
                            : BottomReusableRow(
                                icon: Icons.stacked_bar_chart_outlined,
                                valueText: '$blockHeightVal',
                                unitText: '')
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            //tabview for hashrate or profitabilty
            Material(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(3),
                height: 60,
                color: kWhiteColor,
                child: Row(
                  children: [
                    //hashRate tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = 'Hashrate';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedOption == 'Hashrate'
                                  ? kGoldenColor
                                  : kWhiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Hash Rate',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //profitability tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOption = 'Profitability';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedOption == 'Profitability'
                                  ? kGoldenColor
                                  : kWhiteColor,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Profitability',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20.0),
            // Spacer
            // Display content based on selectedOption
            selectedOption == 'Hashrate'
                ? HashRateContent()
                : ProfitabilityContent(),
          ],
        ));
  }
}

class HashRateContent extends StatelessWidget {
  const HashRateContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //current container
        Material(
          elevation: 10,
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                BottomReusableRow(icon: null, valueText: '87', unitText: 'TH/S')
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        //15min container
        Material(
          elevation: 10,
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '15min',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                BottomReusableRow(icon: null, valueText: '33', unitText: 'TH/S')
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        //24H container
        Material(
          elevation: 10,
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '24H',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                BottomReusableRow(icon: null, valueText: '67', unitText: 'TH/S')
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProfitabilityContent extends StatelessWidget {
  const ProfitabilityContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //text btc
        Text(
          'BTC',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(
          height: 20,
        ),
        //btc monthly,day, weekly row
        Row(
          children: [
            //Day container
            Material(
              elevation: 10,
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    BottomReusableRow(icon: null, valueText: '12', unitText: '')
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            //Week container
            Material(
              elevation: 10,
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Week',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    BottomReusableRow(icon: null, valueText: '4', unitText: '')
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            //Month container
            Material(
              elevation: 10,
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Month',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    BottomReusableRow(icon: null, valueText: '2', unitText: '')
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        //usd text
        Text(
          'USD',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(
          height: 20,
        ),
        //usd monthly,day, weekly row
        Row(
          children: [
            //Day container
            Material(
              elevation: 10,
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    BottomReusableRow(icon: null, valueText: '13', unitText: '')
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            //Week container
            Material(
              elevation: 10,
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Week',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    BottomReusableRow(icon: null, valueText: '3', unitText: '')
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            //Month container
            Material(
              elevation: 10,
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.25,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Month',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    BottomReusableRow(icon: null, valueText: '5', unitText: '')
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
