# moreinfo
Provides information about Raspberry Pi hardware from the device hardware id, including manufacturer, release date and board revision. The script identifies over 50 of the variants available covering a manufacturing period commencing in 2012.

( Age-In-Days branch is piloting approximate age in days feature, useage bash mi.sh -l )

### Why moreinfo?
Works across different variants of OS.  
With numerous Raspberry Pi models and variations deployed it's challenging to understand the maturity of deployed hardware. <strong>moreinfo</strong> provides additional information such as the harware designs release date to permit improved management of legacy Raspberry Pi hardware.

![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/OneOfTheInfiniteMonkeys/moreinfo?include_prereleases)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/OneOfTheInfiniteMonkeys/moreinfo/graphs/commit-activity)
![GitHub](https://img.shields.io/github/license/OneOftheinfinitemonkeys/moreinfo)
![GitHub repo size](https://img.shields.io/github/repo-size/OneOfTheInfiniteMonkeys/moreinfo)
[![made-with-bash](https://img.shields.io/badge/-Made%20with%20Bash-1f425f.svg?logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D)](https://www.gnu.org/software/bash/)
![Raspberry Pi](https://img.shields.io/badge/gadget-Raspberry%20Pi-C51A4A.svg?logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0MCIgaGVpZ2h0PSI0MCIgdmlld0JveD0iMTIgMTIgNDAgNDAiPjxwYXRoIGZpbGw9IiMzMzMzMzMiIGQ9Ik0zMiwxMy40Yy0xMC41LDAtMTksOC41LTE5LDE5YzAsOC40LDUuNSwxNS41LDEzLDE4YzEsMC4yLDEuMy0wLjQsMS4zLTAuOWMwLTAuNSwwLTEuNywwLTMuMiBjLTUuMywxLjEtNi40LTIuNi02LjQtMi42QzIwLDQxLjYsMTguOCw0MSwxOC44LDQxYy0xLjctMS4yLDAuMS0xLjEsMC4xLTEuMWMxLjksMC4xLDIuOSwyLDIuOSwyYzEuNywyLjksNC41LDIuMSw1LjUsMS42IGMwLjItMS4yLDAuNy0yLjEsMS4yLTIuNmMtNC4yLTAuNS04LjctMi4xLTguNy05LjRjMC0yLjEsMC43LTMuNywyLTUuMWMtMC4yLTAuNS0wLjgtMi40LDAuMi01YzAsMCwxLjYtMC41LDUuMiwyIGMxLjUtMC40LDMuMS0wLjcsNC44LTAuN2MxLjYsMCwzLjMsMC4yLDQuNywwLjdjMy42LTIuNCw1LjItMiw1LjItMmMxLDIuNiwwLjQsNC42LDAuMiw1YzEuMiwxLjMsMiwzLDIsNS4xYzAsNy4zLTQuNSw4LjktOC43LDkuNCBjMC43LDAuNiwxLjMsMS43LDEuMywzLjVjMCwyLjYsMCw0LjYsMCw1LjJjMCwwLjUsMC40LDEuMSwxLjMsMC45YzcuNS0yLjYsMTMtOS43LDEzLTE4LjFDNTEsMjEuOSw0Mi41LDEzLjQsMzIsMTMuNHoiLz48L3N2Zz4%3D)

### Target platform
Debian - Raspberry PI

### Installation (or update)
If you don't have GIT installed, install with:  
&nbsp;&nbsp; sudo apt install git

Clone the repository to your Raspberry Pi  
e.g.  
&nbsp;&nbsp; cd ~  
&nbsp;&nbsp; sudo git clone https://github.com/OneOfTheInfiniteMonkeys/moreinfo.git  

### Running
Following installation using the steps detailed in the <strong>Installation section</strong>, a folder will have been created in your home directory which contains the <strong>moreinfo</strong> BASH script.  

To run <strong>moreinfo</strong> script enter the following commands:  
&nbsp;&nbsp; cd ~/moreinfo  
Run the script :  
&nbsp;&nbsp; sudo bash mi.sh  

To update  
&nbsp;&nbsp; cd ~/moreinfo  
run git  
&nbsp;&nbsp; sudo git pull  

### Typical Output
d03114 &nbsp;Q2 2020 4 Model B &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.4 &nbsp;&nbsp;&nbsp;8 GB &nbsp;&nbsp;&nbsp;(Mfg by Sony)  

### Options
moreinfo supports the following command line parameters :  

<table>
  <tr><td>  -a, --additional  </td><td> Output additional information  </td></tr>
  <tr><td>  -e, --everything  </td><td> Output all information, equivalent to -t -l  </td></tr>
  <tr><td>  -l, --limited     </td><td> Ouptut More-Info data in table format only  </td></tr>
  <tr><td>                    </td><td> Includes status of Over Voltage setting, which is recorded against the version number  </td></tr>
  <tr><td>  -nt, --notabs     </td><td> Single line output ( i.e. exclude tables ) has no tabs in the output string  </td></tr>
  <tr><td>  -t, --table       </td><td> Ouptut a formatted table of source data. Equivalent to 'cat /proc/cpuinfo  </td></tr>
</table>

### Commands
<table>
  <tr><td>-h, --help, -?     </td><td> Displays this help and exits </td></tr>
  <tr><td>-v, --version      </td><td> Displays version information for ${App_Name} and exits </td></tr>
  <tr><td>                   </td><td> < Application Name > < Command > < Revision > ( < Date {yyyy-mm-dd} {hh:mm} > ) </td></tr>
</table>
  
### Output Explanation  
A typical output from moreinfo is shown below for a Raspberry Pi Model 4 B with 8Gb of memory:  
d03114&nbsp;  Q2 2020 4 Model B &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.4 &nbsp;&nbsp;&nbsp;&nbsp;8 GB &nbsp;&nbsp;&nbsp;(Mfg by Sony)  

The line consists of the following information :
<table>
  <tr><td> Device code   </td><td> d03114         </td></tr>
  <tr><td> Release date  </td><td> Q2 2020        </td></tr>
  <tr><td> Model         </td><td> 4 Model B      </td></tr>
  <tr><td> Board version </td><td> 1.4            </td></tr>
  <tr><td> Memory size   </td><td> 8 GB           </td></tr>
  <tr><td> Manufacturer  </td><td> (Mfg by Sony)  </td></tr>
</table>
    
The information reported is based on the 'Device code' identifier.

### Table Output Example:  
moreinfo will output a table when the command line optional parameter -l is used :  
<table>
  <tr><td> Rel. Date      </td><td> Q2 2020 </td></tr>
  <tr><td> Rel. Model     </td><td> 4 Model B </td></tr>
  <tr><td> Rel. PCB Rev   </td><td> 1.4 </td></tr>
  <tr><td> Rel. Mem       </td><td> 8 GB </td></tr>
  <tr><td> Rel. Manf.     </td><td> (Mfg by Sony) </td></tr>
  <tr><td> Rel. Voltage   </td><td> Clear </td></tr>
</table>
  
  
### Note
<strong>moreinfo</strong> can be placed in any folder, the functional elements of the software comprise the files:   
&nbsp;&nbsp; mi.sh   
&nbsp;&nbsp; raspi-boards.txt   
  
Alternatives to moving or copying the scripts files are possibly:   
&nbsp;&nbsp; Create <a href="https://wiki.debian.org/SymLink" target="misl">symbolic links</a> to the <strong>moreinfo</strong> script mi.sh and raspi-boards.txt file.   
&nbsp;&nbsp;&nbsp;&nbsp; or   
&nbsp;&nbsp; Place the location of <strong>moreinfo</strong> in the <a href="https://wiki.debian.org/path" target="mipa">PATH</a> by editing the <strong>.profile</strong> file in the users home directoy.   

### Trademarks, Affiliations, Information Provenance
Trademarks are owned by their respective holders.  
No affiliation or association is implied or should be inferred with any organisation.  
Information is provided for <strong>Indication Only</strong>.
