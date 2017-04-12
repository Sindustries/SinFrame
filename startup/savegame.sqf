
	if (SINdebug == 0 && isServer) then {
		enableSaving [false, true];
	};
	
	if (!isServer) then {
		hint "Only the host can save";
	};