_index = lbCurSel 2100;

_spawnpos = [(getPos player),5,25,1,0,1,0] call BIS_fnc_findSafePos;

switch (_index) do
{
    case 0:  
    {
         if (SINmoney >= 5000) then 
             {
			   SINmoney = SINmoney - 2;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_Soldier_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };

    case 1:  
    {
         if (SINmoney >= 8000) then 
             {
               SINmoney = SINmoney - 8000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_Soldier_GL_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };

    case 2:  
    {
         if (SINmoney >= 10000) then 
             {
               SINmoney = SINmoney - 10000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_medic_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };

    case 3:  
    {
         if (SINmoney >= 9000) then 
             {
               SINmoney = SINmoney - 9000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_soldier_AR_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };

    case 4:  
    {
         if (SINmoney >= 12000) then 
             {
               SINmoney = SINmoney - 12000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_sniper_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 5:  
    {
         if (SINmoney >= 6000) then 
             {
               SINmoney = SINmoney - 6000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_spotter_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 6:  
    {
         if (SINmoney >= 7500) then 
             {
               SINmoney = SINmoney - 7500;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_soldier_M_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 7:  
    {
         if (SINmoney >= 6500) then 
             {
               SINmoney = SINmoney - 6500;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_soldier_repair_F" createUnit [_spawnpos,group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 8:  
    {
         if (SINmoney >= 7500) then 
             {
               SINmoney = SINmoney - 7500;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_soldier_exp_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 9:  
    {
         if (SINmoney >= 10000) then 
             {
               SINmoney = SINmoney - 10000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_Soldier_A_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 10:  
    {
         if (SINmoney >= 9000) then 
             {
               SINmoney = SINmoney - 9000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_soldier_AT_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 11:  
    {
         if (SINmoney >= 8500) then 
             {
               SINmoney = SINmoney - 8500;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_soldier_AA_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 12:  
    {
         if (SINmoney >= 6000) then 
             {
               SINmoney = SINmoney - 6000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_diver_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 13:  
    {
         if (SINmoney >= 8000) then 
             {
               SINmoney = SINmoney - 8000;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_diver_exp_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	case 14:  
    {
         if (SINmoney >= 2500) then 
             {
               SINmoney = SINmoney - 2500;
               ctrlSetText [1001, format["$%1",SINmoney]];
               _group = group player;
               _unit = "O_Helipilot_F" createUnit [_spawnpos, group player];
			   
             } 
          else 
             {
               HQofficer sideChat "You cannot afford this";
             };
    };
	
	
};

        
publicVariable "SINmoney";