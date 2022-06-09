class Task < ApplicationRecord
  validates :name, presence: true
  validates :begin, presence: true
  validates :end, presence: true
  validate :begin_end_check

  def begin_end_check
    unless self.begin.nil? || self.end.nil?
    errors.add(:end, "は開始日より前の日付は登録できません。") unless
    self.begin <= self.end
    end
  end
end
