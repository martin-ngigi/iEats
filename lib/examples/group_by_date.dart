// import 'package:encrypt/encrypt.dart';

void main() {
  List<Map<String, dynamic>> getCartHistoryList =[
    {"id":1, "name": "Kenyan side", "time":"2023-03-12 07:19:52.080501"},
    {"id":1, "name": "Kenyan side", "time":"2023-03-12 07:19:52.080501"},
    {"id":1, "name": "Kenyan side", "time":"2023-03-12 07:19:52.080501"},

    {"id":1, "name": "Kenyan side", "time":"2023-03-13 07:19:52.080501"},

    {"id":1, "name": "Kenyan side", "time":"2023-03-14 07:19:52.080501"},
    {"id":1, "name": "Kenyan side", "time":"2023-03-14 07:19:52.080501"},
  ];

  Map<String, int> cartItemsPerOrder = Map();

  for(int i=0; i<getCartHistoryList.length; i++ ){
    /**
     * if one has objects such as one used in cart_history.dart, use the following convention:
     * cartItemsPerOrder.containsKey(getCartHistoryList[i].time
     */
    if(cartItemsPerOrder.containsKey(getCartHistoryList[i]["time"])){
      //present in the cartItemsPerOrder,so update the existing one and increment the value
      cartItemsPerOrder.update(getCartHistoryList[i]["time"], (value)=>++value);
    }
    else{
      //not present in the cartItemsPerOrder, so create a new one with an initial value of 1
      cartItemsPerOrder.putIfAbsent(getCartHistoryList[i]["time"], ()=>1);
    }
  }

  //print categories grouped according to time
  //print("print categories grouped according to time");
  //print(cartItemsPerOrder);

  //obtain order times
  List<int> cartOrderTimeToList(){
    return cartItemsPerOrder.entries.map((e) => e.value).toList();
  }

  //convert order times to list of ints
  List<int> orderTimes = cartOrderTimeToList();

  //print order times
  //print("print the number order times");
  //print(orderTimes);

  //group order accroding to time
  var savedCounts = 0;
  for(int x =0; x<cartItemsPerOrder.length; x++ ){
    print("Order $x");
    for(int y =0; y<orderTimes[x]; y++ ){
      print("Inner loop index: "+y.toString());
      print("My Order $y is "+getCartHistoryList[savedCounts++].toString());
    }
    print("\n");
  }

}


//sample output
/**
    Order 0
    Inner loop index: 0
    My Order 0 is {id: 1, name: Kenyan side, time: 2023-03-12 07:19:52.080501}
    Inner loop index: 1
    My Order 1 is {id: 1, name: Kenyan side, time: 2023-03-12 07:19:52.080501}
    Inner loop index: 2
    My Order 2 is {id: 1, name: Kenyan side, time: 2023-03-12 07:19:52.080501}


    Order 1
    Inner loop index: 0
    My Order 0 is {id: 1, name: Kenyan side, time: 2023-03-13 07:19:52.080501}


    Order 2
    Inner loop index: 0
    My Order 0 is {id: 1, name: Kenyan side, time: 2023-03-14 07:19:52.080501}
    Inner loop index: 1
    My Order 1 is {id: 1, name: Kenyan side, time: 2023-03-14 07:19:52.080501}

 */