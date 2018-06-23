class ConversionsController < ApplicationController

  def show
    conversion = JSON.parse(decrypt(params[:token]))
    render_conversion(conversion)
  end

  private

  def render_conversion(conversion)
    case conversion[:type]
      when 'survey'
        redirect_to new_survey_path(conversion[:customer_id])
      else
        redirect_to root
    end
  end

  def decrypt(token)
    SimpleCipher.decrypt Base64.strict_decode64(token)
  end
end
