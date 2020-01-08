# strmixed

A datatype that is either a static string or a strptr.

## Why? 

It might not seem like the best design, but I find many situations where
dynamic strings are unusual but necessary.  This lets you treat them uniformly
in datatypes without using GC. 

LICENSE: MIT
