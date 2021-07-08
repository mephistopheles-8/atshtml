# Static Tests

These are various tests of static constraints.  Files in this directory
are only meant to be typechecked (eg, `patscc -tcats [FILE]`)

The `should_pass` directory contains files that should pass typechecking; the
`should_fail` directory contains files that should fail.

An important note: the ATS2 compiler stops at the first failure.  Files
in the `should_pass` directory may contain multiple cases, whereas files
in the `should_fail` directory may contain only one.

TODO: I need to write a test runner!
