export GITHUB_USER="lilyminium"

function help {
    for cmd in getpr gclone gupstream ; do
        echo "$cmd" && eval $cmd && echo ""
    done
}

function getpr {
    if [[ $# -eq 0 ]]; then
        printf "usage: getpr pr [new-branch-name] [remote-source]\nFetch and check out a pull request by ID\n"
        return
    fi

    pr=$1
    src=${2:-upstream}
    branchname="pr${pr}"
    cmd="git fetch $src pull/${pr}/head:${branchname}"
    echo "    $cmd\n    Press y to continue." 
    read toexe
    case $toexe in
        [Yy]* ) eval ${cmd} ;;
    esac
    echo "    Check out ${branchname}?\n    Press y for yes."
    read tocheck
    case $tocheck in
        [Yy]* ) git checkout $branchname;;
    esac
}

function gupstream {
    if [[ $# -eq 0 ]]; then
        printf "usage: gupstream username [repo] [name]\nAdd upstream as remote.\n"  # help
        return
    elif [[ $# -eq 1 ]]; then
        repo=$(basename $(pwd))
        name=upstream
    elif [[ $# -eq 2 ]]; then
        repo=$2
        name=upstream
    elif [[ $# -eq 3 ]]; then
        repo=$2
        name=$3
    fi

    user=$1
    
    cmd="git remote add $name git@github.com:${user}/${repo}.git"
    echo "      $cmd\n      Press y to continue."
    read toexe
    case $toexe in
        [Yy]*) eval ${cmd} ;;
    esac
}

function gclone {
    # argparse?
    if [[ $# -eq 0 ]]; then
        printf "usage: gclone [user] repo [dest]\nClone repos from Github.\n"  # help
        return
    elif [[ $# -eq 1 ]]; then
        user=$GITHUB_USER
        repo=$1
    elif [[ $# -eq 2 ]]; then
        user=$1
        repo=$2
    fi
    
    cmd="git clone git@github.com:${user}/${repo}.git ${@:3}"
    echo "      $cmd\n      Press y to continue."
    read toexe
    case $toexe in
        [Yy]*) eval ${cmd} ;;
    esac
}