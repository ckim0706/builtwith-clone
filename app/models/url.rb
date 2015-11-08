class Url < ActiveRecord::Base
  before_create :search

  require 'nokogiri'
  require 'open-uri'

  private
  def search
    if self.link
      return_html
      bootstrap
      robots
    end
  end

  def return_html
    self.html = Nokogiri::HTML(open("#{self.link}")).to_s      
  end

  def bootstrap
    if self.html
      page = self.html 
      if page.include?('class="navbar') || page.include?('col-md-') || page.include?('col-sm-') || page.include?('col-xs-') 
        self.bootstrap = 1
      end
    end
  end

  def robots
    robot_txt = Nokogiri::HTML(open("#{self.link}/robots.txt")).to_s
    if robot_txt.include?('User-agent') || robot_txt.include?('Disallow')
      self.robots = 1
    end
  end
end
