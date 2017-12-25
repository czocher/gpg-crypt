# Encrypt the given file or directory to a given recipient
function gpg-encrypt() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 FILE/DIRECTORY RECIPIENT" >&2
    return 1
  fi

  tar -c `basename $1` | gpg --encrypt --recipient $2 -o `basename $1`.tar.gpg
}

# Decrypt the given tar.gpg file
function gpg-decrypt() {
  if [ "$#" -ne 1  ] || [[ "$1" != *.tar.gpg ]]; then
    echo "Usage: $0 FILE.tar.gpg" >&2
    return 1
  fi

  gpg --quiet --decrypt $1 | tar -x
}
