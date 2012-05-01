class Advertisement < ActiveRecord::Base
  validates_inclusion_of :ad_type, :in => %w(horizontal vertical)

  def self.random(type = 'vertical')
    self.find(:first, :conditions => { :ad_type => type, :status => 'active' }, :order => 'random()')
  end

  # virtual method for resetting hit count in view
  def reset_hit_count=(is_reset)
    self.hit_count = 0 if is_reset == '1'
  end

  # virtual method for no-reset default in view's form
  def reset_hit_count
    '0'
  end
end
