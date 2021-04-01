boss_i_radius = 1.75;
boss_e_radius = 3;
v_space_1 = 34;
h_space = 93;
v_space = 30;
boss_height = 12;

boss_rows = 2;
boss_columns = 2;

v_offset = 0;
difference() {
  union() {
    for(h = [0:1:boss_columns-1]) {
      if(h == 0) {
        translate([0,v_space_1/2,0]) {
          cylinder($fn=12,h=boss_height, r1=boss_e_radius+1, r2=boss_e_radius, center=true);
        }
        translate([0,-v_space_1/2,0]) {
          cylinder($fn=12,h=boss_height, r1=boss_e_radius+1, r2=boss_e_radius, center=true);
        }
        translate([0,v_space_1/2-boss_e_radius/2,-boss_height/2]){
          rotate(-90+atan(h_space/(v_space+2))){
            vl = v_space/2+v_space_1/2;
            length = sqrt(vl*vl + h_space*h_space);
            cube([length,2,5], center=false);
          }
        }
       translate([0,-v_space_1/2-boss_e_radius/2,-boss_height/2]){
            rotate(+90-atan(h_space/(v_space+2))){
              vl = v_space/2+v_space_1/2;
              length = sqrt(vl*vl + h_space*h_space);
              cube([length,2,5], center=false);
            }
        }
      } else {
        translate([h_space,v_space/2,0]) {
          cylinder($fn=12,h=boss_height, r1=boss_e_radius+1, r2=boss_e_radius, center=true);
        }
        translate([h_space,-v_space/2,0]) {
          cylinder($fn=12,h=boss_height, r1=boss_e_radius+1, r2=boss_e_radius, center=true);
        }
      }
    }
   }
   for(h = [0:1:boss_columns-1]) {
      if(h == 0) {
        translate([0,v_space_1/2,0]) {
          cylinder($fn=12,h=boss_height, r1=boss_i_radius, r2=boss_i_radius, center=true);
        }
        translate([0,-v_space_1/2,0]) {
          cylinder($fn=12,h=boss_height, r1=boss_i_radius, r2=boss_i_radius, center=true);
        }
      } else {
        translate([h_space,v_space/2,0]) {
          cylinder($fn=12,h=boss_height, r1=boss_i_radius, r2=boss_i_radius, center=true);
        }
        translate([h_space,-v_space/2,0]) {
          cylinder($fn=12,h=boss_height, r1=boss_i_radius, r2=boss_i_radius, center=true);
        }
      }
    }
   }