import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class DialogCreateGroup extends StatefulWidget {
  const DialogCreateGroup({Key? key}) : super(key: key);

  @override
  State<DialogCreateGroup> createState() => _DialogCreateGroupState();
}

class _DialogCreateGroupState extends State<DialogCreateGroup> {
  final groupController = TextEditingController();
  final passController = TextEditingController();
  String groupName = "";
  String groupNameHash = "";
  bool isCreated = false;
  @override
  void initState() {
    super.initState();
  }

  void createGroup() {
    // ignore: todo
    // TODO salvare du db firebase il nome e l hash del gruppo
    // var bytes = utf8.encode(groupName);
    setState(() {
      // groupNameHash = sha1.convert(bytes).toString().substring(0, 14);
      groupNameHash = passController.text;
      isCreated = !isCreated;
    });
  }

  @override
  Widget build(BuildContext dialogcontext) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 450,
        width: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text("Create Group",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.orange,
                      fontWeight: FontWeight.w700)),
            ),
            !isCreated
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 30.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome Gruppo',
                        // prefixIcon: Icon(Icons.group_add),
                      ),
                      style: GoogleFonts.poppins(fontSize: 18),
                      controller: groupController,
                    ),
                  )
                : const Padding(padding: EdgeInsets.all(0)),
            !isCreated
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 30.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      style: GoogleFonts.poppins(fontSize: 18),
                      controller: passController,
                    ),
                  )
                : const Padding(padding: EdgeInsets.all(0)),
            isCreated
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 15.0, left: 20.0, right: 20.0),
                            child: Text("Nome gruppo: ",
                                style: GoogleFonts.poppins(fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(groupName,
                                style: GoogleFonts.poppins(
                                    fontSize: 22, color: Colors.orange)),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            isCreated
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("Password del gruppo:",
                        style: GoogleFonts.poppins(fontSize: 18)),
                  ])
                : Row(),
            Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                child: isCreated
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // border: Border.all(color: Colors.black)),
                        child: ListTile(
                          title: Text(groupNameHash,
                              style: GoogleFonts.poppins(
                                  fontSize: 20, color: Colors.orange)),
                          trailing: const Icon(
                            Icons.copy,
                          ),
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: groupNameHash));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Password copied in clipboard")));
                          },
                        ),
                      )
                    : null),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: MaterialButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed: () {
                    if (groupController.text != "") {
                      if (!isCreated) {
                        setState(() {
                          groupName = groupController.text;
                        });
                        createGroup();
                      } else {
                        Navigator.pop(dialogcontext);
                      }
                    }
                  },
                  child: Text(!isCreated ? "Create Group" : "Done",
                      style: GoogleFonts.poppins(fontSize: 20))),
            ),
          ],
        ),
      ),
    );
  }
}
