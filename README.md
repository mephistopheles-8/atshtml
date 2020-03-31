# atshtml

__Note: This is a prototype__

`atshtml` is a static html templating system for ATS2.  It is currently in 
the proof-of-concept stages. 

Inspired by Haskell libraries like `blaze`,`lucid`, etc, but different in that 
the HTML represenation has no associated data at runtime.

GC is not required (and neither is memory-allocation in many cases). 

You can do anything with the HTML output by defining `html5$out`; concatenate
it into a buffer or send it to a socket -- it's up to you.

## Why?

Mostly to explore the following:

1. Can I make a concise and usable eDSL in ATS2?
2. How feasible is it to encode the rules for a complex and meandering ad-hoc 
   system (like the W3C specification) in the statics of ATS2?
3. How easy is it to get rid of most or all runtime data represenations in an eDSL
   for ATS2?

I would say the experiment was mostly a success, though it took me a long
time to figure out a decent approach.  It turns out ATS2 supports static
lambdas, which made things much easier than expected.

While it seems excessive, the rules of HTML are quite complex.  It's good to have
them embedded in the system that you are using.  

## Status

I need to test the static verification a bit further, and see what the boundaries
are on composability.  Some W3C rules may be missing.

Not finished yet:
- MathML/SVG are not yet implemented
- Various tests.

The `datasort` API should mostly work as expected, but the proof API may not cover
all cases, and will be subject to gradual refinement over time.


## Examples

It's necessary to implement these three output functions, depending on how
you wish to use the data:

```ats2
    (** example **)
    absvt@ype myenv
 
    implement 
    html5$out<strmixed1><myenv>( x, sm ) = _
    implement
    html5$out<char><myenv>( x, sm ) = _
    implement
    html5$out<string><myenv>( x, sm ) = _

```

With datasorts:

```ats2
    #include "atshtml/mylibies.hats"
    #include "atshtml/HATS/atshtml_infix.hats"
    #define ss2m string2mixed

    stacst en : int
    stacst utf8 : int
    stacst page_title : int
    stacst hello_world : int

    stadef document 
      = doctype'
      :*: html'(lang$(en) :@: anil
            , head'(anil,
                  meta'(charset$(utf8) :@: anil) 
              :*: title'(page_title)
              :*: enil
            ) 
          :*: body'(anil,
                 p'(anil, text'(hello_world) :*: enil)
                :*: enil
            )
          :*: enil
      ) :*: enil

    implement (a)
    html5$attr<utf8><a>( x )        = ss2m("utf-8")
    implement (a)
    html5$attr<en><a>( x )          = ss2m("en")
    implement (a)
    html5$text<page_title><a>( x )  = ss2m("Hello world")
    implement (a)
    html5$text<hello_world><a>( x ) = ss2m("Hello world")

    var env : void = ()
    val () = html5_elm_list_out<document><void>( env ) 

```

With proofs:

```ats2
    #include "atshtml/mylibies.hats"
    #include "atshtml/HATS/atshtml_infix_prf.hats"
    #define ss2m string2mixed

    stacst en : int
    stacst utf8 : int
    stacst page_title : int
    stacst hello_world : int

    prval document 
      = document1(
            lang${..}{en}() :@: anil
        ,   anil
        ,   meta'(charset${..}{utf8}() :@: anil) 
            :*: title'{..}{page_title}()
            :*: enil
        , anil
        ,  p'(anil, text'{..}{hello_world}() :*: enil)
           :*: enil
        )

    implement (a)
    html5$attr<utf8><a>( x )        = ss2m("utf-8")
    implement (a)
    html5$attr<en><a>( x )          = ss2m("en")
    implement (a)
    html5$text<page_title><a>( x )  = ss2m("Hello world")
    implement (a)
    html5$text<hello_world><a>( x ) = ss2m("Hello world")

    var env : void = ()
    val () = html5_elm_list_out_verified<void>( document | env ) 

```

The purpose of the proof eDSL is experimental document verification.
For example:

```ats2
    (** This will typecheck **)
    prval document 
      = document1(
            lang${..}{en}() :@: anil
        ,   anil
        ,   meta'(charset${..}{utf8}() :@: anil) 
            :*: title'{..}{page_title}()
            :*: enil
        , anil
        ,  ul'(anil
             , li'(anil, text'{..}{hello_world}() :*: enil) 
               :*: enil 
           ) :*: enil
        )
    
    (** This will cause a constraint error **)
    prval document 
      = document1(
            lang${..}{en}() :@: anil
        ,   anil
        ,   meta'(charset${..}{utf8}() :@: anil) 
            :*: title'{..}{page_title}()
            :*: enil
        , anil
        (** li in body tag is invalid **)
        , li'(anil, text'{..}{hello_world}() :*: enil) 
          :*: enil 
        )


```

