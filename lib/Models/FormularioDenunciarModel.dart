class FormularioDenunciarModel {
  bool state;
  int id;
  String name;

  FormularioDenunciarModel({this.id, this.state, this.name});

  static List<FormularioDenunciarModel> getDenuncias() {
    return <FormularioDenunciarModel>[
      FormularioDenunciarModel(
          id: 1, name: "Exceso de velocidad", state: false),
      FormularioDenunciarModel(id: 2, name: "Habla por celular", state: false),
      FormularioDenunciarModel(
          id: 3, name: "Tanquea con pasajeros a bordo", state: false),
      FormularioDenunciarModel(
          id: 4, name: "Omite señales de tránsito", state: false),
      FormularioDenunciarModel(
          id: 5, name: "Conduce con brusquedad", state: false),
    ];
  }
}
