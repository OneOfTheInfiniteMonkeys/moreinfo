#!/bin/bash
#---------><--------><--------><--------><--------><--------><--------><-------->
# Author            : OneOfTheInfinteMonkeys
# Revision          : 1.0
# Date              : 14 June 2020
# License           : MIT
#-------------------:
# Comments          : Recover Raspberry Pi board version and return additional release information
#                   : Additional information is manufacturer and date of manufacture etc.
#                   : Default output returned is a string with tabs
#                   :
#                   : The supporting reference file 'raspi-boards.txt' has the following format:
#                   : Revision<T>Release Date<T>Model<T>PCB Revision<T>Memory<T>Manufacturer
#                   : An optional table ouptut format can be selected
#-------------------:
# Requires          : raspi-boards.txt in the same folder as this script
#--------------------------------------------------------------------------------
#
readonly App_version="01.00"                                                     # App version
readonly App_date="2020-06-14"                                                   # App release date
readonly App_time="00:00:00"                                                     # App release time
readonly App_Name="More-Info"                                                    # Default application name

#---------------------------------------
# Requirements for tests performed in the script
#---------------------------------------
readonly req_bashversion=4                        # Equal or greater than      - expressed as a version
readonly req_userlevel=1000                       # Equal to                   - expressed as a user level
readonly req_osversion=10                         # Equal or greater than      - expressed as a version

#---------------------------------------
# Set defaults for any Command Line Parameters
#---------------------------------------
cmd_additional="n"                                # Don't output additional detection information
cmd_table="n"                                     # Don't output a formaated text table of results
cmd_limited="n"                                   # Don't output a limtied list of resutls from More Information
cmd_notabs="n"                                    # Don't remove tabs from output string

#---------------------------------------
# Process Command Line Parameters
#---------------------------------------
PROG=${0##*/}                                     # Get script name to reporting in help as script may be adapted for other installs
# Now see if a cry for 'help' was issued giving it absolute priority, even if other paramters were passed
while [[ $# -gt 0 ]]; do
    case "$1" in
         -a|--additional)
            printf " - Additional information will be output during running\n"
            cmd_additional="y"
            ;;
         -e|--everything)
            cmd_limited="y"
            cmd_table="y"
            ;;
        -l|--limited)
            cmd_limited="y"
            ;;
         -nt|--notabs)
            cmd_notabs="y"
            ;;
         -t|--table)
            cmd_table="y"
            ;;
        -v|--version)
            printf "${App_Name} ${PROG} ${App_version} (${App_date} ${App_time})\n"
            exit 0
            ;;
        -h|--help|-?)
            printf " Usage: ${PROG} [OPTION...] [COMMAND]...\n"
            printf " Options:\n"
            printf "   -a, --additional       Output additional information\n"
            printf "   -e, --everything       Output all information, equivalent to -t -l\n"
            printf "   -l, --limited          Ouptut ${App_Name} data in table format only\n"
            printf "                          Includes status of Over Voltage setting, which is recorded against the version number\n"
            printf "   -nt, --notabs          Single line output (i.e. exclude tables) has no tabs in the output string\n"
            printf "   -t, --table            Ouptut a formatted table of source data. Equivalent to 'cat /proc/cpuinfo'\n"
            printf " Commands:\n"
            printf "   -h, --help, -?         Displays this help and exits\n"
            printf "   -v, --version          Displays version information for ${App_Name} and exits\n"
            printf "                          <Application Name> <Command> <Revision> (<Date {yyyy-mm-dd} {hh:mm}>)\n"
            printf " Examples:\n"
            printf "   $PROG -h \n"
            printf "   $PROG -a \n"
            printf "\n"
            exit 0
            ;;
         *)
            printf "      - Unrecognised option\n"
            exit 0
            ;;
    esac # End of case
    shift
done # End of While command line options
#---------------------------------------


#---------------------------------------
# Verify BASH Major version
#---------------------------------------
# Raspberry Pi Bash version level check
bashversion=${BASH_VERSINFO[0]}
if [[ $bashversion -ge $req_bashversion ]]; then
     # Bash version is satisfactory
     ResStatus="1"
else
     # Bash version is too low
     ResStatus="0"
fi

