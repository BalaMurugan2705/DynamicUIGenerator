class CreateFormModel {
  List<Data>? data;

  CreateFormModel({this.data});

  CreateFormModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? type;
  String? label;
  DataValues? dataValues;

  Data({this.type, this.label, this.dataValues});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    label = json['label'];
    dataValues = json['dataValues'] != null
        ? DataValues.fromJson(json['dataValues'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['label'] = label;
    if (dataValues != null) {
      data['dataValues'] = dataValues!.toJson();
    }
    return data;
  }
}

class DataValues {
  String? label;
  String? minVal;
  String? maxVal;
  String? sliderVal;
  String? title;
  List<String>? items;

  DataValues(
      {this.label,
        this.minVal,
        this.maxVal,
        this.sliderVal,
        this.title,
        this.items});

  DataValues.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    minVal = json['minVal'];
    maxVal = json['maxVal'];
    sliderVal = json['sliderVal'];
    title = json['title'];
    if(json['items']!=null) {
      items=[];
      json["items"].forEach((element){
        items?.add(element.toString());
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['minVal'] = minVal;
    data['maxVal'] = maxVal;
    data['sliderVal'] = sliderVal;
    data['title'] = title;
    data['items'] = items;
    return data;
  }
}