
var canvas, ctx;
gnuplot.grid_lines = true;
gnuplot.zoomed = false;
gnuplot.active_plot_name = "gnuplot_canvas";
gnuplot.active_plot = gnuplot.dummyplot;
gnuplot.display_is_uptodate = false;
gnuplot.help_URL = "canvas_help.html";
gnuplot.dummyplot = function() {};
function gnuplot_canvas( plot ) { gnuplot.active_plot(); };
