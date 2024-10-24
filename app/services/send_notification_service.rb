class SendNotificationService
  include NotificationsEngine::Engine.routes.url_helpers
  def initialize(post, msg)
    @post = post
    @msg = msg
  end

  def send_notification
    notification_params = {
      notification: {
        message: @msg,
        status: "pending",
        channel: "all"
      }
    }
    url = notifications_url(host: 'localhost', port: 3000)
    response = RestClient.post(url, notification_params)
  end
end