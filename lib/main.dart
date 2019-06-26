import 'package:flutter/material.dart';

enum ButtonType { payBills, donate, receiptients, offers }
enum TransactionType { sent, received, pending }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff2931a5),
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(21),
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hey James,",
                                  style: Theme.of(context).textTheme.title,
                                ),
                                Text(
                                  "What would you do like to do today ?",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911329_960_720.jpg",
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        SendReceiveSwitch(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(21),
                    color: Color(0xfff4f5f9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: CustomButton(buttonType: ButtonType.payBills),
                        ),
                        Flexible(
                          child: CustomButton(buttonType: ButtonType.donate),
                        ),
                        Flexible(
                          child:
                              CustomButton(buttonType: ButtonType.receiptients),
                        ),
                        Flexible(
                          child: CustomButton(buttonType: ButtonType.offers),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "RECENT TRANSACTIONS",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17.0,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Transaction(
                            receptient: "Amazigh Halzoun",
                            transactionAmout: "5000.00",
                            transactionDate: "26 Jun 2019",
                            transactionInfo: "Laptop",
                            transactionType: TransactionType.sent,
                          ),
                          Transaction(
                            receptient: "Awesome Client",
                            transactionAmout: "15000.00",
                            transactionDate: "26 Jun 2019",
                            transactionInfo: "Mobile App",
                            transactionType: TransactionType.received,
                          ),
                          Transaction(
                            receptient: "Lazy Client",
                            transactionAmout: "25000.00",
                            transactionDate: "24 Jun 2019",
                            transactionInfo: "Mobile App",
                            transactionType: TransactionType.pending,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              title: Text("History"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text("Notifications"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}

class SendReceiveSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white54,
      ),
      padding: EdgeInsets.all(21.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          DragTarget(
            builder: (context, List<int> candidateData, rejectedData) {
              return Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Receive",
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Receive!"),
                ),
              );
            },
          ),
          Draggable(
            data: 5,
            child: Container(
              width: 51,
              height: 51,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white54, Theme.of(context).primaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 1]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.attach_money,
                color: Theme.of(context).primaryColor,
              ),
            ),
            feedback: Container(
              width: 51,
              height: 51,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white54, Theme.of(context).primaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 1]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.attach_money,
                color: Theme.of(context).primaryColor,
              ),
            ),
            axis: Axis.horizontal,
            childWhenDragging: Container(
              width: 51,
              height: 51,
            ),
          ),
          DragTarget(
            builder: (context, List<int> candidateData, rejectedData) {
              return Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Send",
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SendScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  const CustomButton({Key key, this.buttonType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String buttonText = "", buttonImage;
    switch (buttonType) {
      case ButtonType.payBills:
        buttonText = "Pay Bills";
        buttonImage = "assets/receipt.png";
        break;
      case ButtonType.donate:
        buttonText = "Donate";
        buttonImage = "assets/donation.png";
        break;
      case ButtonType.receiptients:
        buttonText = "Receipients";
        buttonImage = "assets/users.png";
        break;
      case ButtonType.offers:
        buttonText = "Offers";
        buttonImage = "assets/discount.png";
        break;
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  gradient: LinearGradient(
                    colors: [Colors.white10, Colors.black12],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  buttonImage,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              FittedBox(
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Transaction extends StatelessWidget {
  final TransactionType transactionType;
  final String transactionAmout, transactionInfo, transactionDate, receptient;
  const Transaction(
      {Key key,
      this.transactionType,
      this.transactionAmout,
      this.transactionInfo,
      this.transactionDate,
      this.receptient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String transactionName;
    IconData transactionIconData;
    Color color;
    switch (transactionType) {
      case TransactionType.sent:
        transactionName = "Sent";
        transactionIconData = Icons.arrow_upward;
        color = Theme.of(context).primaryColor;
        break;
      case TransactionType.received:
        transactionName = "Received";
        transactionIconData = Icons.arrow_downward;
        color = Colors.green;
        break;
      case TransactionType.pending:
        transactionName = "Pending";
        transactionIconData = Icons.arrow_downward;
        color = Colors.orange;
        break;
    }
    return Container(
      margin: EdgeInsets.all(9.0),
      padding: EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[350],
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg",
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      child: Icon(
                        transactionIconData,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 5.0),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      receptient,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$ $transactionAmout",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$transactionInfo - $transactionDate",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "$transactionName",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Money"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Select Payee",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, payees) {
                return ListTile(
                  title: PayeeContainer(),
                  onTap: () {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class PayeeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911329_960_720.jpg",
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              padding: EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "+213123456789",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
