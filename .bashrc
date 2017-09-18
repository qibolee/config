# .bashrc

#export PS1='\[\u@\H:\w\]\n\$ '

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi
[[ -f /etc/bashrc ]] && source /etc/bashrc

alias clr="clear"
alias clg="clang"
alias clg++="clang++ -std=c++14"
alias awkf="awk -F '\t'"
alias wcl="wc -l"
alias ll="ls -lah"


[[ -s "/home/liqibo/.jumbo/etc/bashrc" ]] && source "/home/liqibo/.jumbo/etc/bashrc"

# User specific aliases and functions

source ~/xhrc
source ~/.tmux.conf

# hadoop
nmg_hadoop="/home/liqibo/software/hadoop-client-nmg/hadoop/bin/hadoop"
thang_hadoop="/home/liqibo/software/hadoop-client-taihang/hadoop/bin/hadoop"
mulan_hadoop="/home/liqibo/software/mulan-hadoop-client/hadoop/bin/hadoop"
alias nmg_hadoop='/home/liqibo/software/hadoop-client-nmg/hadoop/bin/hadoop'
alias thang_hadoop='/home/liqibo/software/hadoop-client-taihang/hadoop/bin/hadoop'
alias mulan_hadoop="/home/liqibo/software/mulan-hadoop-client/hadoop/bin/hadoop"
alias hdfskhan='nmg_hadoop fs'
alias hdfsthang='thang_hadoop fs'
alias hdfsmulan="mulan_hadoop fs"

function fpath(){                                                                   
    for file in "$@"                                                                
    do                                                                              
        if [[ -e "$file" ]]                                                         
        then                                                                        
            echo "ftp://"`hostname`:`readlink -f "$file"`                                   
        else                                                                        
            echo "can NOT find $file"  >&2                                          
        fi                                                                          
    done                                                                            
}          
function wpath(){                                                                   
    for file in "$@"                                                                
    do                                                                              
        if [[ -f "$file" ]]                                                         
        then                                                                        
            echo `hostname`:`readlink -f "$file"`                                   
        else                                                                        
            echo "can NOT find $file"  >&2                                          
        fi                                                                          
    done                                                                            
}          

