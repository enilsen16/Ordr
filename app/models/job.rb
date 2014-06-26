class Job
  include Mongoid::Document
  field :title, type: String
  field :url, type: String
  field :company_name, type: String
  field :due_date, type: DateTime
  field :done, type: Mongoid::Boolean

  embeds_many :interviews
  embeds_many :networks
  embeds_one :research
  embeds_one :resume
  embeds_one :job_application

  accepts_nested_attributes_for :research, :networks, :resume, :job_application, :interviews


   def initialize_job
     self.research = self.create_research
     self.job_application = self.create_job_application
     self.resume = self.create_resume
     self.networks << self.networks.create
     self.interviews << self.interviews.create
   end
end
