//leave on 3, others are for testing
runlevel = 3;
// Number of grooves in the rail
cNumberOfGrooves = 3; 
//1 = wide, 2 = narrow
cType = 2;
//width of the rail
cRailWidth = 20;

//set to 1 if you want retaining tags, they will be on one side only for easier printing
cRetainingTag = 1;
cRetainingTagWidth = 6;
cRetainingTagLen = 8;
cRetainingTagHeight = 5;
cRetainingTagHoleDiameter = 4;

//initialize variables
cSeg0 = 0; //top of left tooth left side
cSeg1 = 5; //top of left tooth left side
cSeg2 = 10; //bottom of left tooth right side
cSeg3 = 15; //bottom of right tooth left side
cSeg4 = 20; //top of right tooth left side
cSeg5 = 25; //top of right tooth right side, this is the overall width of the rail segment

cBase = 5; //base thickness, teeth are above this line
cOverallHeight = 30; //overall height of the rail (base & teeth)
cSegOverallLen = (cSeg5 * cNumberOfGrooves) - (cSeg1 * (cNumberOfGrooves));
echo(cSegOverallLen);
cPoints = [[cSeg0, cOverallHeight], [cSeg1,cOverallHeight],[cSeg2, cBase], [cSeg3, cBase], [cSeg4, cOverallHeight], [cSeg5, cOverallHeight],[cSeg5,0],[cSeg0,0]];

//because openscad hates variables and assignment within flow control.
c1Seg0 = 0;
c1Seg1 = 5;
c1Seg2 = 7.5;
c1Seg3 = 11.5;
c1Seg4 = 14;
c1Seg5 = 19;
c1Base = 5;
c1OverallHeight = 30;
c1SegOverallLen = (c1Seg5 * cNumberOfGrooves) - (c1Seg1 * (cNumberOfGrooves));
echo(c1SegOverallLen);
cPoints1 = [[c1Seg0, c1OverallHeight], [c1Seg1,c1OverallHeight],[c1Seg2, c1Base], [c1Seg3, c1Base], [c1Seg4, c1OverallHeight], [c1Seg5, c1OverallHeight],[c1Seg5,0],[c1Seg0,0]];

module drawbasic() {
    if (cType == 1) polygon(cPoints);
    if (cType == 2) polygon(cPoints1);
};


module drawrail(){
    for (i = [0 : cNumberOfGrooves - 1]) {
        if (cType == 1) {
            translate([i * (cSeg5 - cSeg1), 0, 0]) {
                polygon(cPoints);
            };
        };
        if (cType == 2) {
            translate([i * (c1Seg5 - c1Seg1), 0, 0]) {
                polygon(cPoints1);
            };
        };
    };
};

module drawretainingtag() {
    rotate([90, 0, 0]) {
        translate([0, 0, -cRetainingTagHeight]) {        
            difference() {
                cube([cRetainingTagWidth, cRetainingTagLen, cRetainingTagHeight], center = false);
                translate([cRetainingTagWidth/2, cRetainingTagLen-(cRetainingTagWidth/2), -0.5]) {
                    cylinder(d = cRetainingTagHoleDiameter, cRetainingTagHeight+1, center = false, $fn = 32);
                };
            };
        };
    };
};

if (runlevel == 1) {
    drawbasic();
};

if (runlevel == 2) {
    drawrail();
};

if (runlevel == 3) {
    linear_extrude(height = cRailWidth) {
        drawrail();
    };
    if (cRetainingTag == 1) {
        if (cType == 1) {
            translate([(cSegOverallLen/4), 0, cRailWidth]) {
                drawretainingtag();
            };
            translate([(cSegOverallLen/4)*3, 0, cRailWidth]) {
                drawretainingtag();
            };
        };
        if (cType == 2) {
            translate([(c1SegOverallLen/4), 0, cRailWidth]) {
                drawretainingtag();
            };
            translate([(c1SegOverallLen/4)*3, 0, cRailWidth]) {
                drawretainingtag();
            };
        };
    };
};