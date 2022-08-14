/* External dependencies */
import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

/* Local dependencies */
part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String? image;

  Product({
    this.id,
    required this.title,
    required this.description,
    this.image,
  });

  Product copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    bool? isCompleted,
    bool? isDeleted,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        image,
      ];
}
