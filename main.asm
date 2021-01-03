;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.4 #11952 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _joypad
	.globl _delay
	.globl _Smiler
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_Smiler::
	.ds 32
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;SmileSprite.c:26: unsigned char Smiler[] =
	ld	hl, #_Smiler
	ld	(hl), #0x7e
	ld	hl, #(_Smiler + 0x0001)
	ld	(hl), #0x7e
	ld	hl, #(_Smiler + 0x0002)
	ld	(hl), #0x81
	ld	hl, #(_Smiler + 0x0003)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x0004)
	ld	(hl), #0xa5
	ld	hl, #(_Smiler + 0x0005)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x0006)
	ld	(hl), #0x81
	ld	hl, #(_Smiler + 0x0007)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x0008)
	ld	(hl), #0x81
	ld	hl, #(_Smiler + 0x0009)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x000a)
	ld	(hl), #0xbd
	ld	hl, #(_Smiler + 0x000b)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x000c)
	ld	(hl), #0x81
	ld	hl, #(_Smiler + 0x000d)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x000e)
	ld	(hl), #0x7e
	ld	hl, #(_Smiler + 0x000f)
	ld	(hl), #0x7e
	ld	hl, #(_Smiler + 0x0010)
	ld	(hl), #0x7e
	ld	hl, #(_Smiler + 0x0011)
	ld	(hl), #0x7e
	ld	hl, #(_Smiler + 0x0012)
	ld	(hl), #0x81
	ld	hl, #(_Smiler + 0x0013)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x0014)
	ld	(hl), #0xa5
	ld	hl, #(_Smiler + 0x0015)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x0016)
	ld	(hl), #0x81
	ld	hl, #(_Smiler + 0x0017)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x0018)
	ld	(hl), #0xa5
	ld	hl, #(_Smiler + 0x0019)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x001a)
	ld	(hl), #0x99
	ld	hl, #(_Smiler + 0x001b)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x001c)
	ld	(hl), #0x81
	ld	hl, #(_Smiler + 0x001d)
	ld	(hl), #0xff
	ld	hl, #(_Smiler + 0x001e)
	ld	(hl), #0x7e
	ld	hl, #(_Smiler + 0x001f)
	ld	(hl), #0x7e
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:5: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:7: set_sprite_data(0, 2, Smiler);
	ld	hl, #_Smiler
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:999: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;c:/gbdk/include/gb/gb.h:1072: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1073: itm->y=y, itm->x=x;
	ld	a, #0x4e
	ld	(hl+), a
	ld	(hl), #0x58
;main.c:10: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:12: while(1) {
00107$:
;main.c:13: switch(joypad()) {
	call	_joypad
	ld	a, e
	dec	a
	jr	Z, 00102$
	ld	a,e
	cp	a,#0x02
	jr	Z, 00101$
	cp	a,#0x04
	jr	Z, 00103$
	sub	a, #0x08
	jr	Z, 00104$
	jr	00105$
;main.c:14: case J_LEFT:
00101$:
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, #0xf6
	ld	(bc), a
;main.c:16: break;
	jr	00105$
;main.c:17: case J_RIGHT:
00102$:
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	add	a, #0x0a
	ld	(bc), a
;main.c:19: break;
	jr	00105$
;main.c:20: case J_UP:
00103$:
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xf6
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:22: break;
	jr	00105$
;main.c:23: case J_DOWN:
00104$:
;c:/gbdk/include/gb/gb.h:1088: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1089: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0x0a
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:26: }
00105$:
;main.c:27: delay(100);
	ld	hl, #0x0064
	push	hl
	call	_delay
	add	sp, #2
;main.c:29: }
	jr	00107$
	.area _CODE
	.area _CABS (ABS)
