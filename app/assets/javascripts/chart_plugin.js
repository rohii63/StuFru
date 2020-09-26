var chartJsPluginCenterLabel = {
  afterDatasetsDraw: function (chart) {
    // ラベルの X 座標と Y 座標
    var canvas = chart.ctx.canvas;
    var labelX = canvas.clientWidth / 2;
    var labelY = Math.round((canvas.clientHeight + chart.chartArea.top) / 2);
    // ラベルの値
    var value = chart.data.datasets[0].data[0] + '%';
    // ラベル描画
    var ctx = this.setTextStyle(chart.ctx);
    ctx.fillText(value, labelX, labelY);
  },

  /**
    * 書式設定
    */
  setTextStyle: function (ctx) {
    var fontSize = 40;
    var fontStyle = 'normal';
    var fontFamily = '"Helvetica Neue", Helvetica, Arial, sans-serif';
    ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);
    ctx.fillStyle = '#636363';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';

    return ctx;
  }
};