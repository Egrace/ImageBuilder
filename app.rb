require 'rubygems'
require 'bundler/setup'
require_relative 'image_builder'

ImageBuilder.new(image: {
                   source: '/Users/Macmini/Downloads/14.jpg',
                   color: 'rgba(0,0,0,0.5)'
                 },
                 resize: {
                   height: 600,
                   width: 800
                 },
                 banner: {
                   source: '/Users/Macmini/Downloads/31.png',
                   size: '50x50',
                   width: 64,
                   height: 64,
                   x: 10,
                   y: 10
                 },
                 title: {
                     x: 80,
                     y: 52,
                     text: "| News",
                     font: "/System/Library/Fonts/Geneva.dfont",
                     pointsize: 28,
                     color: 'white'
                 },
                 caption: {
                   text: "The Moscow government planned to allocate to the fund of Putin's ex-wife subsidies of 62 million a year",
                   font: '/Library/Fonts/Luminari.ttf',
                   color: 'white',
                   width: 700,
                   height: 200,
                   x: 10,
                   y: 160
                 },
                 result: '/Users/Macmini/Downloads/2.jpg').process
