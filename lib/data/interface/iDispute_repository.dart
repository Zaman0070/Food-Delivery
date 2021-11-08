import 'package:zcart/data/models/dispute/dispute_details_model.dart';
import 'package:zcart/data/models/dispute/dispute_info_model.dart';
import 'package:zcart/data/models/dispute/disputes_model.dart';

abstract class IDisputeRepository {
  Future<List<Disputes>> fetchDisputes();

  Future<List<Disputes>> fetchMoreDisputes();

  Future<DisputeInfo?> fetchDisputeInfo(orderId);

  Future openDispute(orderId, requestBody);

  Future markAsSolved(disputeId);

  Future<DisputeDetails?> disputeDetails(disputeId);

  Future responseDispute(disputeId, requestBody);

  Future appealDispute(disputeId, requestBody);
}
