import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stray_dog_adoption/data/constant/app_collection.dart';

part 'adoption_request.freezed.dart';
part 'adoption_request.g.dart';

@freezed
class AdoptionRequest with _$AdoptionRequest {
  const factory AdoptionRequest({
    required String adoptionId,
    required String userId,
    required String dogId,
    required String requestUserEmail,
    required String ownerUserId,    
    required Decision organizationDecision,
  }) = _AdoptionRequest;

  factory AdoptionRequest.fromJson(Map<String, dynamic> json) =>
      _$AdoptionRequestFromJson(json);
}

@freezed
class DoctorRequest with _$DoctorRequest {
  const factory DoctorRequest({
    required String doctorRequestId,
    required String requestUserEmail,
    required String requestUserId,
    required String doctorId,
    required Decision doctorDecision,
  }) = _DoctorRequest;

  factory DoctorRequest.fromJson(Map<String, dynamic> json) =>
      _$DoctorRequestFromJson(json);
}

@freezed
class Decision with _$Decision {
  const factory Decision({
    required String status, // Options: accepted, rejected
    required String reason,
  }) = _Decision;

  factory Decision.fromJson(Map<String, dynamic> json) =>
      _$DecisionFromJson(json);
}

class DecisionOption extends StatelessWidget {
  const DecisionOption({
    required this.onChanged,
    super.key,
    this.value,
    this.disabled = false,
  });
  final bool disabled;
  final String? value;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: DropdownButton<String>(
        value: value,
        icon: disabled ? const SizedBox.shrink() : null,
        items: AppDecision.list.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
