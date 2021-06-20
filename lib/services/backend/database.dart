import 'dart:async';
import 'package:meta/meta.dart';

import 'firestore_services.dart';

abstract class Database {
  // Future<void> setSurvey(Survey survey);
  // Future<void> deleteSurvey(Survey survey);
  // Stream<List<Survey>> surveysStream();
  // Stream<Survey> surveyStream({@required String surveyId});
  //
  // Future<void> setEntry(NewEntry newEntry);
  // Future<void> deleteEntry(NewEntry newEntry);
  // Stream<List<NewEntry>> entriesStream({Survey survey});
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  // @override
  // Future<void> setSurvey(Survey survey) async => await _service.setData(
  //   path: APIPath.survey(uid, survey.id),
  //   data: survey.toMap(),
  // );
  //
  // @override
  // Future<void> deleteSurvey(Survey survey) async {
  //   // delete where entry.jobId == job.jobId
  //   final allEntries = await entriesStream(survey: survey).first;
  //   for (NewEntry newEntry in allEntries) {
  //     if (newEntry.surveyId == survey.id) {
  //       await deleteEntry(newEntry);
  //     }
  //   }
  //   // delete job
  //   await _service.deleteData(path: APIPath.survey(uid, survey.id));
  // }
  //
  // @override
  // Stream<Survey> surveyStream({@required String surveyId}) => _service.documentStream(
  //   path: APIPath.survey(uid, surveyId),
  //   builder: (data, documentId) => Survey.fromMap(data, documentId),
  // );
  //
  // @override
  // Stream<List<Survey>> surveysStream() => _service.collectionStream(
  //   path: APIPath.surveys(uid),
  //   builder: (data, documentId) => Survey.fromMap(data, documentId),
  // );
  //
  // @override
  // Future<void> setEntry(NewEntry newEntry) async => await _service.setData(
  //   path: APIPath.entry(uid, newEntry.id),
  //   data: newEntry.toMap(),
  // );
  //
  // @override
  // Future<void> deleteEntry(NewEntry newEntry) async =>
  //     await _service.deleteData(path: APIPath.entry(uid, newEntry.id));
  //
  // @override
  // Stream<List<NewEntry>> entriesStream({Survey survey}) =>
  //     _service.collectionStream<NewEntry>(
  //       path: APIPath.entries(uid),
  //       queryBuilder: survey != null
  //           ? (query) => query.where('jobId', isEqualTo: survey.id)
  //           : null,
  //       builder: (data, documentID) => NewEntry.fromMap(data, documentID),
  //       // sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
  //     );
}
