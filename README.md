# Gumroad to Idobata 

Gumroad2Idobata is an automatic sales messenger for [Gumroad](https://gumroad.com). 

It is designed to be easily used with [idobata](http://idobata.io) chatting app and with a simple fork you can mingle with your daily chatting app e.g. [slack](https://slack.com). 

This will not only bring the hassle down to retrieve your data every morning by logging into Gumroad but with a lovely :moneybag: emoji it will also bring motivation to your team. 

Useable with slack

## Example
![gumroad2idobata demo](https://github.com/yasslab/gumroad2idobata/blob/master/.github/demo.jpg)

## Prerequisite
- Currently running on Heroku scheduler 
- Ruby 2.3.0 + (Recommend)
- Gumroad Access Token [Guide to Setup Gumroad Developer](https://gumroad.com/api#api-scopes)
- Idobata or other chatting app

## Install

You can use this program by going to the repository then typing these on the command line:

```
$ bundle exec ruby main.rb
```

## How to Use
1. The program creates a URL that enables access to your sales on gumroad dependent on time
2. Website will only return 10 individual sales data per time
3. The program will illiterates as the 'next_page_url' exist on the returned pages
4. As it loops through the all the pages returned data are added
5. When all the data are returned the program will count the sales
6. Then the program access art.rb with the total number of sales in the parameter to return lovely emoji's
7. Finally, the lovely emoji are sent to the messaging app 

##Developer
Created by @nanophate and others with @yasslab

-
[![YassLab Logo](https://dl.dropboxusercontent.com/u/2819285/yasslab_logo_copy.png)](http://yasslab.jp/)

&copy; 2016 [YassLab](http://yasslab.jp/)
