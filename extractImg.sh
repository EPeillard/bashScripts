for f in *.pdf; do
    file=$(basename "$f")
    file="${file%.*}"
    author="${file%% et al.*}"
    author="${author%%, *}"

    date="${file#* - }"
    date="${date%% - *}"

    if [ $author = $date ]
    then
        file=$author
    else
        file=$author$date
    fi

    if [ -e $file ]
    then
        file="${file}a"
    fi

    mkdir "$file"
    pdfimages -j "$f" "$file"/"$file"
    
    mv "${f}" "${file}.pdf"
done
