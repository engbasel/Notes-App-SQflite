// ignore: constant_identifier_names
import 'helper/SQLhelper.dart';

const String TABLE_NAME = 'notes'; // Corrected table name
// ignore: constant_identifier_names
const String NOTE_COLUMN = 'note';
// ignore: constant_identifier_names
const String MAIN_TITLE_COLUMN = 'mainTitle';
// ignore: constant_identifier_names
const String SUB_TITLE_COLUMN = 'subTitle';

// -----------------------------------
// A function to insert values into a database table with the provided main title, sub title, and note values.
void InsetrFunctionToAddValus(
  String mainTitleColumnValues,
  String subTitleColumnValues,
  String noteColumnValues,
) async {
  try {
    Sqldb sqldb = Sqldb();
    int response = await sqldb.insertData(
        "INSERT INTO $TABLE_NAME ($MAIN_TITLE_COLUMN, $SUB_TITLE_COLUMN, $NOTE_COLUMN) VALUES ('$mainTitleColumnValues', '$subTitleColumnValues', '$noteColumnValues')");
    print('Insert response: $response');
  } catch (e) {
    print('Error inserting data: $e');
  }
}

// -----------------------------------
int KdurationTime = 2;
// -----------------------------------
