# ResElmE

A little project I wrote for fun while learning Elm and updating my resume.

Inteded to be used with
[elm-static-html](https://www.npmjs.com/package/elm-static-html)
Personally I use pandoc and context to generate a PDF from the outputted html, an idea that I borrowed from
[here](https://mszep.github.io/pandoc_resume/).

Simply modify *Resume.elm* to set up the data for your resume.

To build with elm-static-html:

```
elm-static-html -f ResElmE.elm -o resume.html
```
