[this, false, [0, 0, 0], 0] call ace_dragging_fnc_setCarryable;
[this, false, [0, 0, 0], 0] call ace_dragging_fnc_setDraggable;
call{  
[ this,
["rhsusf_spc_teamleader","rhsusf_spc_squadleader","rhsusf_spc_sniper","rhsusf_spc_rifleman","rhsusf_spc_patchless_radio","rhsusf_spc_patchless","rhsusf_spc_marksman","rhsusf_spc_mg","rhsusf_spc_light","rhsusf_spc_iar","rhsusf_spc_crewman","rhsusf_spc_corpsman","rhsusf_spc","rhsusf_plateframe_sapi","rhsusf_plateframe_grenadier","rhsusf_plateframe_light","rhsusf_plateframe_machinegunner","rhsusf_plateframe_marksman","rhsusf_plateframe_medic","rhsusf_plateframe_rifleman","rhsusf_plateframe_teamleader","rhsusf_mbav_rifleman","rhsusf_mbav_medic","rhsusf_mbav_mg","rhsusf_mbav_light","rhsusf_mbav_grenadier","rhsusf_mbav","rhsusf_200Rnd_556x45_soft_pouch_ucp","rhsusf_200Rnd_556x45_mixed_soft_pouch","rhsusf_200rnd_556x45_mixed_box","rhs_weap_fnmag","rhs_weap_minimi_para_railed","rhs_weap_g36c","rhs_weap_g36kv","rhs_weap_g36kv_ag36","rhs_weap_hk416d10","rhs_weap_hk416d10_m320","rhs_weap_hk416d10_LMT","rhs_weap_hk416d10_LMT_d","rhs_weap_hk416d10_LMT_wd","rhs_weap_hk416d145","rhs_weap_hk416d145_d","rhs_weap_hk416d145_d_2","rhs_weap_hk416d145_m320","rhs_weap_hk416d145_wd","rhs_weap_hk416d145_wd_2","arifle_SPAR_03_snd_F","rhs_weap_l1a1","rhs_weap_l1a1_wood","rhs_weap_m1garand_sa43","rhs_weap_M107","rhs_weap_M107_d","rhs_weap_M107_w","rhs_weap_m14","srifle_DMR_06_camo_F","srifle_DMR_06_hunter_F","rhs_weap_m14_d","rhs_weap_m14_fiberglass","srifle_DMR_06_olive_F","rhs_weap_m14_rail","rhs_weap_m14_rail_d","rhs_weap_m14_rail_fiberglass","rhs_weap_m14_rail_wd","rhs_weap_m14_ris","rhs_weap_m14_ris_d","rhs_weap_m14_ris_fiberglass","rhs_weap_m14_ris_wd","rhs_weap_m14_wd","rhs_weap_m14ebrri","rhs_weap_m16a4","rhs_weap_m16a4_carryhandle","rhs_weap_m16a4_carryhandle_M203","rhs_weap_m16a4_imod","rhs_weap_m16a4_imod_M203","rhs_weap_XM2010","rhs_weap_XM2010_wd","rhs_weap_XM2010_d","rhs_weap_XM2010_sa","rhs_weap_m24sws","rhs_weap_m24sws_d","rhs_weap_m24sws_wd","rhs_weap_m240B","rhs_weap_m240G","rhs_weap_m249","rhs_weap_m249_pip","rhs_weap_m249_light_L","rhs_weap_m249_pip_L_para","rhs_weap_m249_pip_L","rhs_weap_m249_pip_ris","rhs_weap_m249_light_S","rhs_weap_m249_pip_S_para","rhs_weap_m249_pip_S","rhs_weap_m27iar","rhs_weap_m27iar_grip","rhs_weap_m32","rhs_weap_m3a1","rhs_weap_m3a1_specops","rhs_weap_m4","rhs_weap_m4_carryhandle","rhs_weap_m4_carryhandle_m203","rhs_weap_m4_carryhandle_m203S","rhs_weap_m4_carryhandle_mstock","rhs_weap_m4_m203","rhs_weap_m4_m203S","rhs_weap_m4_m320","rhs_weap_m4_mstock","rhs_weap_m40a5","rhs_weap_m40a5_d","rhs_weap_m40a5_wd","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle_m203","rhs_weap_m4a1_carryhandle_m203S","rhs_weap_m4a1_carryhandle_mstock","rhs_weap_m4a1_blockII","rhs_weap_m4a1_blockII_bk","rhs_weap_m4a1_blockII_M203_bk","rhs_weap_m4a1_blockII_KAC_bk","rhs_weap_m4a1_blockII_d","rhs_weap_m4a1_blockII_M203_d","rhs_weap_m4a1_blockII_KAC_d","rhs_weap_m4a1_blockII_M203","rhs_weap_m4a1_blockII_KAC","rhs_weap_m4a1_blockII_wd","rhs_weap_m4a1_blockII_M203_wd","rhs_weap_m4a1_blockII_KAC_wd","rhs_weap_m4a1","rhs_weap_m4a1_d","rhs_weap_m4a1_m203s_d","rhs_weap_m4a1_d_mstock","rhs_weap_m4a1_m203","rhs_weap_m4a1_m203s","rhs_weap_m4a1_m320","rhs_weap_m4a1_mstock","rhs_weap_m4a1_wd","rhs_weap_m4a1_m203s_wd","rhs_weap_m4a1_wd_mstock","rhs_weap_M590_8RD","rhs_weap_M590_5RD","rhs_weap_m82a1","rhs_weap_sr25","rhs_weap_sr25_d","rhs_weap_sr25_ec","rhs_weap_sr25_ec_d","rhs_weap_sr25_ec_wd","rhs_weap_sr25_wd","rhs_weap_mk17_CQC","rhs_weap_mk17_LB","rhs_weap_mk17_STD","rhs_weap_mk18","rhs_weap_mk18_bk","rhs_weap_mk18_KAC_bk","rhs_weap_mk18_d","rhs_weap_mk18_KAC_d","rhs_weap_mk18_m320","rhs_weap_mk18_KAC","rhs_weap_mk18_wd","rhs_weap_mk18_KAC_wd","rhs_weap_m38","rhs_weap_m38_rail","rhs_weap_mosin_sbr","rhsusf_weap_MP7A2","rhsusf_weap_MP7A2_aor1","rhsusf_weap_MP7A2_desert","rhsusf_weap_MP7A2_winter","SMG_05_F","SMG_03C_TR_black","rhs_weap_SCARH_FDE_CQC","rhs_weap_SCARH_CQC","rhs_weap_SCARH_FDE_LB","rhs_weap_SCARH_LB","rhs_weap_SCARH_FDE_STD","rhs_weap_SCARH_STD","SMG_02_F","rhs_weap_m14_socom","rhs_weap_m14_socom_rail","rhs_weap_t5000","rhs_weap_vhsd2","rhs_weap_vhsd2_ct15x","rhs_weap_vhsd2_bg","rhs_weap_vhsd2_bg_ct15x","rhs_weap_vhsk2","launch_NLAW_F","rhs_weap_smaw_green","rhs_weap_smaw","launch_MRAWS_sand_F","launch_MRAWS_sand_rail_F","rhs_weap_m72a7","rhs_weap_maaws","rhs_weap_M136_hp","rhs_weap_M136_hedp","rhs_weap_M136","rhs_weap_fim92","rhs_weap_fgm148","ace_csw_staticM2ShieldCarry","ace_compat_rhs_afrf3_spg9m_carry","ace_compat_rhs_afrf3_spg9_carry","ace_csw_spg9CarryTripod","ace_csw_sag30CarryTripod","ace_compat_rhs_afrf3_nsv_carry","ace_csw_carryMortarBaseplate","ace_csw_staticMortarCarry","ace_compat_rhs_usf3_mk19_carry","ace_dragon_super","ace_csw_m3CarryTripodLow","ace_csw_m3CarryTripod","ace_compat_rhs_usf3_m252_carry","ace_csw_m220CarryTripod","ace_compat_rhs_usf3_m2_carry","ace_compat_rhs_afrf3_kord_carry","ace_compat_rhs_gref3_dshkm_carry","ace_compat_rhs_usf3_tow_carry","ace_compat_rhs_afrf3_ags30_carry","ace_compat_rhs_afrf3_kornet_carry","ace_compat_rhs_afrf3_metis_carry","ace_csw_kordCarryTripodLow","ace_csw_kordCarryTripod","ace_compat_rhs_afrf3_2b14_carry","rhs_weap_6p53","rhs_weap_pb_6p9","hgun_Pistol_heavy_02_F","hgun_ACPC2_F","rhs_weap_cz99","rhs_weap_cz99_etched","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_green_F","rhsusf_weap_glock17g4","rhsusf_weap_m1911a1","rhs_weap_M320","rhsusf_weap_m9","ACE_Flashlight_Maglite_ML300L","hgun_Pistol_01_F","rhs_weap_pya","hgun_Rook40_F","rhsusf_weap_MP7A2_folded","rhsusf_weap_MP7A2_folded_aor1","rhsusf_weap_MP7A2_folded_desert","hgun_P07_blk_F","hgun_P07_F","rhs_weap_makarov_pm","rhs_weap_pp2000_folded","rhs_weap_rsp30_white","rhs_weap_rsp30_green","hgun_P07_khk_F","rhsusf_weap_MP7A2_folded_winter","ACE_VMM3","ACE_VMH3","rhs_weap_type94_new","rhs_weap_tt33","rhs_weap_tr8","hgun_Pistol_Signal_F","hgun_esd_01_F","rhs_weap_savz61_folded","rhs_weap_rsp30_red","rhs_acc_rakursPM","rhs_acc_dh520x56","rhs_acc_ekp8_18","rhs_acc_1p87","rhs_acc_okp7_picatinny","rhsusf_acc_LEUPOLDMK4","rhsusf_acc_LEUPOLDMK4_d","rhsusf_acc_LEUPOLDMK4_wd","rhsusf_acc_LEUPOLDMK4_2","rhsusf_acc_LEUPOLDMK4_2_mrds","rhsusf_acc_LEUPOLDMK4_2_d","rhsusf_acc_premier","rhsusf_acc_premier_mrds","rhsusf_acc_premier_low","rhsusf_acc_M8541","rhsusf_acc_M8541_d","rhsusf_acc_M8541_wd","rhsusf_acc_M8541_mrds","rhsusf_acc_M8541_low","rhsusf_acc_M8541_low_d","rhsusf_acc_M8541_low_wd","rhsusf_acc_nxs_3515x50_md","rhsusf_acc_nxs_3515x50f1_md","rhsusf_acc_nxs_3515x50f1_md_sun","rhsusf_acc_nxs_3515x50f1_h58","rhsusf_acc_nxs_3515x50f1_h58_sun","rhsusf_acc_nxs_5522x56_md","rhsusf_acc_nxs_5522x56_md_sun","rhsusf_acc_EOTECH","rhsusf_acc_eotech_552","rhsusf_acc_eotech_552_d","rhsusf_acc_eotech_552_wd","rhsusf_acc_eotech_xps3","rhsusf_acc_g33_xps3","rhsusf_acc_g33_xps3_tan","rhsusf_acc_g33_T1","rhsusf_acc_compm4","rhsusf_acc_T1_high","rhsusf_acc_T1_low","rhsusf_acc_RX01","rhsusf_acc_RX01_NoFilter","rhsusf_acc_RX01_tan","rhsusf_acc_RX01_NoFilter_tan","rhsusf_acc_RM05","rhsusf_acc_mrds","rhsusf_acc_mrds_c","rhsusf_acc_ACOG","rhsusf_acc_ACOG2","rhsusf_acc_ACOG3","rhsusf_acc_ACOG_wd","rhsusf_acc_ACOG_d","rhsusf_acc_ACOG_USMC","rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_ACOG_RMR","rhsusf_acc_ELCAN","rhsusf_acc_ELCAN_ard","rhsusf_acc_su230","rhsusf_acc_su230_mrds","rhsusf_acc_su230a","rhsusf_acc_su230a_mrds","rhsusf_acc_su230_c","rhsusf_acc_su230_mrds_c","rhsusf_acc_su230a_c","rhsusf_acc_su230a_mrds_c","rhsusf_acc_anpvs27","rhsusf_acc_anpas13gv1","rhsusf_acc_M2A1","rhsusf_acc_ACOG_MDO","optic_NVS","optic_SOS","optic_SOS_khk_F","optic_MRCO","optic_Arco","optic_Arco_ghex_F","optic_Arco_blk_F","optic_Arco_AK_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_lush_F","optic_Arco_arid_F","optic_Arco_lush_F","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Hamr","optic_Hamr_khk_F","optic_Holosight","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_arid_F","optic_Holosight_lush_F","optic_Holosight_smg","optic_Holosight_smg_blk_F","optic_Holosight_smg_khk_F","optic_DMS","optic_DMS_ghex_F","optic_DMS_weathered_F","optic_DMS_weathered_Kir_F","optic_LRPS","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_Yorris","ACE_optic_Hamr_2D","ACE_optic_Hamr_PIP","ACE_optic_Arco_2D","ACE_optic_Arco_PIP","ACE_optic_MRCO_2D","ACE_optic_SOS_2D","ACE_optic_SOS_PIP","ACE_optic_LRPS_2D","ACE_optic_LRPS_PIP","rhsgref_acc_RX01_camo","rhsgref_acc_RX01_NoFilter_camo","rhsusf_acc_premier_anpvs27","rhsusf_acc_ACOG_anpvs27","rhsusf_acc_T1_low_fwd","rhsusf_acc_RM05_fwd","rhsusf_acc_mrds_fwd","rhsusf_acc_mrds_fwd_c","rhsgref_acc_l1a1_l2a2","rhsgref_acc_l1a1_anpvs2","rhs_weap_optic_smaw","rhs_optic_maaws","optic_MRD","optic_MRD_black","rhs_acc_2dpZenit_ris","rhs_acc_perst1ik_ris","rhs_acc_perst3","rhsusf_acc_wmx","rhsusf_acc_wmx_bk","rhsusf_acc_M952V","rhsusf_acc_anpeq15A","rhsusf_acc_anpeq15side","rhsusf_acc_anpeq15side_bk","rhsusf_acc_anpeq16a","rhsusf_acc_anpeq16a_light","acc_flashlight","acc_pointer_IR","ACE_acc_pointer_green","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15_light","rhsusf_acc_anpeq15_top","rhsusf_acc_anpeq15_bk","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_anpeq15_wmx","rhsusf_acc_anpeq15_wmx_light","rhsusf_acc_anpeq16a_top","rhsusf_acc_anpeq16a_light_top","rhs_acc_at4_handler","acc_flashlight_pistol","acc_esd_01_flashlight","rhsusf_acc_ARDEC_M240","muzzle_snds_H_MG","muzzle_snds_H_MG_blk_F","muzzle_snds_H_MG_khk_F","ACE_muzzle_mzls_B","rhsusf_acc_rotex5_grey","rhsusf_acc_rotex5_tan","rhsusf_acc_SF3P556","rhsusf_acc_SFMB556","rhsusf_acc_nt4_black","rhsusf_acc_nt4_tan","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","ACE_muzzle_mzls_L","rhssaf_acc_G36_Rotex","rhsusf_acc_aac_scarh_silencer","rhsusf_acc_aac_762sd_silencer","rhsusf_acc_aac_762sdn6_silencer","muzzle_snds_B","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_B_arid_F","muzzle_snds_B_lush_F","rhsgref_sdn6_suppressor","rhsgref_acc_falMuzzle_l1a1","rhsusf_acc_m14_flashsuppresor","rhsusf_acc_aac_m14dcqd_silencer","rhsusf_acc_aac_m14dcqd_silencer_d","rhsusf_acc_aac_m14dcqd_silencer_wd","rhsusf_acc_M2010S","rhsusf_acc_M2010S_d","rhsusf_acc_M2010S_sa","rhsusf_acc_M2010S_wd","rhsusf_acc_m24_silencer_black","rhsusf_acc_m24_silencer_d","rhsusf_acc_m24_silencer_wd","rhsusf_acc_m24_muzzlehider_black","rhsusf_acc_m24_muzzlehider_d","rhsusf_acc_m24_muzzlehider_wd","rhsusf_acc_SR25S","rhsusf_acc_SR25S_wd","rhsusf_acc_SR25S_d","rhsusf_acc_rotex_mp7","rhsusf_acc_rotex_mp7_desert","rhsusf_acc_rotex_mp7_winter","rhsusf_acc_rotex_mp7_aor1","muzzle_snds_L","ACE_muzzle_mzls_smg_02","muzzle_snds_570","rhs_acc_tgpv","rhs_acc_tgpv2","rhs_acc_6p9_suppressor","muzzle_snds_acp","ACE_muzzle_mzls_smg_01","rhsusf_acc_omega9k","muzzle_antenna_01_f","muzzle_antenna_02_f","muzzle_antenna_03_f","rhsusf_acc_grip4","rhs_acc_grip_rk2","rhs_acc_grip_rk6","rhs_acc_grip_ffg2","rhsusf_acc_grip1","rhsusf_acc_grip3","rhsusf_acc_grip3_tan","rhsusf_acc_kac_grip","rhsusf_acc_rvg_blk","rhsusf_acc_rvg_de","rhsusf_acc_tacsac_blk","rhsusf_acc_tacsac_tan","rhsusf_acc_tacsac_blue","rhsusf_acc_tdstubby_blk","rhsusf_acc_tdstubby_tan","rhsusf_acc_grip4_bipod","rhsusf_acc_saw_lw_bipod","rhsusf_acc_kac_grip_saw_bipod","rhsusf_acc_saw_bipod","rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_grip2_wd","rhs_acc_harris_swivel","rhsusf_acc_harris_bipod","bipod_01_F_snd","bipod_01_F_blk","bipod_01_F_mtp","bipod_02_F_blk","bipod_02_F_tan","bipod_02_F_hex","bipod_03_F_blk","bipod_03_F_oli","bipod_01_F_khk","bipod_02_F_arid","bipod_02_F_lush","rhsusf_acc_m14_bipod","rhsusf_acc_harris_swivel","rhsusf_acc_grip_m203_blk","rhsusf_acc_grip_m203_d","rhsusf_acc_grip_m203_wd","rhsusf_100Rnd_762x51_m61_ap","rhsusf_100Rnd_762x51_m62_tracer","rhsusf_100Rnd_762x51_m80a1epr","rhsusf_50Rnd_762x51_m61_ap","rhsusf_50Rnd_762x51_m62_tracer","rhsusf_50Rnd_762x51_m80a1epr","rhsusf_50Rnd_762x51_m993","rhsusf_100Rnd_762x51_m993","rhs_mag_20Rnd_556x45_M855A1_Stanag","rhs_mag_20Rnd_556x45_Mk262_Stanag","rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Green","rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Yellow","rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Orange","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull","rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger","rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Orange","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull","rhs_mag_30Rnd_556x45_Mk262_Stanag","rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull","rhs_mag_30Rnd_556x45_Mk262_Stanag_Ranger","rhs_mag_30Rnd_556x45_M855A1_EPM","rhs_mag_30Rnd_556x45_M855A1_EPM_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_EPM_Pull","rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red","rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger","rhs_mag_30Rnd_556x45_M855A1_EPM_Ranger_Tracer_Red","rhs_mag_30Rnd_556x45_Mk318_SCAR","rhs_mag_30Rnd_556x45_Mk318_SCAR_Pull","rhs_mag_30Rnd_556x45_Mk318_SCAR_Ranger","rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red","rhs_mag_30Rnd_556x45_Mk318_PMAG","rhs_mag_30Rnd_556x45_Mk262_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan","rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red","rhs_mag_30Rnd_556x45_Mk318_PMAG_Tan","rhs_mag_30Rnd_556x45_Mk262_PMAG_Tan","rhsusf_100Rnd_556x45_soft_pouch_coyote","rhsusf_100Rnd_556x45_mixed_soft_pouch_coyote","rhsusf_100Rnd_556x45_M995_soft_pouch_coyote","rhssaf_30rnd_556x45_EPR_G36","rhssaf_30rnd_556x45_SOST_G36","rhssaf_30rnd_556x45_SPR_G36","rhssaf_30rnd_556x45_Tracers_G36","rhssaf_30rnd_556x45_MDIM_G36","rhsgref_30rnd_556x45_vhs2","rhsgref_30rnd_556x45_vhs2_t","rhs_mag_fold_stock","rhs_mag_M441_HE","rhs_mag_M433_HEDP","rhs_mag_M397_HET","rhs_mag_m576","rhs_mag_m4009","rhs_mag_M583A1_white","rhs_mag_m661_green","rhs_mag_m662_red","rhs_mag_M585_white_cluster","rhs_mag_M663_green_cluster","rhs_mag_M664_red_cluster","rhs_mag_m713_Red","rhs_mag_m714_White","rhs_mag_m715_Green","rhs_mag_m716_yellow","1Rnd_HE_Grenade_shell","rhs_mag_M585_white","ACE_HuntIR_M203","ACE_20Rnd_762x51_Mag_Tracer","ACE_10Rnd_762x51_M118LR_Mag","ACE_10Rnd_762x51_Mk316_Mod_0_Mag","ACE_10Rnd_762x51_Mk319_Mod_0_Mag","ACE_10Rnd_762x51_M993_AP_Mag","ACE_20Rnd_762x51_M118LR_Mag","ACE_20Rnd_762x51_Mk316_Mod_0_Mag","ACE_20Rnd_762x51_Mk319_Mod_0_Mag","ACE_20Rnd_762x51_M993_AP_Mag","rhsgref_1Rnd_00Buck","rhsgref_1Rnd_Slug","rhsgref_5Rnd_792x57_kar98k","rhs_mag_20Rnd_762x51_m61_fnfal","rhs_mag_20Rnd_762x51_m62_fnfal","rhs_mag_20Rnd_762x51_m80a1_fnfal","rhs_mag_30Rnd_762x51_m61_fnfal","rhs_mag_30Rnd_762x51_m62_fnfal","rhs_mag_30Rnd_762x51_m80_fnfal","rhs_mag_30Rnd_762x51_m80a1_fnfal","LOP_10rnd_77mm_mag","10Rnd_Mk14_762x51_Mag","rhsusf_20Rnd_762x51_m118_special_Mag","rhsusf_20Rnd_762x51_m993_Mag","rhsusf_20Rnd_762x51_m80_Mag","rhsusf_20Rnd_762x51_m62_Mag","rhsgref_8Rnd_762x63_M2B_M1rifle","rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle","rhs_mag_m1garand_ads","rhsusf_mag_10Rnd_STD_50BMG_M33","rhsusf_mag_10Rnd_STD_50BMG_mk211","ACE_5Rnd_127x99_Mag","ACE_5Rnd_127x99_API_Mag","ACE_5Rnd_127x99_AMAX_Mag","rhsusf_5Rnd_300winmag_xm2010","rhsusf_5Rnd_762x51_m118_special_Mag","rhsusf_5Rnd_762x51_m993_Mag","rhsusf_5Rnd_762x51_m62_Mag","rhsusf_mag_6Rnd_M441_HE","rhsusf_mag_6Rnd_M433_HEDP","rhsusf_mag_6Rnd_M397_HET","rhsusf_mag_6Rnd_M576_Buckshot","rhsusf_mag_6Rnd_m4009","rhsusf_mag_6Rnd_M583A1_white","rhsusf_mag_6Rnd_m661_green","rhsusf_mag_6Rnd_m662_red","rhsusf_mag_6Rnd_M713_red","rhsusf_mag_6Rnd_M714_white","rhsusf_mag_6Rnd_M715_green","rhsusf_mag_6Rnd_M716_yellow","rhsusf_mag_6Rnd_M781_Practice","rhsusf_mag_6Rnd_M585_white","rhsgref_30rnd_1143x23_M1911B_SMG","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_30rnd_1143x23_M1911B_2mag_SMG","rhsgref_30rnd_1143x23_M1T_2mag_SMG","rhsusf_5Rnd_762x51_AICS_m118_special_Mag","rhsusf_5Rnd_762x51_AICS_m993_Mag","rhsusf_5Rnd_762x51_AICS_m62_Mag","rhsusf_10Rnd_762x51_m118_special_Mag","rhsusf_10Rnd_762x51_m993_Mag","rhsusf_10Rnd_762x51_m62_Mag","rhsusf_8Rnd_00Buck","rhsusf_8Rnd_doomsday_Buck","rhsusf_8Rnd_Slug","rhsusf_8Rnd_HE","rhsusf_8Rnd_FRAG","ACE_2Rnd_12Gauge_Pellets_No0_Buck","ACE_2Rnd_12Gauge_Pellets_No1_Buck","ACE_2Rnd_12Gauge_Pellets_No2_Buck","ACE_2Rnd_12Gauge_Pellets_No3_Buck","ACE_2Rnd_12Gauge_Pellets_No4_Buck","ACE_2Rnd_12Gauge_Pellets_No4_Bird","rhsusf_5Rnd_00Buck","rhsusf_5Rnd_Slug","rhsusf_5Rnd_HE","rhsusf_5Rnd_FRAG","rhsusf_5Rnd_doomsday_Buck","rhs_mag_fakeMuzzle1","rhsusf_20Rnd_762x51_SR25_m118_special_Mag","rhsusf_20Rnd_762x51_SR25_mk316_special_Mag","rhsusf_20Rnd_762x51_SR25_m993_Mag","rhsusf_20Rnd_762x51_SR25_m62_Mag","rhs_mag_20Rnd_SCAR_762x51_m80_ball","rhs_mag_20Rnd_SCAR_762x51_m61_ap","rhs_mag_20Rnd_SCAR_762x51_m62_tracer","rhs_mag_20Rnd_SCAR_762x51_m80a1_epr","rhs_mag_20Rnd_SCAR_762x51_m118_special","rhs_mag_20Rnd_SCAR_762x51_mk316_special","rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk","rhs_mag_20Rnd_SCAR_762x51_m62_tracer_bk","rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk","rhs_mag_20Rnd_SCAR_762x51_m80a1_epr_bk","rhs_mag_20Rnd_SCAR_762x51_m118_special_bk","rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk","rhsgref_5Rnd_762x54_m38","rhsusf_mag_40Rnd_46x30_FMJ","rhsusf_mag_40Rnd_46x30_JHP","rhsusf_mag_40Rnd_46x30_AP","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02_Tracer_Red","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","30Rnd_9x21_Mag_SMG_02_Tracer_Green","50Rnd_570x28_SMG_03","30Rnd_9x21_Mag","30Rnd_9x21_Red_Mag","30Rnd_9x21_Yellow_Mag","30Rnd_9x21_Green_Mag","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N14","10Rnd_762x54_Mag","ACE_10Rnd_762x54_Tracer_mag","rhs_5Rnd_338lapua_t5000","CBA_FakeLauncherMagazine","rhs_mag_smaw_HEAA","rhs_mag_smaw_HEDP","rhs_mag_smaw_SR","MRAWS_HEAT_F","MRAWS_HE_F","MRAWS_HEAT55_F","rhs_mag_maaws_HEAT","rhs_mag_maaws_HEDP","rhs_mag_maaws_HE","rhs_m72a7_mag","rhs_m136_hp_mag","rhs_m136_hedp_mag","rhs_m136_mag","rhs_fim92_mag","rhs_fgm148_magazine_AT","rhs_fgm148_magazine_AT_empty","rhs_18rnd_9x21mm_7N28","rhs_18rnd_9x21mm_7N29","rhs_18rnd_9x21mm_7BT3","rhs_mag_9x18_8_57N181S","6Rnd_45ACP_Cylinder","9Rnd_45ACP_Mag","rhsusf_mag_7x45acp_MHP","rhssaf_mag_15Rnd_9x19_FMJ","rhssaf_mag_15Rnd_9x19_JHP","11Rnd_45ACP_Mag","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_15Rnd_9x19_JHP","rhsusf_mag_15Rnd_9x19_FMJ","FakeMagazine","10Rnd_9x21_Mag","rhs_mag_9x19_17","rhs_mag_9x19_7n31_17","16Rnd_9x21_Mag","16Rnd_9x21_red_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","rhs_mag_9x19mm_7n21_20","rhs_mag_9x19mm_7n31_20","rhs_mag_9x19mm_7n21_44","rhs_mag_9x19mm_7n31_44","rhs_mag_6x8mm_mhp","rhs_mag_762x25_8","6Rnd_GreenSignal_F","6Rnd_RedSignal_F","ESD_01_DummyMagazine_1","ESD_01_DummyMagazine_2","ESD_01_DummyMagazine_3","ESD_01_DummyMagazine_4","ESD_01_DummyMagazine_5","ESD_01_DummyMagazine_6","ESD_01_DummyMagazine_7","ESD_01_DummyMagazine_8","ESD_01_DummyMagazine_9","ESD_01_DummyMagazine_10","rhsgref_20rnd_765x17_vz61","rhsgref_10rnd_765x17_vz61","ace_compat_rhs_usf3_mag_TOW","ace_compat_rhs_usf3_mag_TOWB","ace_compat_rhs_usf3_mag_ITOW","ace_compat_rhs_usf3_mag_TOW2","ace_compat_rhs_usf3_mag_TOW2A","ace_compat_rhs_usf3_mag_TOW2b","ace_compat_rhs_usf3_mag_TOW2b_aero","ace_compat_rhs_usf3_mag_TOW2bb","rhs_fgm172a_magazine_AT","rhs_fgm172b_magazine_MPV","rhs_mag_M781_Practice","rhsusf_mich_helmet_marpatwd_norotos_headset","rhsusf_mich_helmet_marpatwd_norotos_arc_headset","rhsusf_mich_helmet_marpatwd_norotos_arc","rhsusf_mich_helmet_marpatwd_norotos","rhsusf_mich_helmet_marpatwd_headset","rhsusf_mich_helmet_marpatwd_alt_headset","rhsusf_mich_helmet_marpatwd_alt","rhsusf_mich_helmet_marpatwd","rhsusf_mich_helmet_marpatd_norotos_headset","rhsusf_mich_helmet_marpatd_norotos_arc_headset","rhsusf_mich_helmet_marpatd_norotos_arc","rhsusf_mich_helmet_marpatd_norotos","rhsusf_mich_helmet_marpatd_headset","rhsusf_mich_helmet_marpatd_alt_headset","rhsusf_mich_helmet_marpatd_alt","rhsusf_mich_helmet_marpatd","rhsusf_mich_bare_norotos_tan_headset","rhsusf_mich_bare_norotos_arc_alt_tan_headset","rhsusf_mich_bare_norotos_arc_alt_tan","rhsusf_mich_bare_norotos_arc_tan","rhsusf_mich_bare_norotos_alt_tan_headset","rhsusf_mich_bare_norotos_alt_tan","rhsusf_mich_bare_norotos_tan","rhsusf_mich_bare_tan_headset","rhsusf_mich_bare_alt_tan","rhsusf_mich_bare_tan","rhsusf_mich_bare_norotos_semi_headset","rhsusf_mich_bare_norotos_arc_semi_headset","rhsusf_mich_bare_norotos_arc_alt_semi_headset","rhsusf_mich_bare_norotos_arc_alt_semi","rhsusf_mich_bare_norotos_arc_semi","rhsusf_mich_bare_norotos_alt_semi_headset","rhsusf_mich_bare_norotos_alt_semi","rhsusf_mich_bare_norotos_semi","rhsusf_mich_bare_semi_headset","rhsusf_mich_bare_alt_semi","rhsusf_mich_bare_semi","rhsusf_mich_bare_norotos_headset","rhsusf_mich_bare_norotos_arc_headset","rhsusf_mich_bare_norotos_arc_alt_headset","rhsusf_mich_bare_norotos_arc_alt","rhsusf_mich_bare_norotos_arc","rhsusf_mich_bare_norotos_alt_headset","rhsusf_mich_bare_norotos_alt","rhsusf_mich_bare_norotos","rhsusf_mich_bare_headset","rhsusf_mich_bare_alt","rhsusf_mich_bare","rhsusf_opscore_mar_ut_pelt","rhsusf_opscore_mar_ut","rhsusf_opscore_mar_fg_pelt","rhsusf_opscore_mar_fg","rhsusf_opscore_ut_pelt_nsw_cam","rhsusf_opscore_ut_pelt_nsw","rhsusf_opscore_ut_pelt_cam","rhsusf_opscore_ut_pelt","rhsusf_opscore_ut","rhsusf_opscore_rg_cover_pelt","rhsusf_opscore_rg_cover","rhsusf_opscore_paint_pelt_nsw_cam","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_paint_pelt","rhsusf_opscore_paint","rhsusf_opscore_mc_pelt_nsw","rhsusf_opscore_mc_pelt","rhsusf_opscore_mc","rhsusf_opscore_mc_cover_pelt_cam","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover","rhsusf_opscore_fg_pelt_nsw","rhsusf_opscore_fg_pelt_cam","rhsusf_opscore_fg_pelt","rhsusf_opscore_fg","rhsusf_opscore_coy_cover_pelt","rhsusf_opscore_coy_cover","rhsusf_opscore_bk_pelt","rhsusf_opscore_bk","rhsusf_opscore_aor2_pelt_nsw","rhsusf_opscore_aor2_pelt","rhsusf_opscore_aor2","rhsusf_opscore_aor1_pelt_nsw","rhsusf_opscore_aor1_pelt","rhsusf_opscore_aor1","rhs_booniehat2_marpatd","rhs_booniehat2_marpatwd","rhsusf_patrolcap_ocp","rhs_uniform_FROG01_d","B_UGV_02_Science_backpack_F","B_UGV_02_Demining_backpack_F","B_UAV_01_backpack_F","B_TacticalPack_mcamo","tf_rt1523g_rhs","tf_rt1523g_big_rhs","tf_rt1523g_big_bwmod_tropen","tf_rt1523g_big_bwmod","tf_rt1523g_big","tf_rt1523g","B_W_Static_Designator_01_weapon_F","B_Kitbag_mcamo","B_Kitbag_cbr","B_Mortar_01_weapon_F","B_Mortar_01_support_F","B_HMG_01_support_F","I_E_HMG_02_support_F","B_FieldPack_khk","B_FieldPack_cbr","rhsusf_falconii_coy","rhsusf_assault_eagleaiii_coy","B_rhsusf_B_BACKPACK","B_Carryall_khk","B_AssaultPack_cbr","rhsusf_ANPVS_14","rhsusf_ANPVS_15","ACE_NVG_Wide","ACE_Vector","ACE_Yardage450","rhsusf_bino_lrf_Vector21","rhssaf_zrak_rd7j","ACE_VectorDay","rhs_tr8_periscope_pip","rhs_tr8_periscope","ace_dragon_sight","Rangefinder","rhs_pdu4","rhsusf_bino_m24_ARD","rhsusf_bino_m24","rhsusf_bino_leopold_mk4","rhsusf_bino_lerca_1200_tan","rhsusf_bino_lerca_1200_black","Binocular","ItemMap","ItemCompass","tf_anprc152","ChemicalDetector_01_watch_F","ACE_Altimeter","B_UavTerminal","rhs_mag_an_m14_th3","rhs_mag_an_m8hc","rhssaf_mag_brd_m83_blue","rhs_mag_m18_green","rhs_mag_m18_red","rhs_mag_m18_yellow","rhs_mag_m67","rhs_mag_mk84","ACE_M84","APERSMine_Range_Mag","ACE_FlareTripMine_Mag","TrainingMine_Mag","rhs_ec75_sand_mag","rhs_ec400_mag","rhs_ec400_sand_mag","rhs_ec200_mag","rhs_ec200_sand_mag","rhs_ec75_mag","rhssaf_mine_tma4_mag","rhs_mine_tm62m_mag","rhssaf_tm500_mag","rhssaf_tm100_mag","rhs_charge_M2tet_x2_mag","rhs_mine_TM43_mag","rhs_mine_stockmine43_4m_mag","rhs_mine_stockmine43_2m_mag","IEDUrbanSmall_Remote_Mag","IEDLandSmall_Remote_Mag","rhs_mine_sm320_white_mag","rhs_mine_sm320_red_mag","rhs_mine_sm320_green_mag","rhs_mine_smine44_trip_mag","rhs_mine_smine44_press_mag","rhs_mine_smine35_trip_mag","rhs_mine_smine35_press_mag","rhs_mag_mine_ptm1","APERSTripMine_Wire_Mag","rhs_mine_pmn2_mag","rhssaf_mine_pma3_mag","rhs_mag_mine_pfm1","rhs_mine_ozm72_c_mag","rhs_mine_ozm72_b_mag","rhs_mine_ozm72_a_mag","rhs_mine_msk40p_white_mag","rhs_mine_msk40p_red_mag","rhs_mine_msk40p_green_mag","rhs_mine_msk40p_blue_mag","rhssaf_mine_mrud_d_mag","rhssaf_mine_mrud_b_mag","rhssaf_mine_mrud_a_mag","rhssaf_mine_mrud_c_mag","rhs_mine_mk2_pressure_mag","rhs_mine_Mk2_tripwire_mag","rhs_mine_M7A2_mag","SLAMDirectionalMine_Wire_Mag","rhsusf_mine_m49a1_6m_mag","rhsusf_mine_m49a1_3m_mag","rhsusf_mine_m49a1_10m_mag","rhs_mine_m3_pressure_mag","rhs_mine_M3_tripwire_mag","rhs_mine_m2a3b_press_mag","rhs_mine_m2a3b_trip_mag","APERSBoundingMine_Range_Mag","rhs_mine_M19_mag","ClaymoreDirectionalMine_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","rhsusf_mine_m14_mag","DemoCharge_Remote_Mag","rhsusf_m112x4_mag","rhsusf_m112_mag","IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","rhs_mine_glasmine43_hz_mag","rhs_mine_glasmine43_bz_mag","rhs_mine_a200_dz35_mag","rhs_mine_a200_bz_mag","APERSMineDispenser_Mag","ACE_adenosine","ACE_artilleryTable","ACE_ATragMX","ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot","ACE_bodyBag","ACE_CableTie","ACE_DefusalKit","ACE_EarPlugs","ACE_EntrenchingTool","ACE_epinephrine","ACE_Flashlight_MX991","ACE_HuntIR_monitor","ACE_IR_Strobe_Item","ACE_Kestrel4500","ACE_Flashlight_KSF1","ACE_M26_Clacker","ACE_Clacker","ACE_Flashlight_XL50","ACE_MapTools","ACE_microDAGR","ACE_morphine","ACE_RangeCard","ACE_rope36","ACE_salineIV_250","ACE_salineIV_500","ACE_Sandbag_empty","ACE_salineIV","ACE_splint","ACE_SpottingScope","ACE_SpraypaintBlack","ACE_SpraypaintBlue","ACE_SpraypaintGreen","ACE_SpraypaintRed","ACE_Tripod","ACE_surgicalKit","ToolKit","ACE_tourniquet","ACE_wirecutter","ACE_UAVBattery","rhs_facewear_6m2","rhs_facewear_6m2_1","G_AirPurifyingRespirator_02_black_F","G_AirPurifyingRespirator_02_olive_F","G_AirPurifyingRespirator_02_sand_F","G_AirPurifyingRespirator_01_F","G_Aviator","rhs_balaclava","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","rhs_balaclava1_olive","G_Balaclava_oli","rhs_googles_black","rhs_googles_clear","rhs_googles_orange","rhs_googles_yellow","rhs_ess_black","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan","G_Combat","G_Combat_Goggles_tna_F","G_Diving","G_I_Diving","G_O_Diving","G_B_Diving","G_Lady_Blue","G_Lowprofile","None","G_RegulatorMask_F","rhs_scarf","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","rhsusf_shemagh_grn","rhsusf_shemagh2_grn","rhsusf_shemagh_od","rhsusf_shemagh2_od","rhsusf_shemagh_tan","rhsusf_shemagh2_tan","rhsusf_shemagh_white","rhsusf_shemagh2_white","rhsusf_shemagh_gogg_grn","rhsusf_shemagh2_gogg_grn","rhsusf_shemagh_gogg_od","rhsusf_shemagh2_gogg_od","rhsusf_shemagh_gogg_tan","rhsusf_shemagh2_gogg_tan","rhsusf_shemagh_gogg_white","rhsusf_shemagh2_gogg_white","rhsusf_oakley_goggles_blk","rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_ylw","G_Spectacles","G_Sport_Red","G_Sport_Blackyellow","G_Sport_BlackWhite","G_Sport_Checkered","G_Sport_Blackred","G_Sport_Greenblack","G_Squares_Tinted","G_Squares","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_G_tna_F","G_Tactical_Clear","G_Tactical_Black","G_Spectacles_Tinted","rhssaf_veil_Green","G_Goggles_VR","G_WirelessEarpiece_F","optic_LRPS_tna_F","optic_LRPS_ghex_F","rhsusf_ach_bare","rhsusf_ach_bare_des","rhsusf_ach_bare_des_ess","rhsusf_ach_bare_des_headset","rhsusf_ach_bare_des_headset_ess","rhsusf_ach_bare_semi","rhsusf_ach_bare_semi_ess","rhsusf_ach_bare_semi_headset","rhsusf_ach_bare_semi_headset_ess","rhsusf_ach_bare_tan","rhsusf_ach_bare_tan_ess","rhsusf_ach_bare_tan_headset","rhsusf_ach_bare_tan_headset_ess","rhsusf_ach_helmet_DCU_early","rhsusf_ach_helmet_DCU_early_rhino","rhsusf_ach_helmet_M81","rhsusf_ach_helmet_DCU","rhsusf_ach_bare_headset","rhsusf_ach_bare_ess","rhsusf_ach_bare_headset_ess","rhsusf_ach_helmet_ocp","rhsusf_ach_helmet_ocp_alt","rhsusf_ach_helmet_ESS_ocp","rhsusf_ach_helmet_ESS_ocp_alt","rhsusf_ach_helmet_headset_ocp","rhsusf_ach_helmet_headset_ocp_alt","rhsusf_ach_helmet_headset_ess_ocp","rhsusf_ach_helmet_headset_ess_ocp_alt","rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_ocp_norotos","rhsusf_ach_helmet_ucp","rhsusf_ach_helmet_ucp_alt","rhsusf_ach_helmet_ESS_ucp","rhsusf_ach_helmet_ESS_ucp_alt","rhsusf_ach_helmet_headset_ucp","rhsusf_ach_helmet_headset_ucp_alt","rhsusf_ach_helmet_headset_ess_ucp","rhsusf_ach_helmet_headset_ess_ucp_alt","rhsusf_ach_helmet_ucp_norotos","rhsusf_cvc_green_helmet","rhsusf_cvc_green_alt_helmet","rhsusf_cvc_green_ess","rhsusf_cvc_helmet","rhsusf_cvc_alt_helmet","rhsusf_cvc_ess","H_Bandanna_mcamo","H_Bandanna_khk","H_Booniehat_khk_hs","H_Booniehat_mgrn","H_Booniehat_khk","H_Booniehat_mcamo","H_Booniehat_oli","H_Booniehat_tan","H_Booniehat_taiga","H_Booniehat_tna_F","H_Booniehat_wdl","rhs_Booniehat_m81","rhsusf_Bowman","rhsusf_bowman_cap","rhsusf_hgu56p_visor_mask_green_mo","rhsusf_hgu56p","rhsusf_hgu56p_visor","rhsusf_hgu56p_visor_green","rhsusf_hgu56p_visor_black","rhsusf_hgu56p_visor_tan","RHS_jetpilot_usaf","rhsusf_ihadss","tf_microdagr","ItemWatch","ItemGPS","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiWhite","ACE_Chemlight_HiYellow","ACE_Chemlight_IR","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","Chemlight_yellow","ACE_CTS9","rhs_grenade_m15_mag","rhs_grenade_anm8_mag","rhssaf_tm200_mag","ACE_DAGR","ACE_DeadManSwitch","ACE_Chemlight_Shield","rhsusf_100Rnd_762x51","rhsusf_100Rnd_762x51_m82_blank","rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","Titan_AA","Laserbatteries","rhsusf_200Rnd_556x45_box","rhs_mag_30Rnd_556x45_M855A1_PMAG","20Rnd_762x51_Mag","ACE_20Rnd_762x51_Mag_SD","Laserdesignator","B_AssaultPack_blk","B_AssaultPack_rgr","B_AssaultPack_khk","B_AssaultPack_mcamo","B_AssaultPack_sgg","B_AssaultPack_tna_F","B_AssaultPack_wdl_F","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_wdl_F","B_CombinationUnitRespirator_01_F","I_E_HMG_02_weapon_F","rhsusf_falconii_mc","B_Kitbag_tan","B_LegStrapBag_coyote_F","RHS_M2_Gun_Bag","RHS_M2_Tripod_Bag","rhs_M252_Gun_Bag","rhs_M252_Bipod_Bag","RHS_M2_MiniTripod_Bag","rhs_medic_bag","RHS_Mk19_Gun_Bag","RHS_Mk19_Tripod_Bag","B_SCBA_01_F","RHS_SPG9_Gun_Bag","RHS_SPG9_Tripod_Bag","B_TacticalPack_oli","B_TacticalPack_blk","rhs_Tow_Gun_Bag","rhs_TOW_Tripod_Bag","ace_gunbag_Tan","rhs_tortila_khaki","ACE_TacticalLadder_Pack","B_ViperHarness_khk_F","B_ViperLightHarness_khk_F","U_B_CBRN_Suit_01_MTP_F","RHS_AGS30_Gun_Bag","RHS_AGS30_Tripod_Bag","RHS_Kornet_Tripod_Bag","RHS_Kornet_Gun_Bag","RHS_Metis_Tripod_Bag","RHS_Metis_Gun_Bag","RHS_Podnos_Gun_Bag","RHS_Podnos_Bipod_Bag","rhsgref_wdl_alicepack","B_Carryall_cbr","B_Carryall_oucamo","LOP_B_CA_EOD_tub","B_Carryall_taiga_F","B_Carryall_green_F","RHS_DShkM_Gun_Bag","RHS_DShkM_TripodHigh_Bag","RHS_DShkM_TripodLow_Bag","B_FieldPack_blk","B_FieldPack_green_F","B_FieldPack_oli","B_FieldPack_taiga_F","LOP_B_FP_MG42_tub","LOP_B_KB_Med_tub","I_E_HMG_02_support_high_F","B_Kitbag_rgr","rhssaf_kitbag_smb","rhssaf_kitbag_md2camo","B_Kitbag_sgg","RHS_Kord_Tripod_Bag","RHS_Kord_Gun_Bag","RHS_NSV_Tripod_Bag","RHS_NSV_Gun_Bag","rhs_r148","B_TacticalPack_rgr","B_IR_Grenade","rhs_mag_m7a3_cs","rhsusf_ach_bare_wood_headset_ess","rhsusf_ach_bare_wood_headset","rhsusf_ach_bare_wood_ess","rhsusf_ach_bare_wood","rhsusf_lwh_helmet_marpatwd_ess","rhsusf_lwh_helmet_marpatwd_headset","rhsusf_lwh_helmet_marpatwd_headset_blk","rhsusf_lwh_helmet_marpatwd_headset_blk2","rhsusf_lwh_helmet_marpatwd_blk_ess","rhsusf_lwh_helmet_marpatwd","rhsusf_lwh_helmet_marpatd_headset","rhsusf_lwh_helmet_marpatd_ess","rhsusf_lwh_helmet_marpatd","rhsusf_lwh_helmet_M1942","rhs_weap_m21a","rhs_weap_m21a_pbg40","rhs_weap_m21a_pr","rhs_weap_m21a_pr_pbg40","rhs_weap_m21s","rhs_weap_m21s_pr","rhs_weap_svdp_wd_npz","SMG_01_F","ACE_WaterBottle","ACE_SpareBarrel_Item","greenmag_item_speedloader","ACE_MRE_MeatballsPasta","greenmag_ammo_127x99_basic_30Rnd","greenmag_beltlinked_127x99_basic_100","greenmag_ammo_9x19_basic_30Rnd","greenmag_beltlinked_556x45_basic_100","greenmag_ammo_556x45_basic_30Rnd","greenmag_ammo_762x51_basic_30Rnd","greenmag_beltlinked_762x51_basic_100","ACE_RangeTable_82mm"]
] call ace_arsenal_fnc_addVirtualItems ; 
}