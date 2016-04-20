# -*- coding: utf-8 -*-
#Scroll Down for uriage method

emojis = Hash.new
C = ":cloud:"
M = ":moneybag:"

def str2art(str)
  str.gsub!("C", ":cloud:")
     .gsub!("M", ":moneybag:")
     .gsub!("_", "")
     .gsub!(" ", "")
end

emojis[9] = str2art("
  C_M_M_M_C_C
  M_C_C_C_M_C
  M_C_C_C_M_C
  C_M_M_M_M_C
  C_C_C_C_M_C
  M_C_C_C_M_C
  C_M_M_M_C_C
  ")

emojis[8] = str2art("
  C_M_M_M_C_C
  M_C_C_C_M_C
  M_C_C_C_M_C
  C_M_M_M_C_C
  M_C_C_C_M_C
  M_C_C_C_M_C
  C_M_M_M_C_C
  ")

emojis[7] = str2art("
  M_M_M_M_M_C
  M_C_C_M_C_C
  C_C_M_C_C_C
  C_M_C_C_C_C
  C_M_C_C_C_C
  C_M_C_C_C_C
  C_C_C_C_C_C
  ")

emojis[6] = str2art("
  C_M_M_M_C_C
  M_C_C_C_M_C
  M_C_C_C_C_C
  M_M_M_M_C_C
  M_C_C_C_M_C
  M_C_C_C_M_C
  C_M_M_M_C_C
  ")

emojis[5] = str2art("
  M_M_M_M_M_C
  M_C_C_C_C_C
  M_C_C_C_C_C
  M_M_M_M_C_C
  C_C_C_C_M_C
  M_C_C_C_M_C
  C_M_M_M_C_C
  ")

emojis[4] = str2art("
  M_C_C_C_C_C
  M_C_C_M_C_C
  M_C_C_M_C_C
  M_C_C_M_C_C
  M_M_M_M_M_C
  C_C_C_M_C_C
  C_C_C_M_C_C
  ")

emojis[3] = str2art("
  C_M_M_M_C_C
  M_C_C_C_M_C
  C_C_C_C_M_C
  C_M_M_M_C_C
  C_C_C_C_M_C
  M_C_C_C_M_C
  C_M_M_M_C_C
  ")

emojis[2] = str2art("
  C_M_M_M_C_C
  M_C_C_C_M_C
  C_C_C_C_M_C
  C_M_M_M_C_C
  M_C_C_C_C_C
  M_C_C_C_C_C
  M_M_M_M_M_C
  ")

emojis[1] = str2art("
  C_C_M_C_C_C
  C_M_M_C_C_C
  M_C_M_C_C_C
  C_C_M_C_C_C
  C_C_M_C_C_C
  C_C_M_C_C_C
  M_M_M_M_M_C
  ")

emojis[0] = str2art("
  C_M_M_M_C_C
  M_C_C_C_M_C
  M_C_C_C_M_C
  M_C_C_C_M_C
  M_C_C_C_M_C
  M_C_C_C_M_C
  C_M_M_M_C_C
  ")

define_method :uriage do |sales|
  emojis[sales]
end
