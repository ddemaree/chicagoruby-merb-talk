class Exceptions < Merb::Controller
  
  def standard_error
    # ?
    render "ERROR!!"
  end
  
  def exception
    render ("ERROR:#{request.exceptions.first.message}\n" + request.exceptions.first.backtrace.join("\n")), :format => :text
  end
  
end