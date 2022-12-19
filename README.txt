FrangiVesselnessFilter3D Executable

1. Prerequisites for Deployment 

Verify that version 9.12 (R2022a) of the MATLAB Runtime is installed.   
If not, you can run the MATLAB Runtime installer.
To find its location, enter
  
    >>mcrinstaller
      
at the MATLAB prompt.
NOTE: You will need administrator rights to run the MATLAB Runtime installer. 

Alternatively, download and install the Windows version of the MATLAB Runtime for R2022a 
from the following link on the MathWorks website:

    https://www.mathworks.com/products/compiler/mcr/index.html
   
For more information about the MATLAB Runtime and the MATLAB Runtime installer, see 
"Distribute Applications" in the MATLAB Compiler documentation  
in the MathWorks Documentation Center.

2. Files to Deploy and Package

Files to Package for Standalone 
================================
-FrangiVesselnessFilter3D.exe
-MCRInstaller.exe 
    Note: if end users are unable to download the MATLAB Runtime using the
    instructions in the previous section, include it when building your 
    component by clicking the "Runtime included in package" link in the
    Deployment Tool.
-This readme file 



3. Definitions

For information on deployment terminology, go to
https://www.mathworks.com/help and select MATLAB Compiler >
Getting Started > About Application Deployment >
Deployment Product Terms in the MathWorks Documentation
Center.

FUNCTION DOCUMENTATION

The FrangiVesselnessFilter3D calculates the vesselness probability map (local tubularity) of a 3D input image or stack of 2D slices. This code is developed according to the method described in:
Frangi, Alejandro F., et al. "Multiscale vessel enhancement filtering." International Conference on Medical Image Computing and Computer-Assisted Intervention. Springer, Berlin, Heidelberg, 1998.

Steps:
1-	Run the “FrangiVesselnessFilter3D” standalone executable file
2-	Enter the file type (input should be a stack of 2D images), default is DICOM (.dcm)
3-	Choose the input folder for analysis, which contains the image dataset
4-	Choose the Frangi analysis parameters:

Scale is the standard deviation of the Gaussian kernel used for analysis to find tubular structures. Here, it is associated with the radius of the structure expected to be found.
(i)	NumberofScales: The number of differently sized vessels expected to be found. If the structures/vessels expected to be found have different radii, a range can be used. Analysis will be done for different values calculated as:
(MaximumScale - MinimumScale)/( NumberofScales -1)
(ii)	MinimumScale: The minimum radius/scale at which relevant structures (vessels) are expected to be found 
(iii)	MaximumScale: The maximum radius/scale at which relevant structures (vessels) are expected to be found
(iv)	Frangi_c: The value of c depends on the gray-scale range of the image and half the value of the maximum Hessian norm has proven to work in most cases. It should carefully be found based on the input file, the default is set to 500 (based on CT scans) and can be tested before modifying. This controls the sensitivity of the filter to deviation from background noise.
(v)	Frangi alpha and beta: Sensitivity of the filter to deviation from plate and blob - like structures.

5-	The vesselness map is saved as Ivessel in Workspace, for further processing

6-	Run  the ‘Segment’ script to transform the vesselness probability map Ivessel into a binary segmented map, BW. 

a.	If needed, adjust the threshold value in Line 12 of the Segment script, based on the raw probability values obtained in Ivessel

b.	Line 18 is for noise removal and deleting any unwanted disconnected segments smaller than 1000 pixels in length and connectivity defined using 6 neighbors. For more info, check help bwareaopen in MATLAB documentation.

c.	Readjust the number of pixels (from 1000 to higher of lower) based on the noise level or disconnected segments in your final segmentation, if needed.





