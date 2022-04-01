#!/usr/bin/env bash
for ((k=0;k<12;k++))
do
    x=()
    for ((i=1;i<50;i++)); do
        x+=("${i}")
    done
    while (( ${#x[@]} > 43 )); do
        i=${x[$((RANDOM % ${#x[@]}))]}
        for j in "${!x[@]}"
        do
            if [[ "${x[$j]}" == "${i}" ]]
            then
                index=${j}
            fi
        done
        eval "r${k}"+="($(printf "%s \n" "${i}"))"
        x=("${x[@]:0:index}" "${x[@]:index+1}")
    done
done

for ((l=0;l<12;l++))
do
    eval echo '${r'"${l}"'[@]}'
done


for ((k=0;k<12;k++))
do
     sortarr+=($(eval echo '${r'"${k}"'[@]}'))
done

sixarr+=($(printf "%s \n" "${sortarr[@]}" \
    | sort \
    | uniq -c \
    | sort -n \
    | tail -n 6 \
    | awk '{print $2}'))

x=()
for ((i=1;i<50;i++)); do
    x+=("${i}")
done

for ((i=0;i<${#sixarr[@]};i++))
do
    s=${sixarr[i]}
    for j in "${!x[@]}"
    do
        if [[ "${x[$j]}" == "${s}" ]]
        then
            index=${j}
        fi
    done
    x=("${x[@]:0:index}" "${x[@]:index+1}")
done

printf "%s \n" "ZWEITE REIHE NIBBA"

for ((k=0;k<12;k++))
do
    y=(${x[@]})
    while (( ${#y[@]} > 37 ))
    do
        i=${y[$((RANDOM % ${#y[@]}))]}
        for j in "${!y[@]}"
        do
            if [[ "${y[$j]}" == "${i}" ]]
            then
                index=${j}
            fi
        done
        eval "o${k}"+="($(printf "%s \n" "${i}"))"
        y=("${y[@]:0:index}" "${y[@]:index+1}")
    done
done

for ((l=0;l<12;l++))
do
    eval echo '${o'"${l}"'[@]}'
done
