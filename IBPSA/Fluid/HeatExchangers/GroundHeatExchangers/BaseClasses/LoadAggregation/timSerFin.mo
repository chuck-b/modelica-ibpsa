within IBPSA.Fluid.HeatExchangers.GroundHeatExchangers.BaseClasses.LoadAggregation;
function timSerFin "Reads the last time value in the TStep matrix"
  extends Modelica.Icons.Function;

  input Integer nrow "Number of lines in input file";
  input Real[nrow+1,2] matrix "Temperature step response time series";

  output Modelica.SIunits.Time timFin "Final time value";

algorithm
  timFin := matrix[nrow+1,1];

  annotation (Documentation(info="<html>
<p>
Uses the temperature step response time-series matrix to determine the maximum permissible
simulation time for ground thermal response-related calculations.
</p>
</html>", revisions="<html>
<ul>
<li>
March 5, 2018, by Alex Laferriere:<br/>
First implementation.
</li>
</ul>
</html>"));
end timSerFin;
