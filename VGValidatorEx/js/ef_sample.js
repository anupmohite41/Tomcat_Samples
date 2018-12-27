function GetEF_IDN_CN_Result() {
    var result = GetEF_IDN_CN();
    document.getElementById('resIDNCN').value = result;
}

function GetEF_HolderSignatureImage_Result() {
    var result = GetEF_HolderSignatureImage();
    document.getElementById('resHolderSignatureImage').value = result;

}

function GetEF_Photography_Result() {
    var result = GetEF_Photography();
    document.getElementById('resPhotography').value = result;

}

function GetEF_ModifiableData_Result() {
    var result = GetEF_ModifiableData();
    document.getElementById('resModifiableData').value = result;
}

function GetEF_NonModifiableData_Result() {
    var result = GetEF_NonModifiableData();
    document.getElementById('resNonModifiableData').value = result;
}

function GetEF_RootCertificate_Result() {
    var result = GetEF_RootCertificate();
    document.getElementById('resRootCertificate').value = result;
}

function GetEF_HomeAddress_Result() {
    var result = GetEF_HomeAddress();
    document.getElementById('resHomeAddress').value = result;
}

function GetEF_WorkAddress_Result() {
    var result = GetEF_WorkAddress();
    document.getElementById('resWorkAddress').value = result;
}

function GetPhotography_DataSigned_Result() {
    var result = GetPhotography_DataSigned();
    document.getElementById('resPhotographyDataSigned').value = result;
}

function GetCardHolderData_SF3_DataSigned_Result() {
    var result = GetCardHolderData_SF3_DataSigned();
    document.getElementById('resCardHolderDataSF3DataSigned').value = result;
}

function GetCardHolderData_SF5_DataSigned_Result() {
    var result = GetCardHolderData_SF5_DataSigned();
    document.getElementById('resCardHolderDataSF5DataSigned').value = result;
}

function GetCardHolderData_SF3_Signature_Result() {
    var result = GetCardHolderData_SF3_Signature();
    document.getElementById('resCardHolderDataSF3Signature').value = result;
}

function GetCardHolderData_SF5_Signature_Result() {
    var result = GetCardHolderData_SF5_Signature();
    document.getElementById('resCardHolderDataSF5Signature').value = result;
}

function GetPhotography_Signature_Result() {
    var result = GetPhotography_Signature();
    document.getElementById('resPhotographySignature').value = result;
}

function GetHolderSignatureImageSignature_Result() {
    var result = PublicDataWebComponent.GetHolderSignatureImageSignature();
    document.getElementById('resHolderSignatureImageSignature').value = result;
}

function GetWorkAddressDataSignature_Result() {
    var result = PublicDataWebComponent.GetWorkAddressDataSignature();
    document.getElementById('resWorkAddressDataSignature').value = result;
}

function GetHomeAddressDataSignature_Result() {
    var result = PublicDataWebComponent.GetHomeAddressDataSignature();
    document.getElementById('resHomeAddressDataSignature').value = result;
}