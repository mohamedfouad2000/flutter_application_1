import 'data.dart';

class HomeImageModel {
	String? status;
	Data? data;
	String? message;

	HomeImageModel({this.status, this.data, this.message});

	factory HomeImageModel.fromJson(Map<String, dynamic> json) {
		return HomeImageModel(
			status: json['status'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			message: json['message'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'data': data?.toJson(),
				'message': message,
			};
}
