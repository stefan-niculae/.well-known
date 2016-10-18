## Running

On **Unix** (Linux -- Ubuntu, etc and macOS) start a terminal and type:

```bash
cd /path/to/lab  # navigate to the lab's folder
ghci <lab>.hs
```

On **Windows** double-click the `<lab>.hs` file (make sure you are _not_ working inside an archive!).

Inside **ghci** you can enter commands like:

```haskell
> 3 + 4  -- basic arithmetic
7

> length "hello"  -- built-in function
5

> double 41  -- user defined function in the loaded file
82
```

 `:l <other_file>.hs` loads another file  (short for `:load`) .

 `:r`  reloads the last-loaded file -- used after editing it (short for `:reload`).

### Installing at home

Follow instructions at [haskell.org/platform](https://www.haskell.org/platform/).

I recommend the [Atom](https://atom.io) editor with the `haskell-language` plugin for syntax highlighting.

For a quick solution [rextester.com](http://rextester.com/l/haskell_online_compiler) provides an online haskell compiler.



## Administrative

**Attendance**: 50% required  (7 labs) .

**Exams**:

| date                  | medium   | importance | content                        |
| --------------------- | -------- | ---------- | ------------------------------ |
| wed, 2 nov (week 5)   | computer | 40%        | recursion (lectures 1-4)       |
| fri, 16 dec (week 11) | paper    | 40%        | data structures (lectures 5-7) |
| session               | paper    | 20%        | monads (lectures 8 - 12)       |

During exams you can bring your own downloaded/printed materials but network access is forbidden.

**Bonuses** (maximum 10% of grade) for:

* attempting next week's exercises at home
* finishing current week's exercises including optional material

### Links

Slides and labs: [bit.do/progdecl](http://bit.do/progdecl)

Labs supplement (this page): [stefan1niculae.github.io/haskell-labs](http://stefan1niculae.github.io/haskell-labs)

Moodle: [moodle.fmi.unibuc.ro/course/view.php?=id=449](moodle.fmi.unibuc.ro/course/view.php?=id=449)

### Contact

Stefan Niculae (Teaching Assistant) — stefan1niculae@gmail.com

Traian Serbanuta (Professor) — traian.serbanuta@fmi.unibuc.ro 