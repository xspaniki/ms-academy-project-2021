class User < ApplicationRecord
  belongs_to :organization, class_name: 'Organization'
  has_many :addresses
  accepts_nested_attributes_for :addresses, reject_if: :all_blank, allow_destroy: true

  enum sex: { man: 'man', woman: 'woman', non_binary: 'non_binary' }

  scope :with_organization, -> { where.not(organization_id: nil) }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true, if: Proc.new{|r| r.id < 5 }, strict: true, on: :update
  validate :name_cant_starts_with_bang

  after_initialize :test_ai_callback
  after_find :test_af_callback
  after_create :set_sex

  def self.without_organization
    where(organization_id: nil)
  end

  private

  def set_sex
    self.sex ||= 'non_binary'
    self.save
  end

  def test_ai_callback
    puts "After initialize..."
  end

  def test_af_callback
    puts "After find..."
  end

  def name_cant_starts_with_bang
    if first_name.starts_with?('!')
      errors.add(:first_name, 'cant starts with !')
    end
    
    if last_name.starts_with?('!')
      errors.add(:last_name, 'cant starts with !')
    end
  end
end
