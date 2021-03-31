boss_i_radius = 1.5;
boss_e_radius = 3;
h_space = 60;
v_space = 30;
boss_height = 20;

boss_rows = 2;
boss_columns = 2;

difference() {
  union(){
    for(v = [0:1:boss_rows-1]) {
      v_offset = v_space*v;
      for(h = [0:1:boss_columns-1]) {
          translate([h_space*h,v_offset,0]) {
            if(h!=boss_columns-1){
              translate([0,0,-boss_height/2]) {
                if(v%2 == 1) {
                  rotate(-90+atan(h_space/v_space)){
                    cube([sqrt(h_space*h_space+v_space*v_space),2,5], center=false);
                  }
                } else {
                  rotate(90-atan(h_space/v_space)){
                    cube([sqrt(h_space*h_space+v_space*v_space),2,5], center=false);
                  }
                 }
               }
             }
            cylinder($fn=12,h=boss_height, r1=boss_e_radius+3, r2=boss_e_radius, center=true);
          }
      }
    }
  }
  for(v = [0:1:boss_rows-1]) {
  v_offset = v_space*v;
  for(h = [0:1:boss_columns-1]) {
      translate([h_space*h,v_offset,0]) {
        cylinder($fn=12, h=boss_height, r1=boss_i_radius, r2=boss_i_radius, center=true);
      }
    }
  }
}
