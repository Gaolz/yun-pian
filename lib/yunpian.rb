require 'yunpian/version'
require 'net/http'

module Yunpian
  APIKEY = "23a126095757a111a73f0ed8d5cb5b31".freeze

  # 国内短信单条发送接口
  def to(mobile, text)
    uri = URI('https://sms.yunpian.com/v2/sms/single_send.json')
    req = Net::HTTP::Post.new(uri)
    req.set_form_data('apikey' => APIKEY, 'mobile' => mobile, 'text' => text)

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end
  end
  module_function :to

  # 国内短信批量发送接口
  def batch_to(mobiles, text)
    uri = URI('https://sms.yunpian.com/v2/sms/batch_send.json')
    res = Net::HTTP.post_form(uri, 'apikey' => APIKEY, 'mobile' => mobiles, 'text' => text)
  end
  module_function :batch_to

end
