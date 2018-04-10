within IBPSA.Fluid.HeatExchangers.GroundHeatExchangers.BaseClasses.ThermalResponseFactors;
function shaGFunction
  "Return a pseudo sha code of the formatted arguments for the g-function generation"
  extends Modelica.Icons.Function;
  input Integer nbBor "Number of boreholes";
  input Real cooBor[nbBor, 2] "Coordinates of boreholes";
  input Real hBor "Borehole length";
  input Real dBor "Borehole buried depth";
  input Real rBor "Borehole radius";
  input Real alpha "Ground thermal diffusivity used in g-function evaluation";
  input Integer nbSeg = 12 "Number of line source segments per borehole";
  input Integer nbTimSho = 26 "Number of time steps in short time region";
  input Integer nbTimLon = 50 "Number of time steps in long time region";
  input Real relTol = 0.02 "Relative tolerance on distance between boreholes";
  input Real ttsMax = exp(5) "Maximum adimensional time for gfunc calculation";

  output String sha
  "Pseudo sha code of the g-function arguments";

protected
  String shaStr =  "";
  String formatStr =  "1.3e";

algorithm
  shaStr := shaStr + String(nbBor, format=formatStr);
  for i in 1:nbBor loop
   shaStr := shaStr + String(cooBor[i, 1], format=formatStr) + String(cooBor[i,
     2], format=formatStr);
  end for;
  shaStr := shaStr + String(hBor, format=formatStr);
  shaStr := shaStr + String(dBor, format=formatStr);
  shaStr := shaStr + String(rBor, format=formatStr);
  shaStr := shaStr + String(alpha, format=formatStr);
  shaStr := shaStr + String(nbSeg, format=formatStr);
  shaStr := shaStr + String(nbTimSho, format=formatStr);
  shaStr := shaStr + String(nbTimLon, format=formatStr);
  shaStr := shaStr + String(relTol, format=formatStr);
  shaStr := shaStr + String(ttsMax, format=formatStr);

  sha := IBPSA.Utilities.Cryptographics.BaseClasses.sha(shaStr);

annotation (Documentation(info="<html>
<p>
This function first creates a single string which is a concatenation of all of the
required arguments for the generation of a borefield's thermal response (or its
<i>g-function</i>) with the 
<a href=\"modelica://IBPSA.Fluid.HeatExchangers.GroundHeatExchangers.BaseClasses.ThermalResponseFactors.gFunction\">
IBPSA.Fluid.HeatExchangers.GroundHeatExchangers.BaseClasses.ThermalResponseFactors.gFunction</a>
function. All of the concatenated arguments are in exponential format with 4 significant
digits. The total length of this initial string is variable, as a higher number of boreholes
in the borefield will lead to a lengthier string.
</p>
<p>
Using this initial string, this function then returns an encrypted string, which is a pseudo SHA1 encryption
using the <a href=\"modelica://IBPSA.Utilities.Cryptographics.BaseClasses.sha\">
IBPSA.Utilities.Cryptographics.BaseClasses.sha</a> function.
</p>
</html>", revisions="<html>
<ul>
<li>
April 10, 2018, by Alex Laferriere:<br/>
First implementation.
</li>
</ul>
</html>"));
end shaGFunction;
