```
usage: tochd [-h] [--version] [--list-examples] [--list-formats] [--list-programs] [--7z CMD] [--chdman CMD]
             [-d DIR] [--temp-dir TEMP_DIR] [-R] [-p] [-t NUM] [-c NUM] [-m DISC] [-H BYTES] [-q] [-n] [-s] [-E]
             [-X] [-]
             [file ...]

Convert game ISO and archives to CD/DVD CHD for emulation.

positional arguments:
  file                  input multiple files or folders containing ISOs or archive files, script will search for
                        supported files in top level of a folder, a single dash "-" character will instruct the
                        script to read file paths from stdin for each line, note: option double dash "--" will
                        stop parsing for program options and everything following that is interpreted as a file

options:
  -h, --help            show this help message and exit
  --version             print version and exit
  --list-examples       print usage examples and exit
  --list-formats        list all supported filetypes and extensions and exit
  --list-programs       list name and path of all found programs and exit
  --7z CMD              change path or command name to 7z program
  --chdman CMD          change path or command name to chdman program
  -d, --output-dir DIR  destination path to an existing directory to save the CHD file under, defaults to each
                        input files' original folder
  --temp-dir TEMP_DIR   destination path to an existing directory to extract archives to, all temporary
                        subfolders for each job are created and deleted here, leading dot is added only if no
                        path is given, defaults to each input files' original folder
  -R, --no-rename       disable automatic renaming for CHD files that were build from archives, no test for "if
                        file already exists" can be provided beforehand, only applicable to archive sources,
                        without this option files from archives are renamed to match the archive
  -p, --parallel        activate multithreading to process multiple files at the same time, hides progress bar
                        and stderr stream from invoked commands, but stdout is still output, automates user input
                        when possible, set number of threads with option "-t"
  -t, --threads NUM     max number of threaded processes to run in parallel, requires option "-p" to be active,
                        "0" is count of all cores (available: 8), defaults to "2"
  -c, --chd-processors NUM
                        limit the number of processor cores to utilize during creation of the CHD files with
                        "chdman" for each thread, 0 will not limit the cores (available: 8), defaults to "0"
  -m, --mode DISC       disc format to create, available formats are "cd" or "dvd", or use "auto" to determine
                        format based on filesize (750 MB threshold), some systems or emulators perform better
                        with DVD format, defaults to "cd"
  -H, --hunksize BYTES  size of each hunk in bytes for conversion with chdman, normally this setting is not
                        needed to be set, but for special cases it can be specified to overwrite default values
                        of chdman, example values are "2048" and "4096"
  -q, --quiet           supress output from external programs, print job messages only, automate user input when
                        possible
  -n, --names           shorten output path as filename only for each printed job message
  -s, --stats           display additional stats, such as the elapsed time and a final summary
  -E, --emergency-break
                        Ctrl+c (SIGINT) will cancel all jobs and stop script execution with exit code 255, all
                        temporary files and folders should be removed automatically, without this option script
                        defaults to canceling current job only and move on to next
  -X, --dry-run         do not execute the conversion or extraction commands, list the jobs and files only that
                        would have been processed
  -                     read files from stdin for each line, additionally break up lines containing any newline
                        character "\n"

Copyright © 2022, 2024 Tuncay D. <https://github.com/thingsiplay/tochd>
```
