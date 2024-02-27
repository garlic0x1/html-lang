# HTML-lang

HTML is a programming language:

```html
<defun> factorial <nil> n acc </nil>
 <if> <equal> n 0 </equal>
   acc
   <factorial>
     <dec> n </dec>
     <times> n acc </times>
   </factorial>
 </if>
</defun>

<factorial> 5 1 </factorial>
```

```lisp
(eval-html-file "path-to-html")
```

```result
120
```

I have also included a simple TCP server, you must have usocket loaded to run it.
