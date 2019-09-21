> **Preface:** This is my solution to a coding challenge I was given by an employer for a Senior Ruby Developer position. Their response was that I nailed it. At the in-person interview, we reviewed my code against their solution, and the structure was nearly identical, showing I followed the same development principles their developers had used with Test-Driven Development.

[![CircleCI](https://circleci.com/gh/patrickclery/lendesk/tree/master.svg?style=svg)](https://circleci.com/gh/patrickclery/lendesk/tree/master)

# Description

Finds all images in a given directory, extracts their GPS info, then dumps that along with the filename into a CSV or HTML file.

```
Usage: application.rb [options]
        --html                       Output in HTML format (default is CSV)
    -o, --output-file=FILE           File to output to. (Default: 'results.{csv,html}')
    -d, --target-directory=DIR       Target directory to scan for JPG files. (Default: current directory)
    -h, --help                       Prints this help
```

# Examples

Scan all the images in the current directory and output them to results.csv in CSV format
 
```sh
ruby ./application.rb
```
or

```sh
./application.rb
```

Scan all the images in _/some/directory_ and output the results to _~/results.html_
```sh
./application.rb -d /some/directory --html -o ~/results.html 
```
