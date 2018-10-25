class SpamUsersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |user|
      UserMailer.with(user: user).welcome_email.deliver_later
    end
  end
end
