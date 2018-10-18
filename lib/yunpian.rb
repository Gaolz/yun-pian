require 'yunpian/version'
require 'net/http'
require 'json'

module Yunpian
  extend self

  attr_accessor :apikey

  SEND_URL = 'https://sms.yunpian.com/v2/sms/batch_send.json'

  # 国内短信发送接口
  #   1：准备参数 options(:apikey, :mobile, :message)
  #   2：初始化 URI 对象
  #   3：调用接口
  #   4：解析返回的结果
  def send(mobiles, message, options = {})
    options[:apikey] ||= Yunpian.apikey
    options.merge! { mobile: mobiles, text: message }

    uri = URI SEND_URL
    res = Net::HTTP.post_form(uri, options)

    result res.body
  end

  private def result(body)
    JSON.parse body
  rescue JSON::ParserError => e
    {
      code: 502,
      msg: '内容解析错误',
      detail: e.to_s
    }
  end
end
