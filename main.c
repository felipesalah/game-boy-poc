#include <stdio.h>
#include <gb/gb.h>
#include "GroundMap.c"
#include "SimpleBackground.c"

void main() {
    set_bkg_data(0, 7, backgroundtiles);
    set_bkg_tiles(0, 0, 40, 18, background);

    SHOW_BKG;
    DISPLAY_ON;

    while(1) {
        scroll_bkg(1, 0);
        delay(100);
    }
}