import 'package:data_table_2/data_table_2.dart';
import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

class PatientsDataTable extends StatelessWidget {
  const PatientsDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 10,
      dividerThickness: 1,
      headingRowColor: MaterialStatePropertyAll(AppColors.primary.withOpacity(0.5)),
      headingRowHeight: 64,
      headingTextStyle: AppTextStyle.robotoSemibold14.copyWith(color: AppColors.secondary),
      dataRowColor: const MaterialStatePropertyAll(AppColors.white),
      dataRowHeight: 64,
      dataTextStyle: AppTextStyle.robotoRegular14.copyWith(color: AppColors.secondary),
      columns: const [
        DataColumn2(
          label: Text('Nombre'),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text('Apellido'),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text('Plan activo'),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text('Frecuencia'),
          size: ColumnSize.L,
        ),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('Mark')),
          DataCell(Text('Smith')),
          DataCell(Text('Sí')),
          DataCell(Text('Mensual')),
        ]),
        DataRow(cells: [
          DataCell(Text('John')),
          DataCell(Text('Doe')),
          DataCell(Text('No')),
          DataCell(Text('Semanal')),
        ]),
        DataRow(cells: [
          DataCell(Text('Jane')),
          DataCell(Text('Obrien')),
          DataCell(Text('Sí')),
          DataCell(Text('Mensual')),
        ]),
        DataRow(cells: [
          DataCell(Text('Mike')),
          DataCell(Text('Johnson')),
          DataCell(Text('No')),
          DataCell(Text('Quincenal')),
        ]),
      ],
    );
  }
}