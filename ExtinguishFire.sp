#pragma semicolon 1

#include <sourcemod>
#include <sdktools>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Extinguish Fire with Water",
	author = "Bara",
	description = "",
	version = "1.0.0",
	url = "github.com/Bara20"
};

public Action OnPlayerRunCmd(int client, int &buttons, int &impulse, float vel[3], float angles[3], int &weapon)
{
	if(client > 0 && IsClientInGame(client) && IsPlayerAlive(client))
	{
		if(GetEntityFlags(client) & FL_INWATER)
		{
			int iFire = GetEntPropEnt(client, Prop_Data, "m_hEffectEntity");
	
			if (IsValidEdict(iFire))
			{
				SetEntPropFloat(iFire, Prop_Data, "m_flLifetime", 0.0);
			}
		}
	}
	
	return Plugin_Continue;
}
