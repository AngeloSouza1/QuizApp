class UserLevel < ApplicationRecord
  belongs_to :user

  def classification
    case points
    when 0..100
      "Iniciante"
    when 101..200
      "Intermediário"
    else
      "Expert"
    end
  end

end
