module DockerFluentLogger
  module Payload
    def append_info_to_payload(payload)
      super

      payload[:uuid] = request.uuid
      payload[:url] = request.url
      payload[:referer]  = request.referer
      payload[:remote_ip] = request.remote_ip
      payload[:user_agent] = request.user_agent
      payload[:session_id] = session.id if session.present?
    end
  end
end
