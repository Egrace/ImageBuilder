<h1>About</h1>

<p>Simple banner generator. Uses ImageMagick to generate images.</p>

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

<h2> #2 </h2>

```
ImageProcessing::ImageBuilder
  .new(width: 800, height: 400, color: '#f5f5f5')
  .with_label(text: 'Black Cat News', x: 180, y: 52,
              pointsize: 28, color: '#212121', font: 'Georgia')
  .with_label(text: 'Daily english jokes', x: 600, y: 52,
              pointsize: 16, color: '#757575', font: 'Georgia')
  .with_image(source: 'https://avatanplus.com/files/resources/mid/566ee57dafb5c151a1307318.png', width: 200, height: 200, x: 0, y: 0)
  .with_area_text(text: 'Q: What kind of baths do cats like best? \n A: Milk baths!',
                  font: 'Georgia', color: '#212121',
                  x: 30, y: 160, width: 700, height: 200)
  .build('/Users/Macmini/Downloads/2.jpg')
```

Result:
<br/>
<img src='http://joxi.net/8Anb3aaT6XaDAO.jpg'></img>

<h2> #3 </h2>

```
ImageProcessing::ImageBuilder
  .new(width: 800, height: 400, color: '#f5f5f5')
  .with_label(text: 'Simple label', x: 30, y: 52,
              pointsize: 28, color: '#212121', font: 'Georgia')
  .with_label(text: 'Simple sublabel', x: 550, y: 52,
              pointsize: 16, color: '#757575', font: 'Georgia')
  .with_area_text(text: 'Lorem ipsum bla bla bla Lorem ipsum bla bla bla Lorem ipsum bla bla bla Lorem ipsum bla bla bla',
                  font: 'Georgia', color: '#212121',
                  x: 30, y: 150, width: 700, height: 150)
  .build('/Users/Macmini/Downloads/2.jpg')
```

Result:
<br/>
<img src='http://joxi.ru/V2V3G66H7MQPAv.jpg'></img>

<h2> #4 </h2>

```
ImageProcessing::ImageBuilder
  .new(width: 800, height: 400, color: '#f5f5f5')
  .with_background_image(source: 'http://img.wallpaperlist.com/uploads/wallpaper/files/pro/programming-code-matrix-wallpaper-800x600-532d11ac605ad.jpg',
                         darken: '35%')
  .with_label(text: 'Breaking news!', x: 30, y: 52,
              pointsize: 28, color: '#fafafa', font: 'Arial')
  .with_area_text(text: 'The Pentagon is under constant attack from hackers from Antaktida. At the moment, the CIA is reporting the loss of location data of the nicest hamsters in the US.',
                  font: 'Arial', color: '#fafafa',
                  x: 30, y: 150, width: 700, height: 150)
  .build('/Users/Macmini/Downloads/2.jpg')
```

Result:
<br/>
<img src='http://joxi.ru/KAxJgppHxY5Gm8.jpg'></img>


<h2> #5 </h2>

```
ImageProcessing::ImageBuilder
  .new(width: 800, height: 400, color: '#f5f5f5')
  .with_background_image(source: 'http://bhstorm.com/i/2016/10/light-abstract-wallpapers-images.jpg',
                         darken: '25%')
  .with_image(source: 'http://sevroof.com/wp-content/uploads/2014/11/partner_logo3.png', width: 100, height: 50, x: 30, y: 30)
  .with_label(text: 'This is simple!', x: 120, y: 64,
              pointsize: 28, color: '#fafafa', font: 'Tahoma')
  .with_area_text(text: 'Use this simple layout for define image for your news header or something other',
                  font: 'Arial', color: '#fafafa',
                  x: 30, y: 150, width: 700, height: 150)
  .build('/Users/Macmini/Downloads/2.jpg')
```

Result:
<br/>
<img src='http://joxi.ru/LmGn7ggtWK7Xrl.jpg'></img>


<h1>Installation</h1> 
<p>Just copy image_builder.rb and processors.rb into your rails project and add this line to your gemfile: </p>

```gem 'minimagick'```

