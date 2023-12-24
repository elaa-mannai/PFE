/*   ///contact us
              ElevatedButton(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(primary: AppColor.goldColor),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white ,
                        ),
                      ),
                      Icon(Icons.message_outlined)
                    ],
                  ),
                ),
              ),
              //change language
              ElevatedButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Change Language '),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: AppColor.goldColor,
                                activeColor: AppColor.secondary,
                                value: valuefirst,
                                onChanged: (value) {
                                  setState(() {
                                    valuefirst = value!;
                                  });
                                },
                              ),
                              Text("English"),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: AppColor.goldColor,
                                activeColor: AppColor.secondary,
                                value: valuesecond,
                                onChanged: (value) {
                                  setState(() {
                                    valuesecond = value!;
                                  });
                                },
                              ),
                              Text("العربية"),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: AppColor.goldColor,
                                activeColor: AppColor.secondary,
                                value: valuetherd,
                                onChanged: (value) {
                                  setState(() {
                                    valuetherd = value!;
                                  });
                                },
                              ),
                              Text("Turkish"),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: AppColor.goldColor,
                                activeColor: AppColor.secondary,
                                value: valueFour,
                                onChanged: (value) {
                                  setState(() {
                                    // valueFour !=valuefirst ?valueFour=true:valuefirst=false;
                                  });
                                },
                              ),
                              Text("FRENCH"),
                            ],
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                          },
                          child: Text('Cancel'),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context, 'UPDATE');
                          },
                          child: Text('UPDATE'),
                        ),
                      ],
                    ),
                  );
                },
                style:
                    ElevatedButton.styleFrom(primary: AppColor.goldColor),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Change Language ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white ,
                        ),
                      ),
                      Icon(Icons.contact_page_outlined)
                    ],
                  ),
                ),
              ),
           */