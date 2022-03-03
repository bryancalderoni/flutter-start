import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progetto_5/components/registration_text.dart';
import 'package:progetto_5/components/registration_text_field.dart';

enum SexModel { male, female }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SexModel? sex;
  double ral = 0;
  bool termsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          header(),
          body(),
        ]),
      ),
    );
  }

  Widget header() => Image.network(
        "https://images.unsplash.com/photo-1580508174046-170816f65662?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=8",
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
      );

  Widget body() => Positioned(
        top: 190,
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RegistrationText(
                    title: "Il tuo nome",
                    child: RegistrationTextField(
                      hintText: "Il tuo nome e cognome",
                      inputType: TextInputType.text,
                    ),
                  ),
                  RegistrationText(
                    title: "La tua età",
                    child: RegistrationTextField(
                      hintText: "Anni",
                      inputType: TextInputType.text,
                    ),
                  ),
                  RegistrationText(
                      title: "Sesso",
                      child: Column(
                        children: [
                          RadioListTile<SexModel>(
                            value: SexModel.male,
                            groupValue: sex,
                            onChanged: (value) => setState(() => sex = value),
                            title: Text("Uomo"),
                          ),
                          RadioListTile<SexModel>(
                            value: SexModel.female,
                            groupValue: sex,
                            onChanged: (value) => setState(() => sex = value),
                            title: Text("Donna"),
                          )
                        ],
                      )),
                  RegistrationText(
                      title: "RAL",
                      child: Slider(
                          min: 0,
                          max: 90000,
                          divisions: 1000,
                          value: ral,
                          label: "${(ral / 1000).round()}k",
                          onChanged: (value) => setState(() => ral = value))),
                  RegistrationText(
                    title: "Termini e Condizioni d'uso",
                    child: SwitchListTile(
                        title: termsAndConditions
                            ? Text("Condizione accettate")
                            : Text("Accetta le condizioni d'uso"),
                        value: termsAndConditions,
                        onChanged: (value) =>
                            setState(() => termsAndConditions = value)),
                  ),
                  RegistrationText(
                    title: "Termini e Condizioni d'uso",
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(double.infinity, 50),
                          ),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      child: Text("Registrati"),
                    ),
                  ),
                  SizedBox(height: 30),
                ]),
          ),
        ),
      );
}
