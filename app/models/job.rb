class Job < ApplicationRecord
  belongs_to :user
  has_many :events, as: :attendable
  has_many :notes, as: :notable
  
  # before_save :shorten_url

  def next_steps
    case
      when self.current_phase == "Accepted"
        return "YOU ARE AMAZING! CONGRATS!"
      when self.current_phase == "Offer"
        return "Call our DBC peeps for advice on salary negotiation."
      when self.current_phase == "Checking references"
        return "Make sure you have told your references that someone will be reaching out to them."
      when self.current_phase == "Onsite Interview"
        return "Research the people you're meeting with. Make sure you know where the interview is. Review algorithms."
      when self.current_phase == "Technical Phone Screen"
        return "Know the company's tech stack. Review algorithms."
      when self.current_phase == "Phone Screen"
        return "Practice giving your personal elevator pitch. Understand how your background can contribute to company goals."
      when self.current_phase == "Informational Interview"
        return "Develop a list of questions for your interviewer. Look them up on LinkedIn."
      when self.current_phase == "Applied"
        return "Go you! Now look up 5 people who work at the company and reach out to them!"
      when self.current_phase == "Wishlist"
        return "Research the company. Do you want to work there? Make sure it's aligned to your goals. Write a cover letter."
      end
  end

  def points 
    case
      when self.current_phase == "Accepted"
        return 1500
      when self.current_phase == "Offer"
        return 1000
      when self.current_phase == "Checking references"
        return 50
      when self.current_phase == "Onsite Interview"
        return 500
      when self.current_phase == "Technical Phone Screen"
        return 400
      when self.current_phase == "Phone Screen"
        return 300
      when self.current_phase == "Informational Interview"
        return 200
      when self.current_phase == "Applied"
        return 100
      when self.current_phase == "Wishlist"
        return 50
      end
  end 

  def self.total_job_points
    self.all.reduce(0) { |sum, job| sum + job.points}
  end

  # def shorten_url
  #   self.url = SecureRandom.hex(3)
  # end
end
