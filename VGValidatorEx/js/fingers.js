
// Copyright (EIDA) 2004-2016 Emirates Identity Authority (EIDA)
// email: PKITeam@emiratesid.ae
// All rights reserved.

// The source code is sole property of Emirates Identity Authority, Abu Dhabi, UAE. Even after modifications it is still property of Emirates Identify Authority.
// This source has to be kept in strict confidence and must not be disclosed to any third party in any case.


var FingerName = new Array();
FingerName[0x05] = "RIGHT THUMB";
FingerName[0x09] = "RIGHT INDEX";
FingerName[0x0D] = "RIGHT MIDDLE";
FingerName[0x11] = "RIGHT RING";
FingerName[0x15] = "RIGHT LITTLE";

FingerName[0x06] = "LEFT THUMB";
FingerName[0x0A] = "LEFT INDEX";
FingerName[0x0E] = "LEFT MIDDLE";
FingerName[0x12] = "LEFT RING";
FingerName[0x16] = "LEFT LITTLE";

function GetFingerIndexDisplayName(fingerIndex){
	return FingerName[fingerIndex];
}