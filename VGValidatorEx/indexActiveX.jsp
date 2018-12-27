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
<script type="text/javascript" language="javascript" src="js/errors.js"></script>
<script type="text/javascript" language="javascript" src="js/occupations.js"></script>
<script type="text/javascript" language="javascript" src="js/fingers.js"></script>
<script type="text/javascript" language="javascript" src="js/eida_webcomponents.js"></script>
<style>
SPAN,INPUT {
	font-family: verdana;
	font-size: 11px;
}
</style>
</head>
<body style="font-size: 10px; font-style: verdana;">
<OBJECT ID="SAGEMCaptureActiveX" WIDTH=0 HEIGHT=0 CLASSID="CLSID:CDC9AAB8-D9F3-46E2-88A5-1D79154F0772">
		<PARAM NAME="_Version" VALUE="65536">
		<PARAM NAME="_ExtentX" VALUE="418">
		<PARAM NAME="_ExtentY" VALUE="127">
		<PARAM NAME="_StockProps" VALUE="0">
</OBJECT>
<input type="hidden" id="callerID" value="index"/>
<table border="0" align="center">
	<tr>
		<td>
		<table border="0" align="left">
			<tr>
				<td><img src="images/logoeida.gif"></img></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
				<div style="font-size: 14px; font-family: verdana"><font
					color="red"> UAE Card Public Data <br />
				Applet Sample Application </font></div>
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
		<div
			style="height: 30px; background-color: threedface; border: 1px solid gray; -moz-border-radius: 20px 20px 20px 20px; border-radius: 20px 20px 20px 20px; width: 300px; padding-top: 13px; font-size: 13px; font-family: verdana;"><%=request.getParameter("ValidationMessage")%></div>
		</td>
	</tr>
	<%
		}
	%>
	<tr>
		<td>
		<table border="0" align="left">
			<tr>
				<td><input id="btnInitialize" type="button" value="Initialize"
					style="font-size: 10px; font-style: verdana;"
					onclick="Initialize();"></input></td>
				<td><input id="btnReadPublicData" type="button"
					value="Display Card Data"
					style="font-size: 10px; font-style: verdana;"
					onclick="DisplayPublicData();" disabled></input></td>
				<td><span id="loading_data"
					style="visibility: hidden; color: red;">&nbsp;</span></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
		<table width="100%"
			style="background-color: #cfd8fd; border: solid 1px gray"
			align="center">
			<tr>
				<td>
				<table>
					<tr>
						<td align="center">
<%
String userAgent = request.getHeader("user-agent");

