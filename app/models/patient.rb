class Patient < ActiveRecord::Base
  belongs_to :physician
  belongs_to :condition           
  has_many :action_programs, :through => :condition
  has_many :patient_tasks
  has_many :action_tasks, :through => :patient_tasks           
  
  acts_as_taggable_on :tags
  
  def name
    "#{self.first_name} #{self.last_name}"  
  end    
  
  def to_s
    self.name
  end    
  
  # Todo add paperclip and profile phot upload
  def cover_url
    ["default_patient.jpeg","default_patient2.jpeg"][rand(2)]  
  end
  
end

# create_table "patients", :force => true do |t|
#   t.string   "first_name"
#   t.string   "last_name"
#   t.string   "email"
#   t.string   "phone"
#   t.text     "description"
#   t.string   "state"
#   t.datetime "engaged_at"
#   t.datetime "last_contact"
#   t.string   "carepass_id"
#   t.string   "mhealth_id"
#   t.integer  "physician_id"
#   t.integer  "condition_id"
#   t.integer  "actions_id"
#   t.integer  "alerts_id"
#   t.datetime "created_at",    :null => false
#   t.datetime "updated_at",    :null => false
# end