module MicropostsHelper

  def day_before_ratio_in_study_time
    tmp = @today_study_time[2] - @today_study_time[3]
    sign = "+"

    if tmp < 0
      sign = "-"
      tmp = -tmp
    end

    hours = tmp / 60
    minutes = tmp % 60

    "前日比#{sign + hours.to_s}時間#{minutes}分"
  end

  def week_before_ratio_in_study_time
    tmp = @this_week_study_time[2] - @this_week_study_time[3]
    sign = "+"

    if tmp < 0
      sign = "-"
      tmp = -tmp
    end

    hours = tmp / 60
    minutes = tmp % 60

    "前週比#{sign + hours.to_s}時間#{minutes}分"
  end

  def month_before_ratio_in_study_time
    tmp = @this_month_study_time[2] - @this_month_study_time[3]
    sign = "+"

    if tmp < 0
      sign = "-"
      tmp = -tmp
    end

    hours = tmp / 60
    minutes = tmp % 60

    "前月比#{sign + hours.to_s}時間#{minutes}分"
  end

end
