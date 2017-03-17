require 'rubygems'
require 'bundler/setup'
require_relative 'image_builder'

ImageBuilder.new(image: {
                   source: '/Users/Macmini/Downloads/1.jpeg',
                   color: 'rgba(0,0,0,0.3)'
                 },
                 mask: {
                   color: 'rgba(0,0,0,0.1)'
                 },
                 resize: {
                   height: 200,
                   width: 600
                 },
                 banner: {
                   source: '/Users/Macmini/Downloads/3.png',
                   size: '50x50',
                   width: 30,
                   height: 30,
                   x: 10,
                   y: 10
                 },
                 caption: {
                   text: 'The best web solutions for your business',
                   font: 'Arial',
                   color: 'white',
                   undercolor: 'rgb(233,118,87)',
                   width: 220,
                   height: 75,
                   x: 75,
                   y: 140
                 },
                 result: '/Users/Macmini/Downloads/2.jpg').process
