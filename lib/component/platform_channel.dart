// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/animals_root.dart';
import '../utils/womai_channel.dart';

class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  static const MethodChannel methodChannel =
      MethodChannel(FlutterChannel.CHANNEL_FETCH_DATA);
  static const EventChannel eventChannel =
      EventChannel(FlutterChannel.CHANNEL_RECEIVE_DATA);

  var _fetch_data = '';
  var _receive_data = '';

  Future<void> _fechtData() async {
    String receiveData;
    try {

      final String result =
          await methodChannel.invokeMethod('customMethodName','arg1');

      receiveData = '$result';
    } on PlatformException {
      receiveData = 'Fetch Failed';
    }
    setState(() {
      _fetch_data = receiveData;
    });
  }

  @override
  void initState() {
    super.initState();

    eventChannel.receiveBroadcastStream(['arg1', 'arg2']).listen(_onEvent,
        onError: _onError);
  }

  void _onEvent(Object event) {
    var animal = json.decode(event);
    print(AnimalsRoot.fromJson(animal).animals.cat.name);
    setState(() {
      _receive_data = '$event';
    });
  }

  void _onError(Object error) {
    setState(() {
      _receive_data = 'Receive  failed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_fetch_data),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  child: const Text('Fetch Data'),
                  onPressed: _fechtData,
                ),
              ),
            ],
          ),
          Text(_receive_data),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: PlatformChannel()));
}
