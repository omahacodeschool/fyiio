# CSS Framework & Guidelines

This application uses a minimal grid framework to help build larger layout blocks, while everything else will be written by hand.

This README is meant to explain how to write CSS for this application.

## Mobile-First Development

You should build your website for a mobile-phone-sized device before considering other devices. Doing so simplifies the early stage of front-end development, which is the stage with the most ambiguity and potential for poor patterns to enter the codebase.

Developing for mobile devices first restricts the amount of columns we are likely to have and forces us to consider the specific _display objects_ that our site contains.

For example, the layout below includes a right-sidebar with the publication's name ("Slate") and some icons:

![](http://cl.ly/fXg9/Screen%20Shot%202016-03-29%20at%206.43.58%20AM.png)

If you were tasked with building this layout, you would see two tasks:

1. Make the sidebar look that way.
2. Move the sidebar and main content into their position using `float`.

But if you consider the design of the same page on a mobile device...

![](http://cl.ly/fXOp/Screen%20Shot%202016-03-29%20at%206.46.20%20AM.png)

The job is reduced to a single task:

1. Make the sidebar look that way.

So the task is reduced to just building the HTML and CSS for this:

![](http://cl.ly/fXgy/Screen%20Shot%202016-03-29%20at%206.47.18%20AM.png)

Not only does this make the job easier to approach--it also results in better CSS over the longrun, because you're starting with a less complicated product. Adding complexity over time is almost always the best approach to writing maintainable software.

## The Grid

A handful of CSS classes have been pre-written for organizing elements on the page into a grid.

These classes operate under an assumption that all space is divided into **12 columns**. So if an element needs to take up _half_ of its available width area, it would be a column with a value of _6_--as that's half of 12.

Example:

```html
<div class="col-2">
  <!-- Bunch of sidebar content... -->
</div>

<div class="col-10">
  <!-- Bunch of main content... -->
</div>
```

In this example, the 2-column `div` would take up two-twelfths of its parent's width--whether the parent was the `<body>` tag or some other element.

And the 10-column `div` would take up the other ten-twelfths of space, and both of these columns would be next to each other.

It works just as well for many-column layouts:

```html
<div class="col-2">
  <!-- Bunch of left-sidebar content... -->
</div>

<div class="col-8">
  <!-- Bunch of main content... -->
</div>

<div class="col-2">
  <!-- Bunch of right-sidebar content... -->
</div>
```

### Parent Elements

Whenever you use these column classes, you should contain them with a parent element. Either one of the below options is valid:

```html
<div class="row">
  <div class="col-2">
    <!-- Bunch of sidebar content... -->
  </div>

  <div class="col-10">
    <!-- Bunch of main content... -->
  </div>  
</div>
```

The other parent element you can use is this:

```html
<div class="clear">
  <div class="col-2">
    <!-- Bunch of sidebar content... -->
  </div>

  <div class="col-10">
    <!-- Bunch of main content... -->
  </div>  
</div>
```

Either of these approaches is valid. They both will contain the columns properly and automatically add an invisible 'clear' to the bottom, so the actual code behind the scenes would be:

```html
<div class="row/clear">
  <div class="col-2">
    <!-- Bunch of sidebar content... -->
  </div>

  <div class="col-10">
    <!-- Bunch of main content... -->
  </div>  

  <div style="clear: both"></div>
</div>
```

This is good--it means the floated columns are being cleared, so content below the parent won't be affected by its [collapsed height](https://css-tricks.com/all-about-floats/#article-header-id-3).

#### "row" vs. "clear"

The only difference between the two parents is that using `clear` instead of `row` adds some additional padding to the columns. You'll see the difference when you try it out.

There is additional documentation about the grid here: <http://getbase.org/docs/grid.html>

### Getting Started

If you're just getting started, create a file called at **app/views/pages/test.html.erb**. Paste the following HTML into it:

```html
<div class="row">
  <div class="col-2 sb">
    Sidebar 1
  </div>

  <div class="col-10 main">
    Main Content 1
  </div>  
</div>

<div class="clear">
  <div class="col-2 sb">
    Sidebar 2
  </div>

  <div class="col-10 main">
    Main Content 2
  </div>  
</div>

<style type="text/css">
  .sb{background: #666;}
  .main{background: #999}
</style>
```

Save the file and go to <http://localhost:3000/pages/test>.

You should see two horizontal containers with a slim left column and a larger right column. Notice the difference in spacing between the first horizontal container and the second--this is the difference between using `class="row"` and `class="clear"`.

### When to use the grid

Generally speaking, use these pre-defined classes only for laying out the largest components of your layout. Just because two elements are side-by-side does not mean they warrant use of these grid classes.

Consider this layout of Sublime Text:

![](http://cl.ly/fXnZ/Screen%20Shot%202016-03-29%20at%206.09.16%20AM.png)

You could use the grid classes to lay out the sidebar (where all of the files/folders are listed) next to the main coding area. But you probably would not want to use the grid to lay out the icon/filename: ![](http://cl.ly/fXL0/Screen%20Shot%202016-03-29%20at%206.10.29%20AM.png)

Remember that these classes are not generic classes for floating things to make them appear side-by-side. These classes are specifically for constructing the grid that your design is based upon (as the large majority of designs are based on _some_ apparent grid system).

#### Why Bother?

You might be wondering, if the grid classes are to be used sparingly, then what's the point of them? Why not just write that code ourselves?

Two reasons:

**1. It's in the nature of engineers to automate repeated tasks.**

Grids are present in every design, and the CSS to achieve them is usually the same across projects. Just like we leverage Sinatra or Rails to give us a common framework for application development, grid frameworks are a good start to any project.

**2. There is more to these grid classes than just side-by-side appearance.**

Grid frameworks usually include _responsive column classes_, so that you can indicate an element should have a different column size for different devices. Essentially, you can say:

> If viewing on a mobile device, make the element full-width.
> But if viewing on a tablet device (or bigger), make the element half-width.
> And if viewing on a high-def television, make the element third-width.

There are four pre-defined devices:

1. mobile
2. tablet
3. desktop
4. hd

The column size you define for an element becomes the defined column size for that device-width and any devices larger than it. You add overrides as needed.

Example:

```html
<div class="row">
  <div class="col-12 col-6-tablet col-4-hd">
    Sidebar 1
  </div>

  <div class="col-12 col-6-tablet col-8-hd">
    Main Content 1
  </div>  
</div>
```

So looking at the above code, the sidebar and main content are both full-width when viewing on a mobile device. (No need for `col-12-mobile`, as all column classes default to mobile devices.)

But if the device is a tablet, then the elements will be half-width (because of the `col-6-tablet`). This is also the size of the elements if the device is a desktop, even though the `col-6-desktop` class is not present. It's not needed, because desktop is bigger than tablet; so the `col-6-tablet` value is used for the desktop device size.

The 'hd' device is larger than a tablet, so it would also inherit the half-width column size. But because we specify column sizes with the `-hd` suffix, those values will take precedence.

This approach--where values for the smaller screen are assumed as the values for larger screens, until the values are specifically defined differently--aligns nicewith with mobile-first development.

## CSS in Rails

You will be writing your CSS in the **app/assets/stylesheets** directory.

There are already a few files there:

1. application.scss
2. _variables.scss
3. _resets.scss
4. _grid.scss
5. global.scss

First, let me explain the **.scss** extension:

### SCSS

By itself, CSS does not have variables or any other common programming constructs like functions. So it's impossible to define a variable that contains the specific blue color which our company uses across all its pages. This leads to repetitive code.

To DRY things up, we use a pre-processor called [SASS](http://sass-lang.com/guide). SASS is sort of like ERB. We write ERB, which Sinatra/Rails generate HTML for. Similarly, we will write SASS, which Sinatra/Rails generate CSS for. (The **.scss** extention stands for "SASS CSS".)

You don't have to learn anything new to use SASS. It looks _exactly_ like CSS. Here is some SASS:

```css
.headline{
  color: #003AAC;
}
```

If you _wanted_ to use SASS functionality, you could define a variable for that color and reference it instead:

```css
$blue: #003AAC;

.headline{
  color: $blue;
}
```

There's no need to use variables if you don't want to. But you _can_. From here on, I'll be referring to CSS and "SASS CSS" interchangeably.

### CSS Files

Let's revisit the list of files you start with:

1. application.scss
2. _variables.scss
3. _resets.scss
4. _grid.scss
5. global.scss

#### application.scss

This file is sort of like your "main.rb" file--it "requires" all of the other CSS files. The file starts out with a few stylesheets already included:

```css
@import "variables";
@import "resets";
@import "grid";
@import "global";
```

As you create new stylesheets, just add an `@import...` line for them. Otherwise, they won't be part of the CSS for the application.

It is this file which is eventually linked to in your application's HTML files. If you open **app/views/layouts/application.html.erb**, you'll find the following line:

```erb
<%= stylesheet_link_tag :application, media: "all" %>
```

This is a Ruby method that returns the following string:

```html
<link rel="stylesheet" type="text/css" href="/assets/application.css">
```

So the CSS that is generated by **application.scss** is stored in **/assets/application.css**, which is included in all pages of the application.

So you do not need to add a `<link>` tag yourself--Rails comes with one already. You just need to write HTML and CSS.

#### _variables.scss

This file contains some SASS variables that inform the grid. You can change these values, but I recommend against it.

You can also add your own variables, if you'd like to DRY up your CSS.

#### _resets.scss

This file resets the browser's built-in style rules. As with the CSS assignments we assigned, this reset allows you to begin coding from a more standardized baseline.

Do not modify this file at all.

#### _grid.scss

This file contains the CSS for the column classes.

Do not modify this file at all.

#### global.scss

This file is for you to add style rules that affect all/many of your application's pages. Common elements to style in this file include the navigation bar and footer.

You might also define some default heading, paragraph, and link styles here.

### Writing CSS

Freely create many files to organize your CSS. They will all be combined into one file (**application.css**) in the end, but using multiple files helps keep your CSS (which can often exceed a thousand lines) more manageable.

Consider creating a stylesheet for each controller. That's a good way to start organizing your CSS. But eventually you might move to even more granular files, where one file contains the CSS for one particular _display object_.

E.g. you might have one file each for the styles that create the following display objects:

![](http://cl.ly/fXgy/Screen%20Shot%202016-03-29%20at%206.47.18%20AM.png)

![](http://cl.ly/fXB4/Screen%20Shot%202016-03-29%20at%207.13.52%20AM.png)

![](http://cl.ly/fXMQ/Screen%20Shot%202016-03-29%20at%207.14.39%20AM.png)

## BEM

As you begin building your display objects, try to stick to the [BEM](http://getbem.com/introduction/) convention.

There are a lot of resources for BEM. Give a couple a read before beginning your CSS work:

- http://getbem.com/introduction/
- https://css-tricks.com/bem-101/
- [List of other resources](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=css%20bem)
