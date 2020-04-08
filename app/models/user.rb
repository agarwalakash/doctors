class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name
  
  self.inheritance_column = :role

  has_many :availabilities

  ROLES = {Doctor: "Doctor", Patient: "Patient"}


  def is_patient
  	role == ROLES[:Patient]	
  end

  def is_doctor
  	role == ROLES[:Doctor]	
  end
end
