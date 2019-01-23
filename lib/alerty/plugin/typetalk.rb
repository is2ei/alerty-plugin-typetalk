require 'net/http'
require 'alerty'
require 'alerty/plugin/typetalk/version'

class Alerty
  class Plugin
    # Typetalk sends notifcation to Typetalk
    class Typetalk
      def initialize(config)
        @token = config.token || ENV['TYPETALK_TOKEN']
        @topic_id = config.topic_id || ENV['TYPETALK_TOPIC_ID']
        @template = config.template || ''
      end

      def alert(record)
        msg = parse_template(@template, record)
        post_message(msg)
      end

      private

      def post_message(msg)
        uri = URI("https://typetalk.com/api/v1/topics/#{@topic_id}")
        body = { message: msg }.to_json
        post(uri, body)
      end

      def post(uri, body)
        req = Net::HTTP::Post.new(uri)
        req['X-Typetalk-Token'] = @token
        req['Content-Type'] = 'application/json'
        req.body = body
        Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          res = http.request(req)
        end
      end

      def parse_template(template, record)
        template.dup.tap do |t|
          t.gsub!('${hostname}', record[:hostname])
          t.gsub!('${command}', record[:command])
          t.gsub!('${exitstatus}', record[:exitstatus].to_s)
          t.gsub!('${output}', record[:output])
        end
      end
    end
  end
end
