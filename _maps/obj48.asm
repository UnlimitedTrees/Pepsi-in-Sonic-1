; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_VWrIS:	
		dc.w SME_VWrIS_8-SME_VWrIS, SME_VWrIS_27-SME_VWrIS	
		dc.w SME_VWrIS_41-SME_VWrIS, SME_VWrIS_56-SME_VWrIS	
SME_VWrIS_8:	dc.b 6	
		dc.b $F0, 4, 0, $1B, $F0	
		dc.b $F8, 4, $10, $1B, $F0	
		dc.b $E8, $A, 0, 0, $E8	
		dc.b $E8, $A, 8, 0, 0	
		dc.b 0, $A, $10, 0, $E8	
		dc.b 0, $A, $18, 0, 0	
SME_VWrIS_27:	dc.b 5	
		dc.b $E8, $F, 0, $1D, $E8	
		dc.b $E8, 3, 0, $2D, 8	
		dc.b $E8, 3, 0, $31, $10	
		dc.b 8, $D, 0, $35, $E8	
		dc.b 8, 5, 0, $3D, 8	
SME_VWrIS_41:	dc.b 4	
		dc.b $E8, $A, 0, 9, $E8	
		dc.b $E8, $A, 0, $12, 0	
		dc.b 0, $A, $18, $12, $E8	
		dc.b 0, $A, $18, 9, 0	
SME_VWrIS_56:	dc.b 4	
		dc.b $E8, $A, 8, $12, $E8	
		dc.b $E8, $A, 8, 9, 0	
		dc.b 0, $A, $10, 9, $E8	
		dc.b 0, $A, $10, $12, 0	
		even