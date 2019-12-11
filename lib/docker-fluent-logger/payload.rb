module DockerFluentLogger
  module Payload
    def append_payload_error(e)
      @payload_exception = [e.class.name, e.message]
      @payload_exception_object = e
    end

    def append_info_to_payload(payload)
      super

      payload[:timestamp] = Time.now.utc.iso8601(6)
      payload[:hostname] = Socket.gethostname
      payload[:uuid] = request.uuid
      payload[:url] = request.url
      payload[:referer]  = request.referer
      payload[:remote_ip] = request.remote_ip
      payload[:user_agent] = request.user_agent
      payload[:session_id] = session.id if session.present?
      payload[:exception] = @payload_exception if @payload_exception.present?
      payload[:exception_object] = @payload_exception_object if @payload_exception_object.present?
    end
  end
end
