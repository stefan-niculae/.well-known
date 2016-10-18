---
layout:  home
title:   Haskell Labs
tagline: Declarative Programming labs supplement
---
# Labs
<div id="home">
  <ul class="posts">
    {% for post in site.posts reversed %}
      <li>
        <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
        – {{ post.tagline }}<small>, {{ post.date | date: '%-d %b' }}</small>
      </li>
    {% endfor %}
  </ul>
</div>

# Purpose

This supplement has three purposes:

1. help me organize what to write on the whiteboard
2. help you quickly remember previous labs
3. give you a quick run-down in case you skipped a lab (hopefully not used very often)

Hopefully the third aspect is the least used one.

That being said, I *highly* encourage you **not to skip** any labs, and **attend** the lectures.


# Administrative issues

**Attendance**: 50% required  (7 labs) .

**Exams**:

| date                  | medium   | importance | content                        |
| --------------------- | -------- | ---------- | ------------------------------ |
| wed, 2 nov (week 5)   | computer | 40%        | recursion (lectures 1-4)       |
| fri, 16 dec (week 11) | paper    | 40%        | data structures (lectures 5-7) |
| session               | paper    | 20%        | monads (lectures 8 - 12)       |

During exams you can bring your own downloaded/printed materials but network access is forbidden.

**Bonuses** (max 10%) for:

* attempting next week's exercises at home
* finishing current week's exercises including optional material

### Links

Lectures and worksheets: [bit.do/progdecl](http://bit.do/progdecl)

Labs supplement (this page): [stefan1niculae.github.io/haskell-labs](http://stefan1niculae.github.io/haskell-labs)

Moodle: [moodle.fmi.unibuc.ro/course/view.php?=id=449](moodle.fmi.unibuc.ro/course/view.php?=id=449)


# Contact

Stefan Niculae (Teaching Assistant) — stefan1niculae@gmail.com

Traian Serbanuta (Professor) — traian.serbanuta@fmi.unibuc.ro
