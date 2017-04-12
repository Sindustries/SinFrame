/*
	SINBOT Counter Attack Wave Selector
	Author: Sinbane
	Controls counter attack wave type
*/
if (SINdebug == 1) then {systemChat "---SINBOT: Getting Counter Attack Wave---"};
//-----------------------------------
//-ATTACK WAVE

	SINBOT_cAttack_group = [];
	SINBOT_cAttack_vehic = [];

	if (SINenemy_forcepower >= 0) then {
	
		if (SINenemy == "WEST") then {	
			SINBOT_cAttack_group = ["B_Soldier_SL_F","B_Soldier_F","B_Soldier_F","B_Soldier_GL_F","B_soldier_AR_F","B_soldier_LAT_F","B_medic_F","B_Soldier_A_F"];;
			SINBOT_cAttack_vehic = ["B_G_Offroad_01_armed_F"];
		};
		if (SINenemy == "EAST") then {		
			SINBOT_cAttack_group = ["O_Soldier_SL_F","O_Soldier_F","O_Soldier_F","O_Soldier_GL_F","O_soldier_AR_F","O_soldier_LAT_F","O_medic_F","O_Soldier_A_F"];
			SINBOT_cAttack_vehic = ["O_G_Offroad_01_armed_F"];	
		};
		if (SINenemy == "RESISTANCE") then {			
			SINBOT_cAttack_group = ["I_Soldier_SL_F","I_Soldier_F","I_Soldier_F","I_Soldier_GL_F","I_soldier_AR_F","I_soldier_LAT_F","I_medic_F","I_Soldier_A_F"];
			SINBOT_cAttack_vehic = ["I_G_Offroad_01_armed_F"];		
		};
				
	};
	
	if (SINenemy_forcepower >= 50) then {         
		
		_add1 = selectRandom SIN_enemyUnits;
		_add2 = selectRandom SIN_enemyUnits;
		SINBOT_cAttack_group pushBack _add1;
		SINBOT_cAttack_group pushBack _add2;		
		
		if (SINenemy_forcepower >= 50 && SINenemy_forcepower < 100) then {
		
			if (SINenemy == "WEST") then {	
				SINBOT_cAttack_vehic = ["B_MRAP_01_hmg_F"];
			};
			if (SINenemy == "EAST") then {
				SINBOT_cAttack_vehic = ["O_MRAP_02_hmg_F"];
			};
			
			if (SINenemy == "RESISTANCE") then {
				SINBOT_cAttack_vehic = ["I_MRAP_03_hmg_F"];
			};			
		};
	};

	if (SINenemy_forcepower >= 100) then {  
	
		_add1 = selectRandom SIN_enemyUnits;
		_add2 = selectRandom SIN_enemyUnits;
		SINBOT_cAttack_group pushBack _add1;
		SINBOT_cAttack_group pushBack _add2;	
		
		if (SINenemy_forcepower >= 100 && SINenemy_forcepower < 150) then {
		
			if (SINenemy == "WEST") then {	
				SINBOT_cAttack_vehic = ["B_MRAP_01_hmg_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "B_Heli_Transport_01_F";
				};
			};
			if (SINenemy == "EAST") then {	
				SINBOT_cAttack_vehic = ["B_MRAP_01_hmg_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "O_Heli_Light_02_F";
				};
			};
			if (SINenemy == "RESISTANCE") then {	
				SINBOT_cAttack_vehic = ["I_MRAP_03_hmg_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "I_Heli_light_03_F";
				};
			};			
		};
	};

	if (SINenemy_forcepower >= 150) then {
		
		_add1 = selectRandom SIN_enemyUnits;
		_add2 = selectRandom SIN_enemyUnits;
		SINBOT_cAttack_group pushBack _add1;
		SINBOT_cAttack_group pushBack _add2;	
		
		if (SINenemy_forcepower >= 150 && SINenemy_forcepower < 200) then {
		
			if (SINenemy == "WEST") then {	
				SINBOT_cAttack_vehic = ["B_MRAP_01_gmg_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "B_Heli_Transport_01_F";
				};
			};
			if (SINenemy == "EAST") then {	
				SINBOT_cAttack_vehic = ["O_MRAP_02_gmg_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "O_Heli_Light_02_F";
				};
			};
			if (SINenemy == "RESISTANCE") then {	
				SINBOT_cAttack_vehic = ["I_MRAP_03_gmg_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "I_Heli_light_03_F";
				};
			};	
		};
	};

	if (SINenemy_forcepower >= 200) then {          
		
		_add1 = selectRandom SIN_enemyUnits;
		_add2 = selectRandom SIN_enemyUnits;
		SINBOT_cAttack_group pushBack _add1;
		SINBOT_cAttack_group pushBack _add2;	
		
		if (SINenemy_forcepower >= 200 && SINenemy_forcepower < 250) then {
		
			if (SINenemy == "WEST") then {	
				SINBOT_cAttack_vehic = ["B_APC_Wheeled_01_cannon_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "B_Heli_Light_01_armed_F";
				};
			};
			if (SINenemy == "EAST") then {	
				SINBOT_cAttack_vehic = ["O_APC_Tracked_02_AA_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "O_Heli_Light_02_F";
				};
			};
			if (SINenemy == "RESISTANCE") then {	
				SINBOT_cAttack_vehic = ["I_APC_tracked_03_cannon_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "I_Heli_light_03_F";
				};
			};	
		};
	};

	if (SINenemy_forcepower >= 250) then {
		
		_add1 = selectRandom SIN_enemyUnits;
		_add2 = selectRandom SIN_enemyUnits;
		SINBOT_cAttack_group pushBack _add1;
		SINBOT_cAttack_group pushBack _add2;	
		
		if (SINenemy_forcepower >= 250 && SINenemy_forcepower < 300) then {
		
			if (SINenemy == "WEST") then {	
				SINBOT_cAttack_vehic = ["B_APC_Tracked_01_rcws_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "B_Heli_Light_01_armed_F";
				};
			};
			if (SINenemy == "EAST") then {	
				SINBOT_cAttack_vehic = ["O_APC_Tracked_02_cannon_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "O_Heli_Light_02_F";
				};
			};
			if (SINenemy == "RESISTANCE") then {	
				SINBOT_cAttack_vehic = ["I_APC_Wheeled_03_cannon_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "I_Heli_light_03_F";
				};
			};	
		};
	};
		
	if (SINenemy_forcepower >= 300) then {
	
		_add1 = selectRandom SIN_enemyUnits;
		_add2 = selectRandom SIN_enemyUnits;
		SINBOT_cAttack_group pushBack _add1;
		SINBOT_cAttack_group pushBack _add2;	
		
		if (SINenemy_forcepower >= 300) then {
		
			if (SINenemy == "WEST") then {	
				SINBOT_cAttack_vehic = ["B_MBT_01_cannon_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "B_Heli_Attack_01_F";
				};
			};
			if (SINenemy == "EAST") then {	
				SINBOT_cAttack_vehic = ["O_MBT_02_cannon_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "O_Heli_Attack_02_F";
				};
			};
			if (SINenemy == "RESISTANCE") then {	
				SINBOT_cAttack_vehic = ["I_MBT_03_cannon_F"];
				if (SINattackheli == 1) then {
					SINBOT_cAttack_heli = "I_Heli_light_03_F";
				};
			};	
		};
	};
	
	if (SINenemy_forcepower >= 400) then {
	
		if (SINenemy_forcepower >= 400) then {
		
			if (SINenemy == "WEST") then {	
				if (SINattackjet == 1) then {
					SINBOT_cAttack_jet = "B_Plane_CAS_01_F";
				};
			};
			if (SINenemy == "EAST") then {	
				if (SINattackjet == 1) then {
					SINBOT_cAttack_jet = "O_Plane_CAS_02_F";
				};
			};
			if (SINenemy == "RESISTANCE") then {	
				if (SINattackjet == 1) then {
					SINBOT_cAttack_jet = "I_Plane_Fighter_03_CAS_F";
				};
			};	
		};
	};
	
//-----------------------------------