( Many cases have been implemented, but more tests need to be done )

Document values are separate from document structure. The basic user-implemented functions are:

```ats2

(** Attr value **)
fun {id:int}{env:vt@ype+}
  html5$attr( &env ) : strmixed1

(** Attr void: true or false **)
fun {id:int}{env:vt@ype+}
  html5$attr_void( &env ) : bool

(** Data attributes; key, value **)
fun {id:int}{env:vt@ype+}
  html5$attr_data_key( &env ) : strmixed1

fun {id:int}{env:vt@ype+}
  html5$attr_data_value( &env ) : strmixed1

(** Script text **)
fun {id:int}{env:vt@ype+}
  html5$script( &env ) : strmixed1

(** Comment text **)
fun {id:int}{env:vt@ype+}
  html5$comment( &env ) : strmixed1

(** Text **)
fun {id:int}{env:vt@ype+}
  html5$text( &env ) : strmixed1

(** Style Text **)
fun {id:int}{env:vt@ype+}
  html5$style( &env ) : strmixed1


```

Defining templates in terms of the pair `(id,vt@ype+)` preserves an open implementation.
The `id` specifies a specific case, whereas the `vt@ype+` can be used to define
a sensible default. 

The language has several special words also.  As a convention, the `'` postfix is
used for elements and the `$` postfix is used for attributes:

```ats2

(** For elements **)

stadef EITHER'(xs0,xs1,id) : html5_elm
  = html5_elm_either(xs0,xs1,id)

stadef MANY'(xs0,id) : html5_elm
  = html5_elm_many(xs0,enil,id)

stadef MANY_OR'(xs0,xs1,id) : html5_elm
  = html5_elm_many(xs0,xs1,id)

stadef OPT'(xs0,id) : html5_elm
  = html5_elm_opt(xs0,id)

stadef WITH'(a,xs0,id) : html5_elm
  = html5_elm_frame(a,xs0,id)


(** For attributes **)

stadef OPT$(xs0,id) : html5_attr 
  = html5_attr_opt(xs0,id)

stadef EITHER$(xs0,xs1,id) : html5_attr 
  = html5_attr_either(xs0,xs1,id)

```
( The values exist as proofs also )

The values at runtime depend on `env`, the state.  The
following user-implemented functions determine logical branching:

```ats2

fun {id:int}{env:vt@ype+}
  html5$attr$either_isleft( &env ) : bool

fun {id:int}{env:vt@ype+}
  html5$attr$opt_issome( &env ) : bool

fun {id:int}{env:vt@ype+}
  html5$elm$many_has_next( &env ) : bool

fun {id:int}{env:vt@ype+}
  html5$elm$either_isleft( &env ) : bool

fun {id:int}{env:vt@ype+}
  html5$elm$opt_issome( &env ) : bool

``` 

Finally, there is one special word that permits branching of
state. 

```ats2

stadef WITH'(a,xs0,id) : html5_elm
  = html5_elm_frame(a,xs0,id)

```

This basically conveys the existence of a function, `env -> a`, where
`env` is the current env.  For the elm list `xs0`, a variable of type `a`
will be treated as the state.  This permits reuse of static declarations.

When using `WITH'`, the following templates need to be implemented:

```ats2

fun {id:int}{env,a:vt@ype+}
  html5$push( &env ) : a

fun {id:int}{env,a:vt@ype+}
  html5$pop( &env, a ) : void

```


## Caveats

Generated C can be large, but inlining takes care of many functions, and programs are
a reasonable size.

I'm not sure how easy it is to appease the constraint solver across function boundaries.
If you are building a proof, it might be best to use macros for reusable parts.

The user needs to make sure all dynamic ids are unique and defined, else you get
template error messages in the C-compilation phase, which are tricky to debug.

Constraint errors (eg, verifiying the context of an element) can be indiscernable. 

I reuse some infix ops in the statics and for the proof system.  I figure the consistency
is best, but it requires separate `.hats` files. 

The scope of this library is only HTML: attribute values are escaped, but values are strings. 
This library does not ensure correctness of attribute values, CSS or JS.

LICENSE: BSD3

