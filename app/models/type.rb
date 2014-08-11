class Type < ActiveRecord::Base
  has_many :products

  def nice_name
    self.name.gsub('_', ' ').gsub(' and ', ' & ').titlecase
  end

  def link
    [self.nice_name, '/!' + self.code]
  end

  before_save :underscores_to_spaces!

  protected
    def underscores_to_spaces!
      self.name.gsub!('_', ' ')
    end
end
