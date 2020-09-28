function configureDoughnutGraph(displayGraph) {
  var blue = 'rgb(54, 162, 235)';
  var gray = 'rgb(99, 99, 99)';

  var options = {
    cutoutPercentage: 65,
    legend: { display: false },
    responsive: false,
    title: { display: true, fontSize: 16 },
    tooltips: { enabled: false },
  };

  displayGraph(blue, gray, options);
};