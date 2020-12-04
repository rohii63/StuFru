module MicropostsHelper
  def day_before_ratio_in_study_time(study_time_today, study_time_yesterday)
    tmp = study_time_today - study_time_yesterday
    sign = '+'

    if tmp.negative?
      sign = '-'
      tmp = -tmp
    end

    hours = tmp / 60
    minutes = tmp % 60

    "前日比 #{sign + hours.to_s}時間#{minutes}分"
  end

  def week_before_ratio_in_study_time(study_time_this_week, study_time_last_week)
    tmp = study_time_this_week - study_time_last_week
    sign = '+'

    if tmp.negative?
      sign = '-'
      tmp = -tmp
    end

    hours = tmp / 60
    minutes = tmp % 60

    "前週比 #{sign + hours.to_s}時間#{minutes}分"
  end

  def month_before_ratio_in_study_time(study_time_this_month, study_time_last_month)
    tmp = study_time_this_month - study_time_last_month
    sign = '+'

    if tmp.negative?
      sign = '-'
      tmp = -tmp
    end

    hours = tmp / 60
    minutes = tmp % 60

    "前月比 #{sign + hours.to_s}時間#{minutes}分"
  end
end
