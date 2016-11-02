---
layout:  home
title:   Haskell Labs
tagline: Declarative Programming labs supplement
---
# Labs
<ul class="posts">
  {% for post in site.posts reversed %}
    <li>
    <small class="post-date">{{ post.date | date: '%-d %b' }}</small>
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
      – {{ post.tagline }}
    </li>
  {% endfor %}
</ul>

<h1 class="highlighted">Recap lab for first test</h1>
Friday 4 nov, 14:00.

# Purpose

This supplement aims to be a quick-ref — between a manual and a cheatsheet.

It has three purposes:

1. help me organize what to write on the whiteboard
2. help you quickly recap previous labs
3. give you a quick run-down in case you skipped a lab (hopefully not used very often)

This page alone is not sufficient for the Declarative Programming class. You  should **not to skip** any labs, and **attend** the lectures.


# Administrative issues

**Attendance**: 50% required  (7 labs) .

**Exams**:

| date                  | medium   | importance | content                        |
| --------------------- | -------- | ---------- | ------------------------------ |
| fri, 11 nov (week 6)  | computer | 40%        | recursion (lectures 1-4)       |
| fri, 16 dec (week 11) | paper    | 40%        | data structures (lectures 5-7) |
| session               | paper    | 20%        | monads (lectures 8 - 12)       |

During exams you can bring your own downloaded/printed materials but network access is forbidden.

**Bonuses** (max 10%) for:

* current week's optional exercises
* next week's exercises in advance


### Links

Lectures and exercises: [bit.do/progdecl](http://bit.do/progdecl)

Labs supplement (this page): [stefan1niculae.github.io/haskell-labs](http://stefan1niculae.github.io/haskell-labs)

Moodle: [moodle.fmi.unibuc.ro/course/view.php?=id=449](moodle.fmi.unibuc.ro/course/view.php?=id=449)


# Contact

Stefan Niculae (Teaching Assistant) — stefan1niculae@gmail.com

Traian Serbanuta (Professor) — traian.serbanuta@fmi.unibuc.ro
