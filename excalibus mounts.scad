boss_i_radius = 1.5;
boss_e_radius = 3;
h_space = 60;
v_space = 30;
boss_height = 20;

boss_rows = 2;
boss_columns = 3;

union(){
  for(v = [0:1:boss_rows-1]) {
    v_offset = v_space*v;
    for(h = [0:1:boss_columns-1]) {
        translate([h_space*h,v_offset,0]) {
          if(h!=boss_columns-1){
            translate([0,0,-boss_height/2]) {
              if(v%2 == 1) {
                l = sqrt(h_space*h_space+v_space*v_space);
                echo(cos(l));
                rotate(-26.5){
                  cube([l,2,5], center=false);
                }
              } else {
//                rotate(45){
//                 cube([sqrt(h_space*h_space+v_space*v_space),2,5], center=false);
//                }
               }
             }
           }
            difference() {
                cylinder($fn=12,h=boss_height, r1=boss_e_radius+3, r2=boss_e_radius, center=true);
                cylinder($fn=12, h=boss_height, r1=boss_i_radius, r2=boss_i_radius, center=true);
            }
        }
    }
  }
}