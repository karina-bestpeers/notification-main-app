class SendNotificationWorker
  def perform(post_id, msg)
    post = Post.find_by(id: post_id)
    users = User.all
    users.each do |user|
      SendNotificationService.new(post, user, msg).send_notification
    end
  end
end