if [[ $ResStatus = "0" ]] && [[$cmd_additional = "y"] ; then
     printf "\r"
     printf " - Installed BASH version is not compatible with this script.\n"
     printf " - Ensure running on Raspbian Buster with BASH ${req_bashversion}\n"
     printf "\n"
     printf "  Script execution terminated.\n"
     exit 1
elif [[ $cmd_additional = "y" ]]; then
     printf "\r"
#           "012345678901234567890123456789"
     printf " - Detected BASH Version     : ${bashversion}\n"
fi
#---------------------------------------


#---------------------------------------
# Verify operating system version
#---------------------------------------
# Get operating system version, stripping out any NULL characters

osversion=$(tr -d '\0' </etc/debian_version)
osversion=${osversion%.*}
# We don't support older operating system versions
if [[ $osversion -ge $req_osversion ]]; then
    # O/S is suitable
    ResStatus="1"
else
    # OS is probably not suitable
    ResStatus="0"
fi

if [[ $ResStatus = "0" ]] && [[ $cmd_additional = "y" ]] ; then
     printf "\r" 
     printf " - Installation requires Debian version ${req_osversion} minimum.\n"
     printf " - Upgrade or install compatible operating system.\n"
     printf "\n"
     printf " - Script execution terminated.\n"
     exit 1
elif [[ $cmd_additional = "y" ]] ; then
     printf "\r" 
#           "012345678901234567890123456789"
     printf " - Debian O.S. version       : ${osversion}\n"
fi
#---------------------------------------


board_str=$(cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}')             # Expects a string in the form 'Revision        : 9000c1'

if [[ $cmd_additional = "y" ]]; then                                            # If additional information requested ouput source Revision string
#        "012345678901234567890123456789"
  printf " - Raw Revision string       : ${board_str}\n"
fi

board_mfv=$(printf '%s' "${board_str}" | grep -c '^1000')                       # returns 0 for warranty string clear and 1 for warranty string detected - note numberboard_str="10009000c1"

board_revision=${board_str##"1000"}                                             # remove any over voltage indication text
board_info=$(grep $board_revision raspi-boards.txt)

if [[ $cmd_additional = "y" ]]; then                                            # If additional information requested ouput source Revision string
#        "012345678901234567890123456789"
  printf " - Raw boards string         : ${board_info}\n"
fi

Rfd=$(printf '%s' "${board_info}" | awk 'BEGIN{ FS=OFS="\t" } {print $2}')
Rod=$(printf '%s' "${board_info}" | awk 'BEGIN{ FS=OFS="\t" } {print $3}')
RRv=$(printf '%s' "${board_info}" | awk 'BEGIN{ FS=OFS="\t" } {print $4}')
Rmm=$(printf '%s' "${board_info}" | awk 'BEGIN{ FS=OFS="\t" } {print $5}')
Rmn=$(printf '%s' "${board_info}" | awk 'BEGIN{ FS=OFS="\t" } {print $6}')

Rfv="Unknown"                                                                   # Default condition of over voltage indication
if [[ $board_mfv = 0 ]] ; then                                                  # Set string for reporting assesment of over voltage (over clocking) warranty
  Rfv="Clear"
else
  Rfv="Set"
fi

#---------------------------------------
# Ouptuts
#---------------------------------------
# formatted table outputs

if [[ $cmd_table = "y" ]] || [[ $cmd_limited = "y" ]] ; then                    # No table data was selected for output if both set to n
  # Output was requested on the command line
  #       012345678901234567890
  if [[ $cmd_table = "y" ]] ; then                                              # -t set so output all data including local data
    cat /proc/cpuinfo
    printf "\n"
  fi

  if [[ $cmd_limited = "y" ]] ; then                                            # -t set so output all data including local data
    printf "Rel. Date       : ${Rfd}\n"
    printf "Rel. Model      : ${Rod}\n"
    printf "Rel. PCB Rev    : ${RRv}\n"
    printf "Rel. Mem        : ${Rmm}\n"
    printf "Rel. Name       : ${Rmn}\n"
    printf "Rel. Voltage    : ${Rfv}\n"
  fi

else                                                                            # not a table output section

  if [[ $cmd_notabs = "n" ]] ; then
    printf "${board_info}\n"                                                    # Standard single line outputis the default
  else
    printf "${board_info//$'\t'/ }\n"                                           # Standard single line output - with no tabs in it
  fi

fi                                                                              # End of output formatting
