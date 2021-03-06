class Resume
  include Mongoid::Document
  include Mongoid::Timestamps
  field :resume, type: Mongoid::Boolean
  field :cover_letter, type: Mongoid::Boolean
  field :portfolio, type: Mongoid::Boolean
  field :certifications, type: Mongoid::Boolean
  field :references, type: Mongoid::Boolean
  field :recommendations, type: Mongoid::Boolean
  field :done, type: Mongoid::Boolean

  has_many :notes
  has_many :contacts
  embedded_in :job
end
