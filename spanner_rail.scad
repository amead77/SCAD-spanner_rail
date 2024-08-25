runlevel = 2;
cNumberOfGrooves = 3; // Number of grooves in the rail
//1 = wide, 2 = narrow
cType = 2;

//initialize variables
cSeg0 = 0; //top of left tooth left side
cSeg1 = 5; //top of left tooth left side
cSeg2 = 10; //bottom of left tooth right side
cSeg3 = 15; //bottom of right tooth left side
cSeg4 = 20; //top of right tooth left side
cSeg5 = 25; //top of right tooth right side, this is the overall width of the rail segment

cBase = 5; //base thickness, teeth are above this line
cOverallHeight = 30; //overall height of the rail (base & teeth)

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

cPoints1 = [[c1Seg0, c1OverallHeight], [c1Seg1,c1OverallHeight],[c1Seg2, c1Base], [c1Seg3, c1Base], [c1Seg4, c1OverallHeight], [c1Seg5, c1OverallHeight],[c1Seg5,0],[c1Seg0,0]];

if (runlevel == 1) {
    if (cType == 1) polygon(cPoints);
    if (cType == 2) polygon(cPoints1);
};

if (runlevel == 2) {
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