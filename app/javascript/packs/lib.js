export function calculateStudyTime() {
  $("#micropostModal").on("click", "#btnPrimary",function() {
    var hours = $('#micropost_how_many_studied_hours').val() * 60;
    var minutes = $('#micropost_how_many_studied_minutes').val();
    var total = parseInt(hours) + parseInt(minutes);

    $("#micropost_studied_time_in_minutes").attr("value", total);
  });
}

export function dateTimePicker() {
  $('#datetimepicker1').datetimepicker({
    dayViewHeaderFormat: 'YYYY年 MMMM',
    tooltips: {
        close: '閉じる',
        selectMonth: '月を選択',
        prevMonth: '前月',
        nextMonth: '次月',
        selectYear: '年を選択',
        prevYear: '前年',
        nextYear: '次年',
        selectTime: '時間を選択',
        selectDate: '日付を選択',
        prevDecade: '前期間',
        nextDecade: '次期間',
        selectDecade: '期間を選択',
        prevCentury: '前世紀',
        nextCentury: '次世紀'
    },
    format: 'YYYY/MM/DD',
    locale: 'ja',
    showClose: true
  });

  $('#datetimepicker2').datetimepicker({
    tooltips: {
        close: '閉じる',
        pickHour: '時間を取得',
        incrementHour: '時間を増加',
        decrementHour: '時間を減少',
        pickMinute: '分を取得',
        incrementMinute: '分を増加',
        decrementMinute: '分を減少',
        pickSecond: '秒を取得',
        incrementSecond: '秒を増加',
        decrementSecond: '秒を減少',
        togglePeriod: '午前/午後切替',
        selectTime: '時間を選択'
    },
    format: 'HH:mm',
    locale: 'ja',
    showClose: true
  });
}

export function navbarCollapse(){
  $('#navbarCollapse').collapse({
    toggle: false
  });
  $("#topNavBar").on("click", "#navbarToggler", function(){
    $("#navbarCollapse").collapse("toggle");
  });
}
