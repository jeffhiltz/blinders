$fn=50;

CORNER_RADIUS = 4;

// thickness of the shield
SHIELD_THICK = 1;

// length, thickness and height of the part that attaches to the glasses
ATT_LEN = 20;
ATT_THICK = 1;
ATT_HEIGHT = 12;

// width of the glasses arm
ARM_WIDTH = 2.0;
// shield
hull() {
    translate([-25, 5, 0]) cylinder(SHIELD_THICK, r = CORNER_RADIUS); // TL
    translate([30, 5, 0]) cylinder(SHIELD_THICK, r = CORNER_RADIUS); // TR
    translate([30, -20, 0]) cylinder(SHIELD_THICK, r = CORNER_RADIUS); // BR
    translate([-25, -20, 0]) cylinder(SHIELD_THICK, r = CORNER_RADIUS); // BL
}

// attachment - horizontal part
cube([ATT_LEN, ATT_THICK, ARM_WIDTH + ATT_THICK + SHIELD_THICK]);

// attachment - vertical part
translate([0, 0, SHIELD_THICK + ARM_WIDTH]) rotate([90, 0, 0]) cube([ATT_LEN, ATT_THICK, ATT_HEIGHT]);
