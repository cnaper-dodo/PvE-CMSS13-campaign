#define SECOND_LT_VARIANT "Second Lieutenant"

/datum/job/command/pilot
	title = JOB_PILOT
	total_positions = 2
	spawn_positions = 2
	allow_additional = TRUE
	scaled = TRUE
	supervisors = "the auxiliary support officer"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/po
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job is to fly, protect, and maintain the ship's dropship.</a> While you are an officer, your authority is limited to the dropship, where you have authority over the enlisted personnel. If you are not piloting, there is an autopilot fallback for command, but don't leave the dropship without reason."

	job_options = list(SECOND_LT_VARIANT = "2ndLt")

// Dropship Roles is both PO and DCC combined to not force people to backtrack
AddTimelock(/datum/job/command/pilot, list(
	JOB_DROPSHIP_ROLES = 2 HOURS
))

/obj/effect/landmark/start/pilot
	name = JOB_PILOT
	icon_state = "po_spawn"
	job = /datum/job/command/pilot

#undef SECOND_LT_VARIANT
