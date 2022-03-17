class Quants  {
  int? id;
  String? accName;
  String? accNo;
  String? bankName;
  String? ifscCode;
  String? bankBranch;
  int? isActive;
  String? createdDate;
  String? modifiedDate;

  Quants (
      {this.id,
        this.accName,
        this.accNo,
        this.bankName,
        this.ifscCode,
        this.bankBranch,
        this.isActive,
        this.createdDate,
        this.modifiedDate});

  Quants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accName = json['acc_name'];
    accNo = json['acc_no'];
    bankName = json['bank_Name'];
    ifscCode = json['ifsc_code'];
    bankBranch = json['bank_branch'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['acc_name'] = accName;
    data['acc_no'] = accNo;
    data['bank_Name'] = bankName;
    data['ifsc_code'] = ifscCode;
    data['bank_branch'] = bankBranch;
    data['is_active'] = isActive;
    data['created_date'] = createdDate;
    data['modified_date'] = modifiedDate;
    return data;
  }
}
