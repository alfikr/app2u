import 'package:advertising/component/no_content.dart';
import 'package:advertising/component/scrollable_panel.dart';
import 'package:advertising/service/user_service.dart';
import 'package:advertising/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PanelController _panelController = PanelController();

  Widget _getHeader() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        top: 5,
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Rp. 99.999.999",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    //TODO isi saldo
                    Navigator.pushNamed(context, "/topup");
                  },
                  child: InkWell(
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppTheme().getButtonHeaderColor(),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                          ),
                          Text(
                            "Isi saldo",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/transfer");
                  },
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme().getButtonHeaderColor(),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: 80,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_forward_rounded,
                          ),
                          Text(
                            "Transfer",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Tarik
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/tarik");
                  },
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme().getButtonHeaderColor(),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      width: 80,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_drop_up,
                          ),
                          Text(
                            "Tarik",
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getPanel() {
    return ScrollablePanel(
      controller: _panelController,
      onClose: () => print('onClose'),
      onExpand: () => print('onExpand'),
      maxPanelSize: MediaQuery.of(context).size.height * .7,
      defaultPanelSize: MediaQuery.of(context).size.height * .3,
      minPanelSize: MediaQuery.of(context).size.height * .2,
      builder: (context, sc) => SingleChildScrollView(
        controller: sc,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .7,
          ),
          child: Container(
            child: Text("Second view"),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _getHeader(),
        _getPanel(),
      ],
    );
  }

  Widget _getContent() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: ListView(
        children: [
          Card(
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Saldo
                  FutureBuilder(
                    future: UserService().getSaldo(),
                    builder: (context, snapshot) => snapshot.hasData
                        ? snapshot.data.length > 0
                            ? Card(
                                child: GestureDetector(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Saldo"),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Text("Rp. 99.999.999"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Card(
                                child: Container(
                                  width: 80,
                                ),
                              )
                        : Card(
                            child: SkeletonAnimation(
                              child: Container(
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  //Topup
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //TODO isi saldo
                        Navigator.pushNamed(context, "/topup");
                      },
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme().getButtonColor(),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Icon(
                                Icons.arrow_drop_down,
                              ),
                              Text(
                                "Isi \nsaldo",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Transfer
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/transfer");
                      },
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme().getButtonColor(),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Icon(
                                Icons.arrow_forward_rounded,
                              ),
                              Text(
                                "Transfer",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Tarik
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/tarik");
                      },
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme().getButtonColor(),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: 80,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                              ),
                              Text(
                                "Tarik",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .6,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: Center(
              child: Text("Produk"),
            ),
          ),
          //TODO promosi
          Container(
            height: MediaQuery.of(context).size.height * .2,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.lime,
            ),
            child: Center(
              child: Text("Promosi"),
            ),
          )
        ],
      ),
    );
  }
}
