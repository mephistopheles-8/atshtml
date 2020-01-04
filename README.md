# atshtml

atshtml is a purely static html templating system
for ATS2.  It is currently a work-in-progress.

## Why?

Mostly to explore the following:

1. Can I make a concise or usable eDSL in ATS2?
2. How feasible is it to encode the rules for complex and meandering ad-hoc 
   systems in the statics of ATS2?
3. How easy is it to get rid of most or all data represenations of HTML?

## Status

I plan to implementat static verification of the document tree, and further
testing is required.

Note that comments, styles and script tags are unescaped, so be careful with 
those.

## How to Use It?

Take a look at the `TEST` directory for examples.  Generally, the document
structure is encoded with ids for data, and then a template implementation
is required to "fill in the blanks."

## Is it Usable?
 
That depends.  You need to make sure all content ids are unique; template error
messages can be tricky to debug.  I do think it can be more concise than HTML, 
and any dynamic content is technically reusable after the initial implementation. 

LICENSE: MIT
