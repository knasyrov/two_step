class User < ActiveRecord::Base
  MALE = 1
  FEMALE = 2

  dragonfly_accessor :avatar

  state_machine :state, initial: :info do
    state :info do
      def form_fields
        [:first_name, :last_name, :sex]
      end
    end

    state :avatar do
      validates :first_name, :last_name, :sex, presence: true
      def form_fields
        [:avatar]
      end
    end

    state :completed do
      validates :avatar, presence: true
    end

    event :next_step do
      transition :info => :avatar
      transition :avatar => :completed
    end
  end  

  def full_name
    [first_name, last_name].select(&:present?).join(' ')
  end
end
