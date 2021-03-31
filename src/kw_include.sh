# Used for file sourcing,
# accepts as argument the path for the file to be sourced
function include()
{
  local filename="$1"
  local varname=$(basename "$filename")
  varname=${varname//\./_} # remove dots
  varname=${varname##*/} # remove path so that only base name remains
  varname=${varname^^}_IMPORTED # capitalize and append "_IMPORTED"

  if [[ -v "${varname}" ]]; then
    return 0
  else
    printf -v "${varname}" '%s' "1"
    . "$filename" --source-only # can return 0, 1 or 2
  fi
}
