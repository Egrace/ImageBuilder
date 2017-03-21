<h1>About</h1>

Simple banner generator. Uses ImageMagick to generate images.

<h1>Samples of usage</h1>

<h2> #1 </h2>

```
ImageProcessing::ImageBuilder
  .new(width: 800, height: 400, color: 'black')
  .with_label(text: 'Simple title', x: 30, y: 52,
              pointsize: 28, color: 'white')
  .with_area_text(text: 'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo.',
                  font: 'Georgia', color: 'white',
                  x: 30, y: 160, width: 700, height: 200)
  .build('/Users/Macmini/Downloads/2.jpg')
```

Result:
<br/>
<img src='http://joxi.ru/DmBZ7ggi351BmP.jpg'></img>

<h1>Installation</h1> <br/>
Just copy image_builder.rb and processors.rb into your rails project and add this line to your gemfile:
<br/>

```gem 'minimagick'```

