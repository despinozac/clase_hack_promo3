class Person < ActiveRecord::Base

  has_many :emails, dependent: :destroy

  validates :name, :last_name, :ci, presence: true
  validates :ci, numericality: 
    { only_integer: true, greater_than: 10000, less_than: 40000000 }
  validate :check_ci_even, if: :ci?

  before_save :normalize

  def main_email
    emails.where(main: true).take
  end

  def full_name
    [name, last_name].join(' ')
  end

  private

  def normalize
    self.name.upcase!
    self.last_name.upcase!
  end

  def check_ci_even
    if ci.odd?
      errors.add(:ci, "La ci debe ser par")
    end  
  end
end