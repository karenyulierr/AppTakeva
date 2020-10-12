class FormularioFelicitarModel {
  int id;
  bool state;
  String name;

  FormularioFelicitarModel({this.id, this.state, this.name});

  static List<FormularioFelicitarModel> getFelicitar() {
    return <FormularioFelicitarModel>[
      FormularioFelicitarModel(
          id: 1, name: "Trato amable y cordial", state: false),
      FormularioFelicitarModel(
          id: 2, name: "Conduce con prudencia", state: false),
      FormularioFelicitarModel(
          id: 3, name: "Respeta las señales de tránsito", state: false),
      FormularioFelicitarModel(id: 4, name: "Vehículo limpio", state: false),
      FormularioFelicitarModel(
          id: 5, name: "Viaje agradable, tranquilo y seguro", state: false),
    ];
  }
}
