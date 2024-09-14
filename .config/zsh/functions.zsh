function gac() {
    git add .
    git commit -m $1
}

function brain() {
    mkdir -p .brain
    for file in *.org; do
        pandoc "$file" -o ".brain/${file%.md}.pdf"
    done
}
