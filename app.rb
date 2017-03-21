require 'rubygems'
require 'bundler/setup'
require_relative 'image_builder'

ImageProcessing::ImageBuilder
  .new(width: 800, height: 600)
  .with_background_image(source: '/Users/Macmini/Downloads/1.jpeg', darken: '30%')
  .with_logo(source: '/Users/Macmini/Downloads/3.png',
             width: 64, height: 64,
             x: 10, y: 10)
  .with_title(text: '| News', x: 80, y: 52,
              pointsize: 28, color: 'white')
  .with_caption(text: "The Moscow government planned to allocate to the fund of Putin's ex-wife subsidies of 62 million a year",
                font: 'Arial', color: 'white',
                x: 10, y: 160, width: 700, height: 200)
  .build('/Users/Macmini/Downloads/2.jpg')
