export function calculateStudyTime() {
  $("#micropostModal").on("click", "#btnPrimary",function() {
    var studiedAt = $("#micropost_studied_at").val().split("/");

    $("#micropost_studied_at_1i").val(studiedAt[0]);
    $("#micropost_studied_at_2i").val(studiedAt[1]);
    $("#micropost_studied_at_3i").val(studiedAt[2]);

    var hours = $('#micropost_study_hours').val() * 60;
    var minutes = $('#micropost_study_minutes').val();
    var total = parseInt(hours) + parseInt(minutes);

    $("#micropost_study_time").attr("value", total);
  });
}

export function dateTimePicker() {
  $('#datetimepicker').datetimepicker({
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
}

export function navbarCollapse(){
  $('#navbarCollapse').collapse({
    toggle: false
  });
  $("#topNavBar").on("click", "#navbarToggler", function(){
    $("#navbarCollapse").collapse("toggle");
  });
}
