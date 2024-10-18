class SendNotificationService
  include NotificationsEngine::Engine.routes.url_helpers
  def initialize(post, current_user, msg)
    @post = post
    @current_user = current_user
    @msg = msg
  end

  def send_notification
    notification_params = {
      notification: {
        user_id: @current_user.id,
        message: @msg,
        status: "sent",
        channel: "all",
        user_details: {name: @current_user.name, email: @current_user.email, phone_number: @current_user.phone_number}
      }
    }
    url = notifications_url(host: 'localhost', port: 3000)
    response = RestClient.post(url, notification_params)
  end
end