
contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

getVersion(){
  branch="$1"
  release="$2"

  echo "Called from branch " $branch
  echo "Last release " $release

  if contains "${release}" "${branch}"
  then
    pepo=$(echo ${release#*$branch} | tr -d '.')
    echo "Output: "$branch.$((pepo+1))
  else
    echo  "False"
    echo "${branch}.0"
  fi
}

getVersion "1.0" "1.0.4"