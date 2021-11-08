import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/interface/iDispute_repository.dart';
import 'package:zcart/data/models/dispute/dispute_details_model.dart';
import 'package:zcart/data/models/dispute/dispute_info_model.dart';
import 'package:zcart/data/models/dispute/disputes_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class DisputeRepository implements IDisputeRepository {
  late DisputesModel disputesModel;
  List<Disputes> disputes = [];

  @override
  Future<List<Disputes>> fetchDisputes() async {
    disputes.clear();

    var responseBody =
        await handleResponse(await getRequest(API.disputes, bearerToken: true));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    disputesModel = DisputesModel.fromJson(responseBody);
    disputes.addAll(disputesModel.data!);
    return disputes;
  }

  @override
  Future<List<Disputes>> fetchMoreDisputes() async {
    var responseBody;

    if (disputesModel.links!.next != null) {
      toast(LocaleKeys.loading.tr());
      responseBody = await handleResponse(await getRequest(
          disputesModel.links!.next!.split('api/').last,
          bearerToken: true));

      disputesModel = DisputesModel.fromJson(responseBody);
      disputes.addAll(disputesModel.data!);
      return disputes;
    } else {
      return disputes;
    }
  }

  @override
  Future<DisputeInfo?> fetchDisputeInfo(orderId) async {
    var responseBody = await handleResponse(
        await getRequest(API.disputeInfo(orderId), bearerToken: true));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    DisputeInfoModel disputeInfoModel = DisputeInfoModel.fromJson(responseBody);
    return disputeInfoModel.data;
  }

  @override
  Future openDispute(orderId, requestBody) async {
    var responseBody;
    try {
      responseBody = await handleResponse(await postRequest(
          API.openDispute(orderId), requestBody,
          bearerToken: true));
      if (responseBody.runtimeType == int) if (responseBody > 206)
        throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future markAsSolved(disputeId) async {
    var responseBody = await handleResponse(
        await putRequest(API.markAsSolved(disputeId), {}, bearerToken: true));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
  }

  @override
  Future<DisputeDetails?> disputeDetails(disputeId) async {
    var responseBody = await handleResponse(
        await getRequest(API.disputeDetails(disputeId), bearerToken: true));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    DisputeDetailsModel disputeDetailsModel =
        DisputeDetailsModel.fromJson(responseBody);
    return disputeDetailsModel.data;
  }

  @override
  Future responseDispute(disputeId, requestBody) async {
    var responseBody;
    try {
      responseBody = await handleResponse(await postRequest(
          API.responseDispute(disputeId), requestBody,
          bearerToken: true));
      if (responseBody.runtimeType == int) if (responseBody > 206)
        throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }

  @override
  Future appealDispute(disputeId, requestBody) async {
    var responseBody;
    try {
      responseBody = await handleResponse(await postRequest(
          API.appealDispute(disputeId), requestBody,
          bearerToken: true));
      if (responseBody.runtimeType == int) if (responseBody > 206)
        throw NetworkException();
    } catch (e) {
      throw NetworkException();
    }
  }
}
