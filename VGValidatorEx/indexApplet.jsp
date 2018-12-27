<!--
// Copyright (EIDA) 2004-2016 Emirates Identity Authority (EIDA)
// email: PKITeam@emiratesid.ae
// All rights reserved.

// The source code is sole property of Emirates Identity Authority, Abu Dhabi, UAE. Even after modifications it is still property of Emirates Identify Authority.
// This source has to be kept in strict confidence and must not be disclosed to any third party in any case.
-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Validation Gateway Validator</title>
        <script type="text/javascript" language="javascript" src="js/eida_webcomponents.js"></script>
        <script type="text/javascript" language="javascript" src="js/errors.js"></script>
        <script type="text/javascript" language="javascript" src="js/occupations.js"></script>
        <script type="text/javascript" language="javascript" src="js/fingers.js"></script>
        <script type="text/javascript" language="javascript" src="js/ef_sample.js"></script>
        <style>
            SPAN,
            INPUT {
                font-family: verdana;
                font-size: 11px;
            }
        </style>

        <script>
            function changeDisplay(tabRo) {
                var selTabRo = document.getElementById(tabRo);
                var selImage = document.getElementById(tabRo + "Img");
                if (tabRo === "homeAddressBook" || tabRo === "workAddressBook" || tabRo === "ExtendedInfo") {
                    if (selTabRo.style.display === "block") {
                        selTabRo.style.display = "none";
                        selImage.src = "images/expand.png"
                    } else {
                        selTabRo.style.display = "block";
                        selImage.src = "images/collapse.png"
                    }
                }
            }
        </script>

    </head>

    <body style="font-size: 10px; font-style: verdana;" background="images/content-bg.jpg">
        <input type="hidden" id="callerID" value="indexApplet" />
        <table border="1" align="center">
            <tr>
                <td>
                    <table border="0" align="left">
                        <tr>
                            <td>
                                <img src="images/final.png" />
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <div style="font-size: 15px; font-family: verdana">
                                    <font color="Green">
                                        <b>UAE Card Public Data
                                            <br /> Applet Sample Application V1.3.0</b>
                                    </font>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%
                    if (request.getParameter("ValidationMessage") != null
                                    && request.getParameter("ValidationMessage") != "") {
            %>
                <tr>
                    <td align="center">
                        <div id="divStatus" style="height: 30px; background-color: threedface; border: 1px solid gray; -moz-border-radius: 20px 20px 20px 20px; border-radius: 20px 20px 20px 20px; width: 300px; padding-top: 13px; font-size: 13px; font-family: verdana;">
                            <%=request.getParameter("ValidationMessage")%>
                        </div>
                    </td>
                </tr>
                <%
                    }
            %>
                    <tr style="background-color: #4F3419; border: solid 1px gray">
                        <td>
                            <table border="0" align="left">
                                <tr>
                                    <td>
                                        <input id="btnInitialize" type="button" value="Initialize" style="font-size: 10px; font-style: verdana;" onclick="Initialize();"
                                        />
                                    </td>
                                                                                                          
                                    <td>
                                        <input id="btnRegDevice" type="button" value="Register Device" style="font-size: 10px; font-style: verdana;" onclick="registerDevice();"
                                        disabled />
                                    </td>

                                    <td>
                                        <input id="btnReadPublicData" type="button" value="Display Card Data" style="font-size: 10px; font-style: verdana;" onclick="DisplayPublicData();"
                                            disabled />
                                    </td>
                                   
                                    <td>
                                        <span id="loading_data" style="visibility: hidden; color: green;">&nbsp;</span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td align="center">
                                                    <APPLET style="border:solid 1px gray" id="PublicDataWebComponent" name="PublicDataWebComponent" CODE="emiratesid.jio.webcomponents.PublicDataReader"
                                                        ARCHIVE="PublicDataApplet-Sagem.jar" WIDTH="134" HEIGHT="160">
                                                        <param name="EncryptParameters" value="false" />
                                                        <param name="RelativeCertPath" value="certs" />
                                                        <param name="debugMode" value="true" /> This browser does not support Applets.
                                                    </APPLET>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table border="0">
                                                        <tr>
                                                            <td>
                                                                <span>ID Type:&nbsp;</span>
                                                            </td>
                                                            <td>
                                                                <span id="IDType_PDLabel">
                                                                    <b>--</b>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span>CSN:&nbsp;</span>
                                                            </td>
                                                            <td>
                                                                <span id="CardSerialNumber_PDLabel">
                                                                    <b>--</b>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span>ID Number:&nbsp;</span>
                                                            </td>
                                                            <td>
                                                                <span id="IDNumber_PDLabel">
                                                                    <b>--</b>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span>Card Number:&nbsp;</span>
                                                            </td>
                                                            <td>
                                                                <span id="CardNumber_PDLabel">
                                                                    <b>--</b>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span>Issue Date:&nbsp;</span>
                                                            </td>
                                                            <td>
                                                                <span id="IssueDate_PDLabel">
                                                                    <b>--</b>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span>Expiry Date:&nbsp;</span>
                                                            </td>
                                                            <td>
                                                                <span id="ExpiryDate_PDLabel">
                                                                    <b>--</b>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <span>Card Version:&nbsp;</span>
                                                            </td>
                                                            <td>
                                                                <span id="CardVersion_PDLabel">
                                                                    <b>--</b>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="0">
                                            <tr>
                                                <td>
                                                    <span>Gender:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="Sex_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Date of Birth:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="DateOfBirth_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Full Name (Ar):&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="ArabicFullName_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Full Name:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="FullName_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Marital Status:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="MaritalStatus_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Occupation:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="Occupation_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Occupation Code:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="OccupationCode_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Title (Ar):&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="ArabicTitle_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Title:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="Title_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Nationality (Ar):&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="ArabicNationality_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Nationality:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="Nationality_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <span>Nationality Code:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="NationalityCode_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>
                                    <td>
                                        <table border="0">
                                            <tr>
                                                <td>
                                                    <span>Mother First Name (Ar):&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="ArabicMotherFirstName_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Mother First Name:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="MotherFirstName_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Familly ID:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="FamilyID_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Husband IDN:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="HusbandIDN_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Sponsor Type:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="SponsorType_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Sponsor Number:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="SponsorNumber_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Sponsor Name:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="SponsorName_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Residency Type:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="ResidencyType_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Residency Number:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="ResidencyNumber_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span>Residency Expiry Date:&nbsp;</span>
                                                </td>
                                                <td>
                                                    <span id="ResidencyExpiryDate_PDLabel">
                                                        <b>--</b>
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="background-color: #ECDCC3; border: solid 1px gray">
                                <img id="ExtendedInfoImg" alt="" src="images/expand.png" onclick="changeDisplay('ExtendedInfo')" />
                                <font size="3">
                                    <B>Extended Info.</B>
                                </font>
                            </div>
                        </td>
                    </tr>
                    <tr id="ExtendedInfo" style="display:none">
                        <td>
                            <table border="0" style="background-color: #ECDCC3; border: solid 1px gray" align="center" width="100%">
                                <tr>
                                    <td>
                                        <span>
                                            <b></b>&nbsp;</span>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Place Of Birth (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicPlaceOfBirth_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Place Of Birth:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="PlaceOfBirth_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Occupation (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicOccupation_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Occupation:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="Occupation_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Occupation Type (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicOccupationType_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Occupation Type:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="OccupationType_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Occupation Field Code :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="OccupationFieldCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Company Name (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicCompanyName_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Company Name :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="CompanyName_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Passport Number:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="PassportNumber_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Passport Type Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="PassportTypeCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Passport Country Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="PassportCountryCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Passport Country Description (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicPassportCountryDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Passport Country Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="PassportCountryDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Passport Issue Date:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="PassportIssueDate_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Passport Expiry Date:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="PassportExpiryDate_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Qualification Level Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="QualificationLevelCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Qualification Level Description (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicQualificationLevelDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Qualification Level Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="QualificationLevelDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Degree Description (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicDegreeDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Degree Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="DegreeDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Field Of Study Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="FieldOfStudyCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Field Of Study(Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicFieldOfStudy_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Field Of Study:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="FieldOfStudy_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Place Of Study (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicPlaceOfStudy_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Place Of Study:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="PlaceOfStudy_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Date Of Graduation:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="DateOfGraduation_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="">
                                            <b></b>
                                        </span>
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="background-color: #ECDCC3; border: solid 1px gray">
                                <img id="homeAddressBookImg" alt="" src="images/expand.png" onclick="changeDisplay('homeAddressBook')">
                                <font size="3">
                                    <strong>Home Address Book</strong>
                                </font>
                            </div>
                        </td>
                    </tr>
                    <tr id="homeAddressBook" style="display:none">
                        <td>
                            <table border="0" style="background-color: #ECDCC3; border: solid 1px gray" align="center" width="100%">
                                <tr>
                                    <td>
                                        <span>
                                            <b></b>&nbsp;</span>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Address Type Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressTypeCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Location Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressLocationCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Emirate Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressEmirateCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Emirate Description (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicHomeAddressEmirateDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Emirates Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressEmirateDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>City Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressCityCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>City Description (Ar) :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicHomeAddressCityDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>City Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressCityDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Street (Ar) :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicHomeAddressStreet_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Street :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressStreet_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>PO BOX:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressPOBox_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Area Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressAreaCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Area Description (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicHomeAddressAreaDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Area Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressAreaDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Building Name (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicHomeAddressBuildingName_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Building Name :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressBuildingName_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Flat No :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressFlatNo_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Resident Phone Number (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressResidentPhoneNumber_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Mobile Phone Number:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressMobilePhoneNumber_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Email :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="HomeAddressEmail_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span></span>
                                    </td>
                                    <td>
                                        <span>
                                            <b></b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>&nbsp;</span>
                                    </td>
                                    <td>
                                        <span>
                                            <b></b>
                                        </span>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div style="background-color: #ECDCC3; border: solid 1px gray">
                                <img id="workAddressBookImg" alt="" src="images/expand.png" onclick="changeDisplay('workAddressBook')" />
                                <font size="3">
                                    <B>Work Address Book</B>
                                </font>
                            </div>
                        </td>
                    </tr>
                    <tr id="workAddressBook" style="display: none;">
                        <td>
                            <table border="0" style="background-color: #ECDCC3; border: solid 1px gray" align="center" width="100%">
                                <tr>
                                    <td>
                                        <span>
                                            <b></b>&nbsp;</span>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Address Type Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressTypeCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Location Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressLocationCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Company Name (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicWorkAddressCompanyName_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Company Name:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressCompanyName_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Emirate Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressEmirateCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Emirates Description (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicWorkAddressEmirateDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>Emirates Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressEmirateDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>City Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressCityCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span>City Description (Ar) :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicWorkAddressCityDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>City Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressCityDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Street (Ar) :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicWorkAddressStreet_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Street :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressStreet_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>PO BOX:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressPOBox_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Area Code:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressAreaCode_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Area Description (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicWorkAddressAreaDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Area Description:&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressAreaDescription_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Building Name (Ar):&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="ArabicWorkAddressBuildingName_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Building Name :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressBuildingName_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <span>Land Phone # :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressLandPhoneNo_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>Mobile Phone Number :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressMobilePhoneNumber_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                </tr>
                                <tr>

                                    <td>
                                        <span>Email :&nbsp;</span>
                                    </td>
                                    <td>
                                        <span id="WorkAddressEmail_PDLabel">
                                            <b>--</b>
                                        </span>
                                    </td>
                                    <td>
                                        <span>&nbsp;</span>
                                    </td>
                                    <td>
                                        <span>
                                            <b></b>
                                        </span>
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>

                    <tr style="background-color: #4F3419; border: solid 1px gray">
                        <td>
                            <table border="0" align="left">
                                <tr>
                                    <td>
                                        <form method="post" action="Validator?caller=indexApplet" onsubmit="return ValidateCardStatus();">
                                            <input type="hidden" name="ValidationType" value="VGResponse" />
                                            <input id="cardStatusResponse" type="hidden" name="ValidationRequest" value="" />
                                            <input id="btnCardStatus" type="submit" value="Check Card Status" style="font-size: 10px; font-style: verdana;" disabled
                                            />
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="bio-info" style="color:red;font-size: 14px; font-weight: bold"></div>
                        </td>
                    </tr>
                    <tr style="background-color: #4F3419; border: solid 1px gray">
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <input id="btnCheckBiometricInfo" type="button" value="Biometric Authentication" style="font-size: 10px; font-style: verdana;"
                                            onclick="CheckBiometricInfo();" disabled />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div id="biometric-validation"></div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr>
                                                <td colspan="2">
                                                    <span>
                                                        <b>Signing: </b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100">
                                                    <span>PIN:</span>
                                                </td>
                                                <td>
                                                    <input id="txtPINSignData" type="password" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <textarea id="txtSignData" cols="60" rows="5"></textarea>
                                                </td>
                                            </tr>
                                            <tr style="background-color: #4F3419; border: solid 1px gray">
                                                <td colspan="2" align="right">
                                                    <form action="Validator?caller=indexApplet" method="post" onsubmit="return ValidateSignData(document.getElementById('txtPINSignData').value, document.getElementById('txtSignData').value);">

                                                        <input id="DataSigned" name="DataSigned" value="" type="hidden" />
                                                        <input id="SignDataResponse" name="ValidationRequest" value="" type="hidden" />
                                                        <input id="SignCertificate" name="Certificate" value="" type="hidden" />
                                                        <input name="ValidationType" value="SignDataResponse" type="hidden" />
                                                        <input id="btnSignData" type="submit" value="Sign Data" style="font-size: 10px; font-style: verdana;" disabled />
                                                    </form>
                                                </td>
                                                <td>
                                                    <form action="Validator?caller=indexApplet" method="post" onsubmit="return ValidateSignChallenge(document.getElementById('txtPINSignData').value, document.getElementById('txtSignData').value);">

                                                        <input id="XDataSigned" name="DataSigned" value="" type="hidden" />
                                                        <input id="SignChallengeResponse" name="ValidationRequest" value="" type="hidden" />
                                                        <input id="AuthCertificate" name="Certificate" value="" type="hidden" />
                                                        <input name="ValidationType" value="SignChallengeResponse" type="hidden" />
                                                        <input id="btnSignChallenge" type="submit" value="Sign Challenge" style="font-size: 10px; font-style: verdana;" disabled
                                                        />
                                                    </form>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr>
                                                <td colspan="2">
                                                    <span>
                                                        <b>PIN Reset:</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100">
                                                    <span>New PIN:</span>
                                                </td>
                                                <td>
                                                    <input id="txtPINReset" type="password" />
                                                </td>
                                            </tr>
                                            <tr style="background-color: #4F3419; border: solid 1px gray">

                                                <td colspan="2" align="right">
                                                    <input id="btnPINReset" type="button" value="Reset PIN" style="font-size: 10px; font-style: verdana;" onclick="PinReset();"
                                                        disabled />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr>
                                                <td colspan="2">
                                                    <span>
                                                        <b>PKI Authentication:</b>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100">
                                                    <span>PIN:</span>
                                                </td>
                                                <td>
                                                    <input id="txtPKIAuthenticate" type="password" />
                                                </td>
                                            </tr>
                                            <tr style="background-color: #4F3419; border: solid 1px gray">

                                                <td colspan="2" align="right">
                                                    <form method="post" action="Validator?caller=indexApplet" onsubmit="return ValidatePKIAuthenticate(document.getElementById('txtPKIAuthenticate').value);">
                                                        <input type="hidden" name="ValidationType" value="VGResponse" />
                                                        <input id="PKIAuthenticateResponse" type="hidden" name="ValidationRequest" value="" />
                                                        <input id="btnPKIAuthenticate" type="submit" value="PKI Authenticate" style="font-size: 10px; font-style: verdana;" disabled
                                                        />
                                                    </form>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnIDNCN" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetEF_IDN_CN_Result()"
                                                        value="EF IDN_CN" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resIDNCN" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnHolderSignatureImage" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetEF_HolderSignatureImage_Result()"
                                                        value="EF HolderSignatureImage" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resHolderSignatureImage" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnPhotography" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetEF_Photography_Result()"
                                                        value="EF Photography" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resPhotography" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnModifiableData" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetEF_ModifiableData_Result()"
                                                        value="EF ModifiableData" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resModifiableData" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnNonModifiableData" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetEF_NonModifiableData_Result()"
                                                        value="EF NonModifiableData" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resNonModifiableData" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnRootCertificate" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetEF_RootCertificate_Result()"
                                                        value="EF RootCertificate" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resRootCertificate" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnHomeAddress" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetEF_HomeAddress_Result()"
                                                        value="EF HomeAddress" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resHomeAddress" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnWorkAddress" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetEF_WorkAddress_Result()"
                                                        value="EF WorkAddress" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resWorkAddress" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnPhotographyDataSigned" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetPhotography_DataSigned_Result()"
                                                        value=" Photography DataSigned" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resPhotographyDataSigned" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnCardHolderDataSF3DataSigned" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetCardHolderData_SF3_DataSigned_Result()"
                                                        value=" CardHolder Data SF3 DataSigned" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resCardHolderDataSF3DataSigned" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnCardHolderDataSF5DataSigned" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetCardHolderData_SF5_DataSigned_Result()"
                                                        value=" CardHolder Data SF5 DataSigned" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resCardHolderDataSF5DataSigned" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnCardHolderDataSF3Signature" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetCardHolderData_SF3_Signature_Result()"
                                                        value=" CardHolder Data SF3 Signature" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resCardHolderDataSF3Signature" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnCardHolderDataSF5Signature" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetCardHolderData_SF5_Signature_Result()"
                                                        value=" CardHolder Data SF5 Signature" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resCardHolderDataSF5Signature" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnPhotographySignature" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetPhotography_Signature_Result()"
                                                        value="Photography Signature" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resPhotographySignature" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnHolderSignatureImageSignature" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetHolderSignatureImageSignature_Result()"
                                                        value="Holder SignatureImage Signature" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resHolderSignatureImageSignature" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnHomeAddressDataSignature" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetHomeAddressDataSignature_Result()"
                                                        value="Home Address DataSignature" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resHomeAddressDataSignature" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="0" width="100%" style="background-color: #ECDCC3; border: solid 1px gray" align="center">
                                <tr>
                                    <td>
                                        <table border="0" align="left" width="100%">
                                            <tr style="background-color: #4F3419; border: solid 1px gray;width:100%">
                                                <td colspan="4">
                                                    <input id="btnWorkAddressDataSignature" type="button" style="font-size: 10px; font-style: verdana;" disabled onclick="GetWorkAddressDataSignature_Result()"
                                                        value="WorkAddress DataSignature" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100" colspan="2">
                                                    <span>Result:</span>
                                                </td>
                                                <td colspan="2">
                                                    <textarea cols="50" rows="2" id="resWorkAddressDataSignature" disabled></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
        </table>
    </body>

    </html>