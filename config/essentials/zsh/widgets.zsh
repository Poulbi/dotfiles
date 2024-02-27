# surround line in variable
surround_in_var()
{
    BUFFER=" \$($BUFFER)"
    zle beginning-of-line
}
zle -N surround_in_var
bindkey '\ev' surround_in_var

