require 'sinatra'
require 'erb'
require 'syntaxi'

class String
  def formatted_body(lang)
    styles = {:ruby => "syntax_ruby"}
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
	erb :showruby, :locals => {:code => params[:code], :type => params[:lang]}
end