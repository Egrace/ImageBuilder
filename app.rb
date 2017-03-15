require 'rubygems'
require 'bundler/setup'
require_relative 'image_builder'

ImageBuilder.new(image: {
                   source: '/home/egrace/1.jpg'
                 },
                 mask: {
                   color: 'rgba(0,0,0,0)'
                 },
                 resize: {
                   height: 200,
                   width: 600
                 },
                 banner: {
                   source: '/home/egrace/3.png',
                   size: '50x100',
                   x: 10,
                   y: 10
                 },
                 caption: {
                   text: 'The best web solutions for your business',
                   font: 'Arial',
                   color: 'white',
                   undercolor: '#ff673b',
                   width: 220,
                   height: 75,
                   x: 75,
                   y: 140
                 },
                 result: '/home/egrace/2.jpg').process
