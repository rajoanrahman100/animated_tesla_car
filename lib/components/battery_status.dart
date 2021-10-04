import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    Key? key,required this.boxConstraints
  }) : super(key: key);

  final BoxConstraints boxConstraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("220 mi",style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
        const Text("62%",style: TextStyle(fontSize: 24.0),),
        const Spacer(),
        const Text("CHARGING",style: TextStyle(fontSize: 24.0),),
        const Text("18 min remaining",style: TextStyle(fontSize: 24.0),),
        SizedBox(height: boxConstraints.maxHeight*0.13,),
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
          child: DefaultTextStyle(
            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("22 mi/hr"),
                Text("232 vr"),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
