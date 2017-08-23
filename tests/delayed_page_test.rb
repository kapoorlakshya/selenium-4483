require 'watir'
require 'page-object'

Selenium::WebDriver.logger.level = :info
Watir.logger.level = :info

class TestPage
  include PageObject
  include PageFactory

  link(:show_spinner_2, id: 'showSpinner2')
  div(:spinner_img1, id: 'image1')
  div(:spinner_img2, id: 'image2')
  div(:spinner_img2_div, id: 'basicModal')
end

@browser = Watir::Browser.new :ie
tp = TestPage.new(@browser)
@browser.goto "http://localhost:63342/cucumber-watir/delayed_page.html?_ijt=k1b3lb36j6u0bfapl4levikuov"
@browser.wait

tp.show_spinner_2_element.fire_event 'onclick'

30.times do
  tp.spinner_img2_element.wait_while_present
  tp.spinner_img2_div_element.wait_while_present
  sleep(2.5)
end

p "Done waiting!"