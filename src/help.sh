include "$KW_LIB_DIR/kwio.sh"

function kworkflow_help()
{
  echo -e "Usage: kw [options]"

  echo -e "\nThe current supported targets are:\n" \
    "\t Host - this machine\n" \
    "\t Qemu - qemu machine\n" \
    "\t Remote - machine reachable via the network"

  echo -e "\nCommands:\n" \
    "\tbd - Build and install modules\n" \
    "\tbuild|b - Build kernel\n" \
    "\tclear-cache - Clear files generated by kw\n" \
    "\tcodestyle,c - Apply checkpatch on directory or file\n" \
    "\tconfigm,g - Manage config files\n" \
    "\tdeploy,d - Deploy a new kernel image to a target machine\n" \
    "\tdiff,df - Diff files\n" \
    "\tdrm - Set of commands to work with DRM drivers \n" \
    "\texplore,e - Explore string patterns\n" \
    "\thelp,h - displays this help mesage\n" \
    "\tinit - Initialize kworkflow config file\n" \
    "\tmaintainers,m - Get maintainers and mailing list\n" \
    "\tman - Show manual\n" \
    "\tmount,mo - Mount partition with qemu-nbd\n" \
    "\tssh,s - SSH support\n" \
    "\tstatistics - Provide basic statistics related to daily development\n" \
    "\tumount,um - Umount partition created with qemu-nbd\n" \
    "\tup,u - Wake up vm\n" \
    "\tvars,v - Show variables\n" \
    "\tversion,--version,-v - show kw version\n"
}

# Display the man documentation using rst2man, or man kw if it is already
# installed to the system
function kworkflow_man()
{
    doc="$KW_SHARE_MAN_DIR"
    ret=0

    if ! man kw > /dev/null 2>&1; then
      if [ -x "$(command -v rst2man)" ]; then
        rst2man < "$doc/kw.rst" | man -l -
        ret="$?"
      else
        complain "There's no man support"
        ret=1
      fi
      exit "$ret"
    fi

    man kw
}

function kworkflow_version()
{
  local version_path="$KW_LIB_DIR/VERSION"

  cat "$version_path"
}
