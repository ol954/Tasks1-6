import 'dart:html';

import 'package:flutter/material.dart';

class Buttons extends StatefulWidget{
  const Buttons({Key? key}) : super(key: key);
  @override
  _ButtonsState createState() => _ButtonsState();


}
class _ButtonsState extends State<Buttons>{
  //late TextEditingController _controller;
  //String r='77345';
  String userinput='Введите данные в поле';
  String useroutput ='Здесь будет результат';
  getinput(String text){
  setState(() => userinput = text);
}
getoutput(String text){
  setState(() => useroutput = text);
}
firstbutton(){//самое большое число последовательно расположенными 5 символами
    String s = userinput;
    if ((s.contains(RegExp(r'^[0-9]+$'))==true) & (s.length>=5)){//только числа в строке
      String res=s.substring(0,5);
      for (int i=1; i<(s.length-4);i++){
        String t=s.substring(i,i+5);
        int t1=int.parse(t);
        int res1=int.parse(res);
      if(t1>res1){
        res=t;
        }
     }
      getoutput(res);
    }
    else {
      getoutput('Строка может содержать только числа и должна содержать не менее 5 цифр');
    }
}
secondbutton(){//какое колво символов встречается больше 1 раза
  String s = userinput;
  int count=0;

  s=s.toLowerCase();
  //String ns = s;
  for (int i=0;i<s.length;i++){

    for(int j=0;j<s.length;j++){
      if ((s[i] == s[j]) & (i!=j)){
        count++;
        j=s.length;
        //print(s[i]);
        //print(s.replaceAll(s[i],''));
        s=s.replaceAll(s[i],'');
        //s=ns;
        i=0;
      }

    }

  }
  getoutput(count.toString());
}
thirdbutton(){//двоичное в целое
  String s = userinput;
  if (s.contains(RegExp(r'^[0-1]+$'))==true){
    getoutput((int.parse(s, radix: 2)).toString());
  }
  else {
    getoutput('Это не двоичное число');
  }
}
fourthbutton(){
  String s = userinput;
  int count=0;
  int newcount=0;
  if (s.contains(RegExp(r'^[A-Za-z]+$'))==true){
    s=s.toLowerCase();
    List<String> res = s.split(RegExp(r'[aeiou]'));
    //print(res);
    //count=res[0].codeUnitAt(0);
    for(int k=0;k<res[0].length;k++){
      count = count + res[0].codeUnitAt(k) - 96;
    }
    for (int i=0; i<res.length;i++){
      //print(res[i]);
      for (int j=0;j<res[i].length;j++){
        newcount = newcount + res[i].codeUnitAt(j) - 96;//a=97
        //print(res[i].codeUnitAt(j)-96);
        }
        if(newcount>count){
          count=newcount;
      }
        newcount=0;
      getoutput(count.toString());
    }
  }
  else{
    getoutput('Строка может содержать только буквы');
  }
}
fifthbutton(){
  String s = userinput;
  int n;
  int res;
  if (s.contains(RegExp(r'^[0-9]+$'))==true) { //только числа в строке
    n=int.parse(s);
    res=n;

    for (int i=2;i<=n;){
      //print(n~/i);
      res=res+n~/i;
      i=i+2;

    }
    getoutput(res.toString());
  }
  else {
    getoutput('Это не число');
  }
}
sixthbutton(){
  String s = userinput;
  int indx;
  if ((s.contains(RegExp(r'^[0-9 ,]+$'))==true) & (s.contains(', '))) {
    List<String> res = s.split(', ');
    int n = int.parse(res[0]);
    int k = int.parse(res[1]);
    int count=0;
    indx=k;
    k--;
    var list = [for (var i = 1; i <= n; i++) i];
     if (list.length<=k){
    for (int j = 1; j < n; j++) {
      if (list.length <= k) {
        k = indx - count - 1;
        if (k >= list.length) {
          bool isbigger = true;
          while (isbigger == true) {
            k = k - list.length;
            if (k < list.length) {
              isbigger = false;
            }
          }
        }
      }
      if (list.length > k) {
        count = list.indexOf(list.last) - k;
        list.removeAt(k);
        print(k);
        if ((count == 0) & (list.length > indx - 1)) {
          count = indx - 1;
        }
        k = k + indx - 1;
      }

    }
    }
     else {
      for (int j = 1; j < n; j++) {
        if (list.length > k) {
          count = list.indexOf(list.last) - k;
          list.removeAt(k);
          if ((count == 0) & (list.length > indx - 1)) {
            count = indx - 1;
          }
          k = k + indx - 1;
        }
        if (list.length <= k) {
          k = indx-count-1;
          if (k>=list.length) {
            bool isbigger = true;
            while (isbigger == true){
            k = k - list.length;
            if (k < list.length) {
              isbigger = false;
            }
          }
          }
        }


      }
    }
    getoutput(list.toString());
  }
  else{
    getoutput('Некорректный ввод. Корректный ввод: x, y');
  }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задачи 1-6'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ввод $userinput"),
          TextField(
            //controller: _controller,
            onChanged: getinput,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:   [
                    ElevatedButton(onPressed: firstbutton,  child: Text('1')),
                    ElevatedButton(onPressed: secondbutton, child: Text('2'))
                  ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    ElevatedButton(onPressed: thirdbutton, child: Text('3')),
                    ElevatedButton(onPressed: fourthbutton, child: Text('4'))],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(onPressed: fifthbutton, child: Text('5')),
                    ElevatedButton(onPressed: sixthbutton, child: Text('6'))],),
        ],

      ),

          Text("Вывод: $useroutput")
        ],
        ),
      );
    }

}
