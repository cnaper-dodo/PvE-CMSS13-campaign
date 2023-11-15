#define STANDARD_MARINE_TO_TOTAL_SPAWN_RATIO 0.4

#define PVT_VARIANT "Private"
#define PFC_VARIANT "Private First Class"

/datum/job/marine/standard
	title = JOB_SQUAD_MARINE
	total_positions = -1
	spawn_positions = -1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/pfc

	job_options = list(PFC_VARIANT = "PFC", PVT_VARIANT = "PVT")

/datum/job/marine/standard/on_config_load()
	entry_message_body = "You are a rank-and-file <a href='[CONFIG_GET(string/wikiarticleurl)]/[URL_WIKI_MARINE_QUICKSTART]'>Marine of the USCM</a>, and that is your strength. What you lack alone, you gain standing shoulder to shoulder with the men and women of the corps. Ooh-rah!"
	return ..()

/datum/job/marine/standard/set_spawn_positions(count)
	spawn_positions = max((round(count * STANDARD_MARINE_TO_TOTAL_SPAWN_RATIO)), 8)

/datum/job/marine/standard/handle_job_options(option)
	if(option != PFC_VARIANT)
		gear_preset = /datum/equipment_preset/uscm/pfc/lesser_rank
	else
		gear_preset = /datum/equipment_preset/uscm/pfc

/datum/job/marine/standard/whiskey
	title = JOB_WO_SQUAD_MARINE
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/pfc

/obj/effect/landmark/start/marine
	name = JOB_SQUAD_MARINE
	icon_state = "marine_spawn"
	job = /datum/job/marine/standard

/obj/effect/landmark/start/marine/alpha
	icon_state = "marine_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/bravo
	icon_state = "marine_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/charlie
	icon_state = "marine_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/delta
	icon_state = "marine_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/standard/ai
	total_positions = 8
	spawn_positions = 8

/datum/job/marine/standard/ai/set_spawn_positions(count)
	return spawn_positions

#undef PVT_VARIANT
#undef PFC_VARIANT
