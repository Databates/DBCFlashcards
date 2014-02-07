module Display
  BOXWIDTH = 15
  BOXHEIGHT= 10
  def self.draw(text)
    puts text
  end

  def self.clear_screen!
    print "\e[2J"
  end

  def self.reputs(str = '')
    puts "\e[2F\e[J" + str
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

  def self.fox!
    fox_ascii = ""
    fox_ascii << colorize("          Foxes 2014 Flashcards Game!                   :==$       +?O  \n",31)
    fox_ascii << colorize("                                                         =??$77I77==8+  \n",31)
    fox_ascii << colorize("                                                        =7+=$I$$7=I+ZI  \n",31)
    fox_ascii << colorize("                                                         ++++??++$NO?I~ \n",31)
    fox_ascii << colorize("                            +7I777$7$I$77$77I~,,:~?$ZZZZZ?==+$7?I?$Z$++ \n",31)
    fox_ascii << colorize("                         ~=I$ZZOOZZZZZ7ZZZZOOOOZ$$Z$ZOO$I+?7+I+II$7II+= \n",31)
    fox_ascii << colorize("                       ++++II$$7ZOOOZO$ZZZ8Z8OZZOOZ7OO$$IIIO+=$NN$D$7=+=\n",31)
    fox_ascii << colorize("                     II???+?I$7$$ZZOZZOOZ88OOO8OOO$88O77I::+==IZ7?7II+~=\n",31)
    fox_ascii << colorize("                    $$$77++7$IZ$Z$OOZZO8OZOOO$ZZ8ZOOZZ7Z7?I+:?$I+?=?:+?:\n",31)
    fox_ascii << colorize("                   OZZ7O$?+II7$$OO888OOO$8OOOOOOOZZZZ7$$$7+MN7O:?+I+:=? \n",31)
    fox_ascii << colorize("                  OO8O7$O??II77O$88D8OOZ$OZ$ZOOO$OZ$Z7$ZZ$Z+~:+I~?+?~=: \n",31)
    fox_ascii << colorize("                 $8Z77OZ8?++77$Z88DN88O$Z$$$ZO7ZOZZ$$ZZZOZOZI77I+?+==~  \n",31)
    fox_ascii << colorize("                =OOO8DZ8D$??I$ZOZOOD8D88O$ZZ$ZZ$ZOZ$ZZ8$Z$OZ7Z+~=+?=    \n",31)
    fox_ascii << colorize("                $ZZ8OOO8NDIII7ZZOZD888DOOOOOOOZOOOO$O8Z$I$$7I++?+=+     \n",31)
    fox_ascii << colorize("               I$Z$Z88ZOONII7$$OZOZO8DDNDD8OOOOOOZO88OZZ$O$I+~+??:      \n",31)
    fox_ascii << colorize("              =I$OO8DO88ND:$7$ZO8OZOZO,:~Z8O8O8888D88Z$ZOO7++I:         \n",31)
    fox_ascii << colorize("             ~7ZZO8O$O88D: ?$$O88OO7Z       : ::?I$77O$O8D8$            \n",31)
    fox_ascii << colorize("            ?$ZZOD$ZO8ND~  :O$OZO8II                :OOO8NO=            \n",31)
    fox_ascii << colorize("          :I?I$Z8DZONMD     OO88N+?                  $8OOD8             \n",31)
    fox_ascii << colorize("         ~==?IZOO78N8~     $888ZI?                   :$O8M:             \n",31)
    fox_ascii << colorize("           :?$7ODDNO~      OOD7Z+                     $88N:             \n",31)
    fox_ascii << colorize("      ::   :=+I$DZ:    ? :7DO7ZI                 :   ~?OOMO :           \n",31)
    fox_ascii << colorize("    ~    ::~:=?+$:~?+:IOI:Z8ZDO?~~?=+,,:?=I:=7?:=I$?77?ZDNMI?7=  :      \n",32)
    fox_ascii << colorize("  I?7I$7:::~:Z=I$Z8OIZO?Z$$DO$ZZ$$O7Z8ZIZ$7?$$OO8I7O77I$DNN$$7II?~7?    \n",32)
    fox_ascii << colorize("7$IO77ZZI=I$88DDD88D8DO$88Z7$O7OOO888OO$OO$ZZ$$$D7$O$7OOZONO$7Z7$I7?=   \n",32)
    fox_ascii << colorize(",=?I$I?+IIZ?$O$78OZ$OOZI77Z$O$OZZ778?$Z$O88+$O?O$Z77O?8DZD+O787I?7?~:   \n",32)
    fox_ascii << colorize("      ~7$+=?=??++7ZOZ$$$I?7I$I$?$7?+?7$$$O8ZZO$ZZI7$O?+OD+877$+??O:.    \n",32)
    fox_ascii << colorize("        :                           ~=  :7I~??I+~+ ?+== = :    $        \n",32)

    draw(fox_ascii)
  end

  #TODO: fix text interpolation
  def self.draw_card(text)
    #print "\e[2J"
    #print "\e[H"
    box = ""
    0.upto(BOXHEIGHT) do |y|
      0.upto(BOXWIDTH*2) do |x|
        if y == 0 || y == BOXHEIGHT
          box << "*"
        else
          (x == 0 || x == BOXWIDTH*2) ? box << "*" : box << " "
        end
      end
      box << "\n"
    end
    box
  end

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
