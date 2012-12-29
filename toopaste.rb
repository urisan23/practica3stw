require 'sinatra'
require 'erb'
require 'syntaxi'

class String
  def formatted_body(lang)
    types = {:ruby => "syntax_ruby", :xml => "syntax_xml", :yaml => "syntax_yaml"}
    source = "[code lang='#{lang}']
                #{self}
              [/code]"
    html = Syntaxi.new(source).process
    %Q{
      <div class="syntax #{types[lang.to_sym]}">
        #{html}
      </div>
    }
  end
end

get '/' do
  erb :new
end

post '/' do
  erb :show, :locals => {:result => params[:body], :type => params[:lang]}
end