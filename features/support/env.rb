require 'watir'

Before do |scenario|

  if ENV['RUN_LOCAL']
    case ENV['BROWSER']
      when 'chrome'
        @browser = Watir::Browser.new :chrome
        @browser.window.maximize
      when 'safari'
        @browser = Watir::Browser.new :safari
      when 'firefox'
        @browser = Watir::Browser.new :firefox
      when 'headless'
        @browser = Watir::Browser.new :firefox, headless: true
      when 'remote'
        @browser = Watir::Browser.new :chrome,
                                      url: 'http://selenium__standalone-chrome:4444/wd/hub/' 
    else
      # Default when nothing is specified
      @browser = Watir::Browser.new :chrome
      @browser.window.maximize
    end
  end

end

After do |scenario|
  if ENV['RUN_LOCAL']
    @browser.quit
  end
end