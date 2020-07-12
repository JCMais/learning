# Exercise: Protocols-2

Using a list of words in your language, write a program to look for words where the result of calling `rot13(word)` is also a word in the list. (For various English word lists, look at http://wordlist.sourceforge.net/. The SCOWL collection looks promising, as it already has words divided by size.)

## Answer

See source code at [`./exercise-protocols-2.exs`](./exercise-protocols-2.exs)
```
❯ elixir exercise-protocols-2.exs
[
  {"Shane", "Funar"},
  {"tenar", "grane"},
  {"server", "freire"},
  {"green", "terra"},
  {"terra", "green"},
  {"grane", "tenar"},
  {"Funar", "Shane"},
  {"prear", "cerne"},
  {"chave", "punir"},
  {"punir", "chave"},
  {"cerne", "prear"},
  {"freire", "server"}
]
```

---

These were the steps taken to download the Portuguese word list:
1. downloaded https://android.googlesource.com/platform/packages/inputmethods/LatinIME/+archive/master/dictionaries.tar.gz
2. extracted `pt_BR_wordlist.combined` to `files/`
3. ran:
```
cat pt_BR_wordlist.combined | grep -E 'word=[^áéíóúâêôãõç,]{5,8},' | sed -e 's/ word=//' -e 's/,f=.*//' | sort -t, -k2 -rn > all.csv
```
