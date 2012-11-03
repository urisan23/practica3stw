require 'sinatra'
require 'syntaxi'
require 'erb'

class String
  def formatted_body(lang)
    styles = {:ruby => "syntax_ruby", :xml => "syntax_xml", :yaml => "syntax_yaml"}
    source = "[code lang='ruby']
                #{self}
              [/code]"
    html = Syntaxi.new(source).process
    %Q{
      <div class="syntax syntax_ruby">
        #{html}
      </div>
    }
  end
end

get '/' do
  erb :new
end

post '/' do
  erb :show, :locals => {:code => params[:code], :type => params[:lang]}
end
