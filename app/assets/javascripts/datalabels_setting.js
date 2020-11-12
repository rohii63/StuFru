Chart.helpers.merge(Chart.defaults.global.plugins.datalabels, {
  color: 'rgb(0, 72, 255)',
  font: { weight: 'bold' },
  anchor: 'end',
  align: 'end',

  formatter: function (value, context) {
    hours = Math.floor(value / 60);
    minutes = value % 60;

    if (value == 0) {
      return "";

    } else if (hours == 0) {
      return minutes + "m";

    } else if (minutes == 0) {
        return hours + 'h';

    } else {
      return hours + 'h' + " " + minutes + "m";

    };
  }
});