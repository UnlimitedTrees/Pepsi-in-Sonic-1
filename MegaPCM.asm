
; ===============================================================
; Mega PCM Driver Include File
; (c) 2012, Vladikcomper
; ===============================================================

; ---------------------------------------------------------------
; Variables used in DAC table
; ---------------------------------------------------------------

; flags
panLR	= $C0
panL	= $80
panR	= $40
pcm	= 0
dpcm	= 4
loop	= 2
pri	= 1

; ---------------------------------------------------------------
; Macros
; ---------------------------------------------------------------

z80word macro Value
	dc.w	((\Value)&$FF)<<8|((\Value)&$FF00)>>8
	endm

DAC_Entry macro Pitch,Offset,Flags
	dc.b	\Flags			; 00h	- Flags
	dc.b	\Pitch			; 01h	- Pitch
	dc.b	(\Offset>>15)&$FF	; 02h	- Start Bank
	dc.b	(\Offset\_End>>15)&$FF	; 03h	- End Bank
	z80word	(\Offset)|$8000		; 04h	- Start Offset (in Start bank)
	z80word	(\Offset\_End-1)|$8000	; 06h	- End Offset (in End bank)
	endm
	
IncludeDAC macro Name,Extension
\Name:
	if strcmp('\extension','wav')
		incbin	'dac/\Name\.\Extension\',$3A
	else
		incbin	'dac/\Name\.\Extension\'
	endc
\Name\_End:
	endm

; ---------------------------------------------------------------
; Driver's code
; ---------------------------------------------------------------

MegaPCM:
	incbin	'MegaPCM.z80'

; ---------------------------------------------------------------
; DAC Samples Table
; ---------------------------------------------------------------

	DAC_Entry	$08, Kick, dpcm			; $81	- Kick
	DAC_Entry	$08, Snare, dpcm		; $82	- Snare
	DAC_Entry	$1B, Timpani, dpcm		; $83	- Timpani
	DAC_Entry   $0B, PEPSIMAN, pcm+pri            ; $84   - 'Pepsiman' voice (sega sound)
	DAC_Entry	$07, OhNo, pcm+pri            ; $85	- Hurt sound
	DAC_Entry	$07, wakemeup, pcm+pri+loop          ; $86 - Hidden song (Kids Bop - Bring Me To life)
	DAC_Entry	$07, knuckles, pcm+pri+loop			 ; $87	- Hidden song (Knuckles from K.N.U.C.K.L.E.S)
	DAC_Entry	$12, Timpani, dpcm		; $88	- Hi-Timpani
	DAC_Entry	$15, Timpani, dpcm		; $89	- Mid-Timpani
	DAC_Entry	$1B, Timpani, dpcm		; $8A	- Mid-Low-Timpani
	DAC_Entry	$1D, Timpani, dpcm		; $8B	- Low-Timpani
	DAC_Entry	$09, myleg, pcm+pri		; $8C	- "My leg"
	DAC_Entry	$07, PINGAS, pcm+pri	; $8D	- PINGAS
	DAC_Entry	$07, froggy, pcm+pri	; $8E	- "I have to save Froggy!"
	DAC_Entry	$07, getthis, pcm+pri	; $8F	- "Get a load of this!"
	DAC_Entry	$07, noway, pcm+pri		; $90	- "No way, I can't believe this!"
	DAC_Entry	$07, GiveYouUp, pcm+pri+loop	; $91	- Hidden song (Never gonna give you up - Sonic 4 remix)
	DAC_Entry	$07, WOAH, pcm+pri	; $92	- "WOAH"
	DAC_Entry	$09, SonicRetro, pcm+pri	; $93	- Hidden "song" (Sonic Retro)

MegaPCM_End:

; ---------------------------------------------------------------
; DAC Samples Files
; ---------------------------------------------------------------

	IncludeDAC	Kick, bin
	IncludeDAC	Snare, bin
	IncludeDAC	Timpani, bin
	IncludeDAC  PEPSIMAN,wav
	IncludeDAC  OhNo,wav
	IncludeDAC	wakemeup,wav
	IncludeDAC	knuckles,wav
	IncludeDAC	myleg,wav
	IncludeDAC	PINGAS,wav
	IncludeDAC	froggy,wav
	IncludeDAC	getthis,wav
	IncludeDAC	noway,wav
	IncludeDAC	GiveYouUp,wav
	IncludeDAC	WOAH,wav
	IncludeDAC	SonicRetro,wav
	even

