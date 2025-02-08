// app_database.dart

import 'dart:io';
import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart' as drift_native;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// هذا السطر مطلوب لتوليد الكود تلقائياً باستخدام build_runner
part 'app_database.g.dart';

/// تعريف جدول النباتات باستخدام Drift
class Plants extends drift.Table {
  // العمود الأساسي: رقم تعريف فريد يُزاد تلقائيًا
  // هنا نستخدم الدالة integer() بدون الـ prefix لأنها دالة موروثة من Table
  drift.IntColumn get id => integer().autoIncrement()();

  // اسم النبات
  drift.TextColumn get name => text()();

  // سعر النبات (نستخدم نوع Real للقيم العشرية)
  drift.RealColumn get price => real()();

  // عمر النبات (مثلاً بعدد الأيام أو الأشهر)
  drift.IntColumn get age => integer()();
}

/// تعريف قاعدة البيانات وربط الجدول Plants
@drift.DriftDatabase(tables: [Plants])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /// استعلام لجلب كل النباتات من قاعدة البيانات
  Future<List<Plant>> getAllPlants() => select(plants).get();

  /// بث (Stream) لمراقبة التغييرات على جدول النباتات
  Stream<List<Plant>> watchAllPlants() => select(plants).watch();

  /// دالة لإضافة نبات جديد
  Future<int> insertPlant(PlantsCompanion plant) => into(plants).insert(plant);

  /// دالة لتحديث بيانات نبات موجود
  Future<bool> updatePlant(Plant plant) => update(plants).replace(plant);

  /// دالة لحذف نبات
  Future<int> deletePlant(Plant plant) => delete(plants).delete(plant);
}

/// دالة لإنشاء الاتصال بقاعدة البيانات باستخدام LazyDatabase
drift.LazyDatabase _openConnection() {
  return drift.LazyDatabase(() async {
    // الحصول على دليل التطبيق لحفظ قاعدة البيانات فيه
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return drift_native.NativeDatabase(file);
  });
}
