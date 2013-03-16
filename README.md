LPM
===

What?
-----

LPM is a literate programming tool. As it was destined to a french team,
the documentation is in french. The sparse comments in the code too. 

The main script is `_lpm`. It is a prototype, written in less than a day
(if I remember correctly), and not easily hackable. The `lpm` file and
those in the `doc` directory are a reimplementation in literate
programming. But I never finished it. Been sidetracked. 

Looking at other literate programming propositions, and my own markup
language, I still think that this tool is better. I hope to come and
finish it one day. I would have to translate it in english, think again
about a clean implementation, but that day will come.

Why?
----

One thing that I did not find really nice when doing literate
programming with traditionnal tools was that the source code was not
easily readable. Yes, we could read a beautiful documentation generated
by LaTeX, but... Well, when writing the code, it was ugly. Ok, that's
just my opinion, but I don't like how LaTeX source code looks like. I
really prefer things like Markdown or reStructuredText. But those are
not aimed at literate programming, and it was not obvious to me how to
use them to fulfill my goal. So, I wrote my own lightweight markup
language, aimed at writting documentation (like reStructuredText), with
an easy way to insert code (indenting all of our code is not really
easy), and to reorganize it.

How?
----

Well, it has it's own markup language. With some documentation elements,
like abstract, license placeholder, title, sections, subsections...

Code is delimited by special syntax, and can be named. We also are able
to specify the language of the code, for nice syntax highlighting. The
documentation can be splitted in different files. We can insert our
blocks of code in the documentation to refresh the mind of the reader. 

And because the goal was to have a literate source as pretty as the
literate documentation generated, there is a refactoring tool that
format the source, justifying text, cleaning paragraphs blocks, and all
that stuff. Take a look to the files, even if they are in french, you
can see that their structure is nice to the eyes. And that's the source
code, not the final document!

Of course, that tool does not only generate documentation. It is able to
extract the source code, too. It would be useless without that.

Your code is ugly.
------------------

Yep. That was a prototype, quickly hacked. And it's buggy, too. But it
works well enough to begin with, and write a better version of it, using
it. I needed to bootstrap my literate programming language.

TODO: translate at least the language documentation part in english. The
implementation may not be the one I will go for, but the language does
not risk to change a lot, and is the important part to use `_lpm`.
