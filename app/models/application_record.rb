class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_validation :normalize_attributes

  private

  def normalize_attributes
    attributes.each do |key, value|
      if value.is_a?(String) 
        self[key] = value.tr("０-９", "0-9").gsub(/[\s　]+/, "")
      end
    end
  end
end
