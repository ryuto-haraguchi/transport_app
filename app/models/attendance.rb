class Attendance < ApplicationRecord
  belongs_to :employee
  belongs_to :vehicle

  validates :clock_in_time, presence: true
  validates :clock_out_time, presence: true, if: :clocked_out?

  validate :clock_out_after_clock_in


def clocked_out?
    clock_out_time.present?
end
  
def clock_out_after_clock_in
  if clock_out_time.present? && clock_in_time.present? && clock_out_time < clock_in_time
    errors.add(:clock_out_time, "は出勤時刻より後でなければなりません")
  end
end

end
