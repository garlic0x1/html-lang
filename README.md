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
(html-lang:eval-html-file "path-to-html")
```

```result
120
```
