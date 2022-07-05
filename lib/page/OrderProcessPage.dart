import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widget/theme.dart';

class OrderProcessPage extends StatefulWidget {
  @override
  State<OrderProcessPage> createState() => _OrderProcessPageState();
}

class _OrderProcessPageState extends State<OrderProcessPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: "Order".text.make(),
        actions: [
          Center(
            child: Container(
                padding: const EdgeInsets.all(8.0),
                child: "Cancel".text.make().onTap(() {
                  context.showToast(msg: "Hello Umesh");
                  Navigator.pop(context);
                  // VxToast.show(context, msg: "Hello Umesh");
                })),
          )
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: MyTheme.appBackground,
      body: Container(
        child: Column(
          children: [
            Container(
              color: Vx.hexToColor("#F9F9F9"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      "ESTIMATED TIME"
                          .text
                          .size(12)
                          .color(Vx.hexToColor("#A2A2A2"))
                          .make(),
                      "30 Minutes"
                          .text
                          .size(10)
                          .color(Vx.hexToColor("#5E5E5E"))
                          .make()
                    ],
                  ).p(16),
                  Column(
                    children: [
                      "ORDER NUMBER"
                          .text
                          .size(12)
                          .color(Vx.hexToColor("#A2A2A2"))
                          .make(),
                      "#2482011"
                          .text
                          .size(10)
                          .color(Vx.hexToColor("#5E5E5E"))
                          .make()
                    ],
                  ).p(16),
                ],
              ),
            ),
            Divider(
              height: 5,
              thickness: 5,
              color: Vx.hexToColor("#E9E9E9"),
            ),
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(), //ClampingScrollPhysics
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,

                controlsBuilder: (currentStep, Step,
                        {VoidCallback? onStepContinue,
                        VoidCallback? onStepCancel}) =>
                    SizedBox(
                  height: 20.0,
                  width: 20.0,
                ),

                steps: <Step>[
                  Step(
                    title: stepDesign("order_placed.png", "Order Placed",
                        "We have received your order."),
                    content: Row(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: stepDesign("order_confirmed.png", "Order Confirmed",
                        "Your order has been confirmed."),
                    content: Row(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: stepDesign("order_processed.png", "Order Processed",
                        "We are preparing your order."),
                    content: Row(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: stepDesign("ready_to_pickup.png", "Ready to Pickup",
                        "Your order is ready to pickup."),
                    content: Row(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ).py(40),
            ),
          ],
        ),
      ),
    );
  }

  Column stepDesign(String image, String title, String subTitle) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icon/$image",
              fit: BoxFit.cover,
              height: 50,
              width: 50,
            ).p(5),
            Container(
              // padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      title.text.size(14).fontWeight(FontWeight.w600).make()
                    ],
                  ),
                  Row(
                    children: [
                      subTitle.text.size(12).make(),
                    ],
                  )
                ],
              ).p(10),
            )
          ],
        )
      ],
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
