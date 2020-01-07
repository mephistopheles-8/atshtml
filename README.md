# atshtml

`atshtml` is a purely static html templating system for ATS2.  It is currently in 
the proof-of-concept stage.  

Inspired by Haskell libraries like `blaze`,`lucid`, etc, but different in that 
the HTML represenation has no associated data.

GC is not required (and neither is memory-allocation in many cases). 

You can do anything with the HTML output by defining `html5$out`; concatenate
it into a buffer or send it to a socket -- it's up to you.

At this time, it's a proof-of-concept.

## Why?

Mostly to explore the following:

1. Can I make a concise and usable eDSL in ATS2?
2. How feasible is it to encode the rules for a complex and meandering ad-hoc 
   system (like the W3C specification) in the statics of ATS2?
3. How easy is it to get rid of most or all runtime data represenations in an eDSL
   for ATS2?

I would say, the experiment more-or-less succeeded, though it took me a long
time to figure out a decent approach.  It turns out, ATS2 supports static
lambdas (who knew?), which led me to move away from a static bitfield approach
that required an external constraint solver.

This kind of "verify-as-you-code" approach isn't common.  I believe Urweb 
and maybe Emerald (Nim) does something of this sort.  Generally, you need
a separate validator for the templating engine, and ATS2 lets you sidestep
that.

## Status

I need to test the static verification a bit further, and see what the boundaries
are on composability.  I imagine not all W3C rules are encoded.

Note that comments, styles and script tags are not escaped, so be careful with 
those. Attributes and text should be XSS-safe, however.

## How to Use It?

Take a look at the `TEST` directory for examples.  Generally, the document
structure is encoded with ids for data, and then a template implementation
is required to "fill in the blanks."

There is a proof eDSL which has constraints related to the W3C spec, and
a datasort eDSL which is unverified.  Technically, you can serialize any
`html5_elm_list` datasort.  The proofs are more strict, in case you want
to do some verification on the document tree also.

Much of the W3C spec is encoded, but there may be some missing pieces. 

## Is it Usable?
 
That depends: some people really don't like eDSLs.  And really, does HTML verification matter anyway?  :) 

I do think it can be more concise than HTML, and any dynamic content is reusable after the 
initial implementation (attribute values, text fields, etc).  

## Caveats

Generated C can be large, but inlining takes care of many functions, and programs are
a reasonable size.

I'm not sure how easy it is to appease the constraint solver across function boundaries.
If you are building a proof, it might be best to use macros for reusable parts.

The user needs to make sure all dynamic ids are unique and defined, else you get
template error messages in the C-compilation phase, which are tricky to debug.

Constraint errors (eg, verifiying the context of an element) can be completely indiscernable.  

I reuse some infix ops in the statics and for the proof system.  I figure the consistency
is best.  Honestly, I wish I could use the same infix operators for all static list-like ops, but
it doesn't seem posible. 

LICENSE: BSD3