if(userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident/") != -1 ){ // && userAgent.indexOf("x64") != -1) {
out.print(userAgent);
%>
					
<OBJECT id="PublicDataWebComponent" codeBase="CAB/EIDACard64.CAB#version=1.0.1.1" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 0px; POSITION: absolute; TOP: 0px; HEIGHT: 0px"	classid="clsid:7241B9A9-92C7-4DF7-9A48-DB59F09A63DB" VIEWASTEXT>
		<PARAM NAME="_Version" VALUE="65536">
		<PARAM NAME="_ExtentX" VALUE="0">
		<PARAM NAME="_ExtentY" VALUE="0">
		<PARAM NAME="_StockProps" VALUE="0">
		<param name="EncryptParameters" value="false" />
		Active-X Component Was Not Loaded
	</OBJECT>
	<%
}else 
if(userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident/") != -1 ){ //&& userAgent.indexOf("x64") == -1){
 out.print(userAgent);
        %>
	
	<OBJECT id="PublicDataWebComponent" codeBase="CAB/EIDACard.CAB#version=1.0.1.1" style="Z-INDEX: 101; LEFT: 0px; WIDTH: 0px; POSITION: absolute; TOP: 0px; HEIGHT: 0px"	classid="clsid:7241B9A9-92C7-4DF7-9A48-DB59F09A63DB" VIEWASTEXT>
		<PARAM NAME="_Version" VALUE="65536">
		<PARAM NAME="_ExtentX" VALUE="0">
		<PARAM NAME="_ExtentY" VALUE="0">
		<PARAM NAME="_StockProps" VALUE="0">
		<param name="EncryptParameters" value="false" />
		Active-X Component Was Not Loaded
	</OBJECT>
	<%} %>
						</td>
					</tr>
					<tr>
						<td>
						<table>
							<tr>
								<td><span>ID Type:&nbsp;</span></td>
								<td><span id="IDType_PDLabel"><b>--</b></span></td>
							</tr>
							<tr>
								<td><span>CSN:&nbsp;</span></td>
								<td><span id="CardSerialNumber_PDLabel"><b>--</b></span></td>
							</tr>
							<tr>
								<td><span>ID Number:&nbsp;</span></td>
								<td><span id="IDNumber_PDLabel"><b>--</b></span></td>
							</tr>
							<tr>
								<td><span>Card Number:&nbsp;</span></td>
								<td><span id="CardNumber_PDLabel"><b>--</b></span></td>
							</tr>
							<tr>
								<td><span>Issue Date:&nbsp;</span></td>
								<td><span id="IssueDate_PDLabel"><b>--</b></span></td>
							</tr>
							<tr>
								<td><span>Expiry Date:&nbsp;</span></td>
								<td><span id="ExpiryDate_PDLabel"><b>--</b></span></td>
							</tr>
						</table>
						</td>
					</tr>
				</table>

				</td>

				<td>
				<table>
					<tr>
						<td><span>Sex:&nbsp;</span></td>
						<td><span id="Sex_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Date of Birth:&nbsp;</span></td>
						<td><span id="DateOfBirth_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Full Name (Ar):&nbsp;</span></td>
						<td><span id="ArabicFullName_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Full Name:&nbsp;</span></td>
						<td><span id="FullName_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Marital Status:&nbsp;</span></td>
						<td><span id="MaritalStatus_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Occupation:&nbsp;</span></td>
						<td><span id="Occupation_PDLabel"> <b>--</b> </span></td>
					</tr>
					<tr>
						<td><span>Title (Ar):&nbsp;</span></td>
						<td><span id="ArabicTitle_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Title:&nbsp;</span></td>
						<td><span id="Title_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Nationality (Ar):&nbsp;</span></td>
						<td><span id="ArabicNationality_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Nationality:&nbsp;</span></td>
						<td><span id="Nationality_PDLabel"><b>--</b></span></td>
					</tr>

				</table>
				</td>
				<td>
				<table>
					<tr>
						<td><span>Mother First Name (Ar):&nbsp;</span></td>
						<td><span id="ArabicMotherFirstName_PDLabel"><b>--</b></span>
						</td>
					</tr>
					<tr>
						<td><span>Mother First Name:&nbsp;</span></td>
						<td><span id="MotherFirstName_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Familly ID:&nbsp;</span></td>
						<td><span id="FamilyID_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Husband IDN:&nbsp;</span></td>
						<td><span id="HusbandIDN_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Sponsor Type:&nbsp;</span></td>
						<td><span id="SponsorType_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Sponsor Number:&nbsp;</span></td>
						<td><span id="SponsorNumber_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Sponsor Name:&nbsp;</span></td>
						<td><span id="SponsorName_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Residency Type:&nbsp;</span></td>
						<td><span id="ResidencyType_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Residency Number:&nbsp;</span></td>
						<td><span id="ResidencyNumber_PDLabel"><b>--</b></span></td>
					</tr>
					<tr>
						<td><span>Residency Expiry Date:&nbsp;</span></td>
						<td><span id="ResidencyExpiryDate_PDLabel"><b>--</b></span></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td>
		<table border="0" align="left">
			<tr>
				<td><input id="btnCheckBiometricInfo" type="button"
					value="Biometric Authentication"
					style="font-size: 10px; font-style: verdana;"
					onclick="CheckBiometricInfo();" disabled></input></td>
				<td>
				<form method="post" action="Validator?caller=indexActiveX"
					onsubmit="return ValidateCardStatus();">
					<input type="hidden" name="ValidationType" value="VGResponse"/>
					<input
					id="cardStatusResponse" type="hidden" name="ValidationRequest"
					value="" /> <input id="btnCardStatus" type="submit"
					value="Check Card Status"
					style="font-size: 10px; font-style: verdana;" disabled /></form>
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
	
	<td colspan="4">
	   Fingerprint Data:
	   <br> 
	   <textarea name="txtFingerprintData" id="txtFingerprintData" cols="60" rows="5"></textarea>
	</td>
	</tr>
	<tr>
		<td>
		<table width="100%"
			style="background-color: #cfd8fd; border: solid 1px gray"
			align="center">
			<tr>
				<td>
				<table border="0" align="left" width="100%">
					<tr>
						<td colspan="2"><span><b>Signing: </b></span></td>
					</tr>
					<tr>
						<td width="100"><span>PIN:</span></td>
						<td><input id="txtPINSignData" type="password" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><textarea id="txtSignData" cols="60" rows="5"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<form action="Validator?caller=indexActiveX" method="post"
								onsubmit="return ValidateSignData(document.getElementById('txtPINSignData').value,document.getElementById('txtSignData').value);">
	
								<input id="DataSigned" name="DataSigned" value="" type="hidden" />
								<input id="SignDataResponse" name="ValidationRequest" value="" type="hidden" />
								<input id="SignCertificate" name="Certificate" value="" type="hidden" />
								<input name="ValidationType" value="SignDataResponse" type="hidden" />
								<input id="btnSignData" type="submit" value="Sign Data" style="font-size: 10px; font-style: verdana;" disabled />
							</form>
							<form action="Validator?caller=indexActiveX" method="post"
								onsubmit="return ValidateSignChallenge(document.getElementById('txtPINSignData').value,document.getElementById('txtSignData').value);">
	
								<input id="XDataSigned" name="DataSigned" value="" type="hidden" />
								<input id="SignChallengeResponse" name="ValidationRequest" value="" type="hidden" />
								<input id="AuthCertificate" name="Certificate" value="" type="hidden" />
								<input name="ValidationType" value="SignChallengeResponse" type="hidden" />
								<input id="btnSignChallenge" type="submit" value="Sign Challenge" style="font-size: 10px; font-style: verdana;" disabled />
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
		<table width="100%"
			style="background-color: #cfd8fd; border: solid 1px gray"
			align="center">
			<tr>
				<td>
				<table border="0" align="left" width="100%">
					<tr>
						<td colspan="2"><span><b>PIN Reset:</b></span></td>
					</tr>
					<tr>
						<td width="100"><span>New PIN:</span></td>
						<td><input id="txtPINReset" type="password" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="right"><input id="btnPINReset" type="button"
							value="Reset PIN" style="font-size: 10px; font-style: verdana;"
							onclick="PinReset();" disabled></input></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>

	<tr>
		<td>
		<table width="100%"
			style="background-color: #cfd8fd; border: solid 1px gray"
			align="center">
			<tr>
				<td>
				<table border="0" align="left" width="100%">
					<tr>
						<td colspan="2"><span><b>PKI Authentication:</b></span></td>
					</tr>
					<tr>
						<td width="100"><span>PIN:</span></td>
						<td><input id="txtPKIAuthenticate" type="password" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="right">
						<form method="post" action="Validator?caller=indexActiveX"
							onsubmit="return ValidatePKIAuthenticate(document.getElementById('txtPKIAuthenticate').value);">
							<input type="hidden" name="ValidationType" value="VGResponse"/>
						<input id="PKIAuthenticateResponse" type="hidden"
							name="ValidationRequest" value="" /> <input
							id="btnPKIAuthenticate" type="submit" value="PKI Authenticate"
							style="font-size: 10px; font-style: verdana;" disabled /></form>
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