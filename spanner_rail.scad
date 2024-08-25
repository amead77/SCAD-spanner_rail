runlevel = 1;
cNumberOfGrooves = 3; // Number of grooves in the rail

//base width is defined based on the top geometry
//angles are defined based on the top geometry
cSeg0 = 0; //top of left tooth left side
cSeg1 = 5; //top of left tooth left side
cSeg2 = 10; //bottom of left tooth right side
cSeg3 = 15; //bottom of right tooth left side
cSeg4 = 20; //top of right tooth left side
cSeg5 = 25; //top of right tooth right side


cBase = 5; //base thickness, teeth are above this line
cOverallHeight = 30; //overall height of the rail (base & teeth)

cPoints = [[cSeg0,cOverallHeight],[cSeg1,cOverallHeight],[cSeg2,cBase],[cSeg3,cBase],[cSeg4,cOverallHeight],[cSeg5,cOverallHeight]];

cPoints2 = [[cSeg0, cOverallHeight], [cSeg1,cOverallHeight],[cSeg2, cBase], [cSeg3, cBase], [cSeg4, cOverallHeight], [cSeg5, cOverallHeight],[cSeg5,0],[cSeg0,0]];

if (runlevel == 1) {
    polygon(cPoints2);
};