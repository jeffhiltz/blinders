$fn=50;

CORNER_RADIUS = 4;

// thickness of the shield
SHIELD_THICK = 2;

// length, thickness and height of the part that attaches to the glasses
ATT_LEN = 20;
ATT_THICK = 1;
ATT_HEIGHT = 10;

// width of the glasses arm
ARM_WIDTH = 2.4;

//  only render the arm clip in order to test sizing.
ONLY_PRINT_ATT = false;

module blinder() {
  // shield
  hull() {
      translate([-35, 5, 0]) cylinder(SHIELD_THICK, r = CORNER_RADIUS); // TL
      translate([30, 5, 0]) cylinder(SHIELD_THICK, r = CORNER_RADIUS); // TR
      translate([30, -20, 0]) cylinder(SHIELD_THICK, r = CORNER_RADIUS); // BR
      translate([-35, -30, 0]) cylinder(SHIELD_THICK, r = CORNER_RADIUS); // BL
  }

  // attachment - horizontal part
  cube([ATT_LEN, ATT_THICK, ARM_WIDTH + ATT_THICK + SHIELD_THICK]);

  // attachment - vertical part
  translate([0, 0, SHIELD_THICK + ARM_WIDTH]) rotate([90, 0, 0]) cube([ATT_LEN, ATT_THICK, ATT_HEIGHT]);
}

if (ONLY_PRINT_ATT) {
  intersection() {
    blinder();
    translate([-5, -(ATT_HEIGHT + 5), 0]) cube([ATT_LEN + 10, ATT_HEIGHT + 10, SHIELD_THICK + ARM_WIDTH + ATT_THICK]);
  }
} else {
  blinder();
}
