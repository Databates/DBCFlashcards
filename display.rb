
module Display
  BOXWIDTH = 15
  BOXHEIGHT= 10
  def self.draw(text)
    print text
  end

  def self.clear_screen!
    print "\e[2J"
  end

  def self.reputs(str = '')
    puts "\e[0K" + str
  end

  def self.move_cursor_to_home!
    print "\e[H"
  end

  def self.flush!
    $stdout.flush
  end

  def self.wrong_answer(text)
    colorize(text,31)
  end

  def self.correct_answer(text)
    colorize(text,32)
  end

  #TODO: fix drawing setup
  #def self.draw_card(posx,posy,text)
  #  #print "\e[2J"
  #  #print "\e[H"
  #  box = ""
  #  0.upto(BOXHEIGHT) do |y|
  #    0.upto(BOXWIDTH) do |x|
  #      box << "*" if y == 0
  #      x == 0 || x == BOXWIDTH ? box << "*" : box << "\n"
  #    end
  #  end
  #  box
  #  #wrap_text(text,15)
  #end



  private

  def self.colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end

  def self.wrap_text(text,length)
    text.scan(/.{1,#{length}}/).join("\n")
  end

  def self.in_groups_of(text, n = 5, sep = ' ')
    text.each_slice(n).map(&:join).join(sep)
  end



end
