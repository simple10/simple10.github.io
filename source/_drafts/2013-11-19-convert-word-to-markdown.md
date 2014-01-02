Useful hack for converting word docs to markdown or haml.

Requires textutil on OSX and pandoc for markdown or html2haml gem for haml.

```bash
# Install pandoc on OSX
brew install haskell-platform
cabal update
cabal install pandoc

# textutil should already be installed

# For haml, install ruby then install html2haml gem
gem install html2haml
```

# Convert to Markdown

```bash
textutil -convert html file.doc -stdout | pandoc -f html -t markdown -o file.md
```

# Convert to Haml

```bash
textutil -convert html file.doc -stdout | html2haml -s file.haml
```
