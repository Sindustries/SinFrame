class Params {

	class brk0 {
        title = "//-TIME";
        values[] = {0};
        texts[] = {"--"};
        default = 0;
		isGlobal = 1;
    };

	class TimeOfDay1 {
        title = "Time of Day:";
        values[] = {8,12,14,20,0};
        texts[] = {"Morning","Midday","Afternoon","Evening","Midnight"};
        default = 8;
		isGlobal = 1;
    };
	
	class timemult2 {
        title = "Time Multiplier:";
        values[] = {0,1,2,10,60};
        texts[] = {"0x","1x","2x","10x","60"};
        default = 2;
		isGlobal = 1;
    };
	
	class brk3 {
        title = "//-GAME";
        values[] = {0};
        texts[] = {"--"};
        default = 0;
		isGlobal = 1;
    };
	
	class enemyselect4 {
        title = "Enemy Side: (Do not choose the same as your own side)";
        values[] = {1,2,3};
        texts[] = {"NATO","CSAT","AAF"};
        default = 2;
		isGlobal = 1;
    };

	class aiskill5 {
        title = "AI skill";
        values[] = {1,2,3,4,5};
        texts[] = {"Very Easy","Easy","Normal","Hard","Very Hard"};
        default = 3;
		isGlobal = 1;
    };	
		
	class brk6 {
        title = "//-BASE & ZONE";
        values[] = {0};
        texts[] = {"--"};
        default = 0;
		isGlobal = 1;
    };
	
	
	class BaseLocation7 {
        title = "Base Location:";
        values[] = {0,1};
        texts[] = {"Random","Manual"};
        default = 0;
		isGlobal = 1;
    };
	
	class MaxZones8 {
        title = "Number of Capture Zones:";
        values[] = {1,2,3,4,5,6,7,8,9,10,11,12};
        texts[] = {"1","2","3","4","5","6","7","8","9","10","11","12",};
        default = 5;
		isGlobal = 1;
    };
	
	class ZonePlacement9 {
        title = "Capture Zone Placement: (If Manual, distance settings will be ignored)";
        values[] = {0,1};
        texts[] = {"Random","Manual"};
        default = 0;
		isGlobal = 1;
    };
	
	class ZoneMinDist10 {
        title = "Capture Zone Min Distance: (From HQ and other Zones)";
        values[] = {1000,2000,3000,4000,5000,6000,8000,10000};
        texts[] = {"1km","2km","3km","4km","5km","6km","8km","10km"};
        default = 2000;
		isGlobal = 1;
    };
	
	class ZoneMaxDis12 {
        title = "Capture Zone Max Distance: (From HQ and other Zones)";
        values[] = {1000,2000,3000,4000,5000,6000,8000,10000,15000,20000};
        texts[] = {"1km","2km","3km","4km","5km","6km","8km","10km","15km","20km"};
        default = 6000;
		isGlobal = 1;
    };
	
	class ZoneMaxRadius12 {
        title = "Zone Max Diameter:";
        values[] = {50,150,250,375,500,1000,1500,2000,2500};
        texts[] = {"100m","300m","500m","750m","1000m","2000m","3000m","4000m","5000m"};
        default = 1000;
		isGlobal = 1;
    };
	
	class attackheli13 {
        title = "AI Helicopters:";
        values[] = {1,0};
        texts[] = {"Enabled","Disbled"};
        default = 1;
		isGlobal = 1;
    };
	
	class attackjet14 {
        title = "AI Jets:";
        values[] = {1,0};
        texts[] = {"Enabled","Disbled"};
        default = 1;
		isGlobal = 1;
    };
	
	class wavedelay15 {
        title = "Attack/Counter Attack Wave Interval: (How often new waves of AI are created)";
        values[] = {60,120,300,600,900,1200};
        texts[] = {"1 Minute","2 Minutes","5 Minutes","10 Minutes","15 Minutes","20 Minutes"};
        default = 300;
		isGlobal = 1;
    };
	
	
	class brk16 {
        title = "//-MONEY & FORCE POWER";
        values[] = {0};
        texts[] = {"--"};
        default = 0;
		isGlobal = 1;
    };
	
	class money17 {
        title = "Starting Funds:";
        values[] = {10000,25000,50000,75000,100000,200000,500000};
        texts[] = {"$10,000","$25,000","$50,000","$75,000","$100,000","$200,000","$500,000"};
        default = 50000;
		isGlobal = 1;
    };
	
	class income18 {
        title = "Regular Income: (This will be randomised, so this is a max)";
        values[] = {1000,2500,5000,7500,10000,20000,50000};
        texts[] = {"$1,000","$2,500","$5,000","$7,500","$10,000","$20,000","$50,000"};
        default = 10000;
		isGlobal = 1;
    };
	
	
	class forcepower19 {
        title = "Starting Force Power:";
        values[] = {0,25,50,100,150,200,250,300,400};
        texts[] = {"0","25","50","100","150","200","250","300","400"};
        default = 50;
		isGlobal = 1;
    };
	
	class enemyforcepower20 {
        title = "Starting Enemy Force Power:";
        values[] = {0,25,50,100,150,200,250,300,400};
        texts[] = {"0","25","50","100","150","200","250","300","400"};
        default = 50;
		isGlobal = 1;
    };
	
	class brk21 {
        title = "//-AI SETTINGS";
        values[] = {0};
        texts[] = {"--"};
        default = 0;
		isGlobal = 1;
    };
	
	class ailimiter22 {
        title = "Soldier Limit:";
        values[] = {50,75,100,125,150,175,200,250,500};
        texts[] = {"50","75","100","125","150","175","200","250","500"};
        default = 150;
		isGlobal = 1;
    };
			
	class infcache23 {
        title = "Infantry Cache Distance:";
        values[] = {1000,1500,2000,2500,3000,3500,4000,4500,5000};
        texts[] = {"1000m","1500m","2000m","2500m","3000m","3500m","4000m","4500m","5000m"};
        default = 1500;
		isGlobal = 1;
    };
	
	class vehiclimiter24 {
        title = "Vehicle (Ground) Limit:";
        values[] = {10,20,30,40,50};
        texts[] = {"10","20","30","40","50"};
        default = 20;
		isGlobal = 1;
    };
	
	class carcache25 {
        title = "Vehicle (Ground) Cache Distance:";
        values[] = {1000,1500,2000,2500,3000,3500,4000,4500,5000};
        texts[] = {"1000m","1500m","2000m","2500m","3000m","3500m","4000m","4500m","5000m"};
        default = 1500;
		isGlobal = 1;
    };
	
	class helilimiter26 {
        title = "Helicopter Limit: (Only applies if turned on)";
        values[] = {2,4,8,10,20,25};
        texts[] = {"2","4","8","10","20","25"};
        default = 8;
		isGlobal = 1;
    };
	
	class jetlimiter27 {
        title = "Jet Limit: (Only applies if turned on)";
        values[] = {2,4,8,10,20,25};
        texts[] = {"2","4","8","10","20","25"};
        default = 2;
		isGlobal = 1;
    };
	
	class aircache28 {
        title = "Vehicle (Air) Cache Distance:";
        values[] = {1000,1500,2000,2500,3000,3500,4000,4500,5000};
        texts[] = {"1000m","1500m","2000m","2500m","3000m","3500m","4000m","4500m","5000m"};
        default = 2000;
		isGlobal = 1;
    };
	
	class boatcache29 {
        title = "Boat Cache Distance:";
        values[] = {1000,1500,2000,2500,3000,3500,4000,4500,5000};
        texts[] = {"1000m","1500m","2000m","2500m","3000m","3500m","4000m","4500m","5000m"};
        default = 2000;
		isGlobal = 1;
    };	
		
	class debugcache30 {
        title = "Cache Debug Mode:";
        values[] = {1,0};
        texts[] = {"Enabled","Disabled"};
        default = 0;
		isGlobal = 1;
    };
	
};