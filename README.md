# Apollo ZSH Theme

Heavily customizable, compatible, and performant zsh theme.

## Table of Contents

   * [Apollo ZSH Theme](#apollo-zsh-theme)
      * [Table of Contents](#table-of-contents)
      * [Installation](#installation)
         * [Zplugin](#zplugin)
         * [Prezto](#prezto)
         * [Oh-My-Zsh](#oh-my-zsh)
         * [Manual install](#manual-install)
      * [Features](#features)
      * [Usage](#usage)
      * [Configuration](#configuration)
         * [Core Options](#core-options)
            * [Module Declaration](#module-declaration)
            * [Decorations](#decorations)
            * [Links](#links)
            * [Rulers](#rulers)
            * [Prompt End](#prompt-end)
            * [Caching](#caching)
            * [Profiler](#profiler)
         * [Modules](#modules)
         * [Syntax](#syntax)
         * [Options provided to all modules by framework:](#options-provided-to-all-modules-by-framework)
         * [Module List](#module-list)
            * [background_jobs](#background_jobs)
            * [clock](#clock)
            * [command_execution_time](#command_execution_time)
            * [context](#context)
            * [date](#date)
            * [dir](#dir)
            * [game](#game)
            * [git](#git)
            * [php_version](#php_version)
            * [public_ip](#public_ip)
            * [quota](#quota)
            * [root_indicator](#root_indicator)
            * [status](#status)
            * [vcs](#vcs)
            * [vi_mode](#vi_mode)
            * [virtualenv](#virtualenv)
      * [Contributing](#contributing)
      * [FAQ](#faq)
      * [Support](#support)
      * [Acknowledgments](#acknowledgments)
      * [License](#license)

## Installation


### Zplugin

```shell
zplugin ice lucid atinit'fpath+=($PWD/functions.zwc $PWD/functions $PWD/modules.zwc $PWD/modules)'
zplugin light mjrafferty/apollo-zsh-theme
```


### Prezto

```shell
```


### Oh-My-Zsh

```shell
```


### Manual install

```shell
fpath+=( $HOME/apollo-zsh-theme/functions $HOME/apollo-zsh-theme/modules )
autoload -Uz promptinit && promptinit
source apollo-zsh-theme/conf/theme.conf
prompt apollo
```


## Features


## Usage


## Configuration

The prompts are made up of a combination of modules, and each module is made up of one or more elements. There are elements available to every module, as well as elements specific to certain modules. Both the modules and the elements that they contain each have access to a variety of attributes to define them. There are a number of attributes available to every module/element, as well as module specific ones.

All configuration is done using zstyle's. This offers tremendous context aware flexibility as well as wildcards to set attributes for a variety of matching modules/elements. Zstyle is provided by the zsh/zutil module and you can read more about it in the zshmodules man page.

Below I'll go over all of the available configuration options. For all of the examples given, I'll be using a theme name of "example".


### Core Options

#### Module declaration

These two options decide what information will be in your prompt and where it will be located. Modules are displayed in the order they are defined. For multiline prompts, add "newline" or "ruler" to list to signal end of line. Prompts can be any number of lines. Note that right prompt does not use "ruler" and the total number of "newline" in right prompt should be less than or equal to the total number of "newline" and "ruler" in left prompt to prevent modules from not being displayed.

Option|Type|Description
---|---|---
zstyle ':apollo:example:core:modules:left' modules|list|Defines what and where items are displayed in left prompt
zstyle ':apollo:example:core:modules:right' modules|list|Defines what and where items are displayed in right prompt


Examples:
```shell
zstyle ':apollo:example:core:modules:left' modules 'virtualenv' 'quota' 'public_ip' 'newline' 'root_indicator' 'context' 'dir' 'git' 'vi_mode' 'ruler'
zstyle ':apollo:example:core:modules:right' modules 'command_execution_time' 'background_jobs' 'date' 'clock' 'status' 'newline' 'php_version'
```


#### Decorations

Line begin/end and separator elements are considered to be decorations. They should typically be enabled, but if they aren't being used and you really need to shave a few milliseconds off of prompt rendering they can be disabled.

Option|Type|Description
---|---|---
zstyle ':apollo:example:core:decorations' enabled|boolean|Enable module begin/end and separator elements

Examples:
```shell
zstyle ':apollo:example:core:decorations' enabled "true"
```


#### Links

Dynamic links added to prompt line ends to join lines together. These get processed on every prompt render, but have little to no effect on performance. However, if they are not used anyway, they can be disabled. The string to use for each link type is configurable, and can also be unique per side and per prompt line.

Option|Type|Description
---|---|---
zstyle ':apollo:example:core:links' enabled|boolean|Enable line links
zstyle ':apollo:example:core:links:\<line\>:\<side\>:\<link_type\>' text|string|String to use for matching links

Link Type|Description
---|---
top|Top link if line has content
mid|Middle link if line has content
str|Middle link if line has NO content
bot|Bottom link
none|Link if line has no content, and lines above have no content

Examples:
```shell
zstyle ':apollo:example:core:links' enabled "true"
zstyle ':apollo:example:core:links:*:*:*' fg_color "white"
zstyle ':apollo:example:core:links:*:*:*' style "bold"
zstyle ':apollo:example:core:links:*:left:top' text "╭─"
zstyle ':apollo:example:core:links:*:left:mid' text "├─"
zstyle ':apollo:example:core:links:*:left:str' text "│ "
zstyle ':apollo:example:core:links:*:left:bot' text "╰─"
zstyle ':apollo:example:core:links:*:right:top' text "─╮"
zstyle ':apollo:example:core:links:*:right:mid' text "─┤"
zstyle ':apollo:example:core:links:*:right:str' text " │"
zstyle ':apollo:example:core:links:*:right:bot' text "─╯"
zstyle ':apollo:example:core:links:*:*:none' text ""
```


#### Rulers

Rulers can be used in multiline prompts to bridge the left and right prompt. The text for these can be made up of strings of any length. Depending on terminal width, the string will be repeated as needed, and will resize with termainal window size changes. Rulers can be configured to be unique on each prompt line.

Option|Type|Description
---|---|---
zstyle ':apollo:example:core:\<line\>:ruler' text|string|Text to use as ruler for matching lines

Examples:
```shell
zstyle ':apollo:example:core:*:ruler' style "bold"
zstyle ':apollo:example:core:*:ruler' fg_color "white"
zstyle ':apollo:example:core:*:ruler' text "─"
```


#### Prompt End

This is the text displayed at the very end of the left prompt after all modules.

Option|Type|Description
---|---|---
zstyle ':apollo:example:core:prompt:end' text|string|Text to display at very end of left prompt

Examples:
```shell
zstyle ':apollo:example:core:prompt:end' text "> "
zstyle ':apollo:example:core:prompt:end' fg_color "white"
```


#### Caching

Many modules are cached based on parameters determined by the module. For the most part this should not require any additional thought for the user, however the user may want to clear cached values on occasion. For instance if a user changes networks, the cache for public_ip may not be accurate. To force a refresh, users can hit enter a configurable number of times in order to clear module cache and force a refresh. This behavior can be disabled, and caching can also be disabled all together if desired.

Option|Type|Description
---|---|---
zstyle ':apollo:example:core:cache' disable|boolean|Disable caching
zstyle ':apollo:example:core:cache:clear' disable|boolean|Disable clearing of cache
zstyle ':apollo:example:core:cache:clear' count|integer|Number of enter presses needed to clear cache

Examples:
```shell
zstyle ':apollo:example:core:cache' disable "true"
zstyle ':apollo:example:core:cache:clear' disable "true"
zstyle ':apollo:example:core:cache:clear' count "3"
```


#### Profiler

This tool is primarily only useful for module development, but if you find your prompt is slow to render it can be used to identify which module is responsible. When enabled, each prompt render will output the module run times to the screen.

Option|Type|Description
---|---|---
zstyle ':apollo:example:core:profiler' enabled|boolean|Enable module profiler

Examples:
```shell
zstyle ':apollo:example:core:profiler' enabled "true"
```


### Modules

Module Name|Description
---|---
[background_jobs](#background_jobs)|Dispaly number of jobs in background
[clock](#clock)|Displays current time
[command_execution_time](#command_execution_time)|Execution time of last command
[context](#context)|User and hostname
[date](#date)|Today's date
[dir](#dir)|Current directory
[game](#game)|Slots game
[git](#git)|Git repository information
[history](#history)|History number
[php_version](#php_version)|PHP version number from php --version
[public_ip](#public_ip)|Public IP address
[quota](#quota)|Disk quota warnings
[root_indicator](#root_indicator)|Root status
[status](#status)|Exit status of last command
[vcs](#vcs)|Version control information from vcs_info
[vi_mode](#vi_mode)|Vi mode indicator when using vi key bindings
[virtualenv](#virtualenv)|Active Python virtual environment
newline*|For multiline prompts, signals end of line in module array
ruler**|Same as newline, but finishes line with configurable ruler string. Not useful in right prompt

  \* These are not actual modules and therefore most of the options below do not apply.


### Syntax

All configuration is done using zstyles. Zstyle definitions assign a value to an attribute based on context, and the flexibility of this context is what makes it so useful. Below is a guide to describe the strucutre of context within Apollo.

```
zstyle ':apollo:<theme>:<line>:<prompt_side>:<module>:<mode>::<element>:<element/module_side>' attribute "value"
                   ^      ^        ^            ^        ^         ^              ^                ^
                   |      |        |            |        |         |              |                Attribute name
                   |      |        |            |        |         |              |
                   |      |        |            |        |         |              left or right side of module/element text if applicable. * for both
                   |      |        |            |        |         |
                   |      |        |            |        |         Subsection of module. Possibly module specific.
                   |      |        |            |        |
                   |      |        |            |        Module mode. Value of * applies to all modes
                   |      |        |            |
                   |      |        |            Module name. Value of * applies to all modules
                   |      |        |
                   |      |        left or right prompt. * for both
                   |      |
                   |      Prompt line number. * for all lines
                   |
                   Active theme or * for all themes
```


### Options provided to all modules by framework

Every module has the following attributes available:

Attribute|Type|Description
---|---|---
width|integer|Minimum width to enforce on module.
always_show|boolean|Show module even when it contains empty output.
fg_color|color|Foreground color for module.
bg_color|color|Background color for module.
style|list|Style for module text (bold,standout,underline)


All modules include the following elements provided by the framework:

Element|Description
---|---
separator|String to use as left module separator when NOT at beginning of line
begin|String to use to left of module when at beginning of line
end|String to use to right of module when at end of line
left:surround|String to left of module text
right:surround|String to right of module text

Two special elements can be set at the module level *AND* as extensions of individual regular elements:

Element|Description
---|---
left:label|String to left of module/element
right:label|String to right of module/element

To better understand how these all fit together, here's a quick reference. The first is a look at the module as a whole, the second is a closer breakdown of module_text, which is made up of the elements inside the module:

```
{separator/begin}{left:surround}{left:label}{module_text}{right:label}{right:surround}{end}
```

```
{left:label}{element1_text}{right:label}{left:label}{element2_text}{right:label}{etc...}
```

Every element has the following attributes available:

Attribute|Type|Description
---|---|---
fg_color|color|Foreground color
bg_color|color|Background Color
text|string|String to display
style|list|Style for element text (bold,standout,underline)
blend*|boolean|Determines fg_color and bg_color from adjacent modules.
revblend*|boolean|Determines fg_color and bg_color from adjacent modules. Reversed colors compared to blend

  \*Overrides fg_color and bg_color. Only valid for begin/end and separator elements.

The "text" attribute will not have an effect in many cases if the text is dynamic and generated by the module, but any elements with static text may utilize the "text" attribute.

All other module options should be controlled via attributes at the module scope, even if they only impact an individual element in the module. This is done for the sake of providing a uniform configuration interface.

Examples:
```shell
zstyle ':apollo:example:*:*:*:*:surround:*' text " "

zstyle ':apollo:example:*:right:*:*:separator' text ""
zstyle ':apollo:example:*:right:*:*:separator' revblend "true"
zstyle ':apollo:example:*:left:*:*:separator' text ""
zstyle ':apollo:example:*:left:*:*:separator' blend "true"

zstyle ':apollo:example:*:*:*:*:begin' blend "true"
zstyle ':apollo:example:*:*:*:*:begin' text ""
zstyle ':apollo:example:*:*:*:*:end' blend "true"
zstyle ':apollo:example:*:*:*:*:end' text ""
```


### Module List

#### background_jobs

Examples:
```shell
zstyle ':apollo:example:*:*:background_jobs:*' always_show "true"
zstyle ':apollo:example:*:*:background_jobs:*' fg_color "white"
zstyle ':apollo:example:*:*:background_jobs:*' bg_color "cyan"
zstyle ':apollo:example:*:*:background_jobs:*:left:label' text "Jobs: "
```


#### clock

Element|Description
---|---
12hour|
24hour|
min|
sec|
ampm|
timezone|

Attribute|Type|Description
---|---|---
elements|list|
live|boolean|
verbose|boolean|

Examples:
```shell
zstyle ':apollo:example:*:*:clock:*' elements "12hour" ":" "min" ":" "sec" " " "ampm" " " "timezone"
zstyle ':apollo:example:*:*:clock:*' verbose "true"
zstyle ':apollo:example:*:*:clock:*' live "true"
zstyle ':apollo:example:*:*:clock:*' fg_color "white"
zstyle ':apollo:example:*:*:clock:*' bg_color "darkgreen"
zstyle ':apollo:example:*:*:clock:*' style "bold"
```


#### command_execution_time

Attribute|Type|Description
---|---|---
min_duration|integer|
precision|integer|

Examples:
```shell
zstyle ':apollo:example:*:*:command_execution_time:*' fg_color "white"
zstyle ':apollo:example:*:*:command_execution_time:*' bg_color "navy"
zstyle ':apollo:example:*:*:command_execution_time:*' precision "2"
zstyle ':apollo:example:*:*:command_execution_time:*' min_duration "1"
```


#### context

Mode|Description
---|---
ssh|
sudo|

Element|Description
---|---
user|
host|
sep|

Attribute|Type|Description
---|---|---
ignore_hosts|list|
ignore_users|list|

Ignore multiple hosts or users matching array of basic regex values:

Examples:
```shell
zstyle ':apollo:example:*:*:context:*' fg_color "white"
zstyle ':apollo:example:*:*:context:*' bg_color "navy"
zstyle ':apollo:example:*:*:context:default' ignore_users ".*matt.*" ".*raff.*" "root"
zstyle ':apollo:example:*:*:context:ssh' ignore_users ".*matt.*" ".*raff.*" "root"
zstyle ':apollo:example:*:*:context:sudo' ignore_users "root"
zstyle ':apollo:example:*:*:context:*default' ignore_hosts ".*"
zstyle ':apollo:example:*:*:context:sudo' ignore_hosts ".*"
zstyle ':apollo:example:*:*:context:*:sep' text "@"
```


#### date

Element|Description
---|---
dow|
dom|
month|
year|

Attribute|Type|Description
---|---|---
elements|list|
verbose|boolean|

Extra formatting characters like comma space and slash are allowed as "elements" in the array

Examples:
```shell
zstyle ':apollo:example:*:*:date' elements "dow" " " "day" "/" "month" "/" "year"
zstyle ':apollo:example:*:*:date:*:dow' verbose "true"
zstyle ':apollo:example:*:*:date:*' elements "dow" " " "month" " " "day"  ", " "year"
zstyle ':apollo:example:*:*:date:*' fg_color "white"
zstyle ':apollo:example:*:*:date:*' bg_color "blue"
zstyle ':apollo:example:*:*:date:*' verbose "true"
```


#### dir

Mode|Description
---|---
readonly|

Element|Description
---|---
element|
last|
shortened|

Attribute|Type|Description
---|---|---
absolute|boolean|
bookmarks|list|
bookmark_patterns|list|
shorten_length|integer|
shorten_string|string|

Examples:
```shell
zstyle ':apollo:example:*:*:dir:*' bg_color "blue"
zstyle ':apollo:example:*:*:dir:*' fg_color "white"
zstyle ':apollo:example:*:*:dir:*' absolute "true"
zstyle ':apollo:example:*:*:dir:*' bookmarks "apollo=$HOME/apollo-zsh-theme"
zstyle ':apollo:example:*:*:dir:*' bookmark_patterns "/home/*/*/html;/html"
zstyle ':apollo:example:*:*:dir:*' last_count "5"
zstyle ':apollo:example:*:*:dir:*' shorten_length "auto"
zstyle ':apollo:example:*:*:dir:*' shorten_string ""
zstyle ':apollo:example:*:*:dir:*:sep' text "/"
zstyle ':apollo:example:*:*:dir:*:sep' style "bold"
zstyle ':apollo:example:*:*:dir:*:sep' fg_color "green"
zstyle ':apollo:example:*:*:dir:*:element' style "bold"
zstyle ':apollo:example:*:*:dir:*:last' style "bold"
zstyle ':apollo:example:*:*:dir:*:last' fg_color "red"
zstyle ':apollo:example:*:*:dir:*:shortened' style "bold"
zstyle ':apollo:example:*:*:dir:*:shortened' fg_color "grey30"
```


#### game

Examples:
```shell
zstyle ':apollo:example:*:*:game:*' bg_color "darkblue"
zstyle ':apollo:example:*:*:game:*' fg_color "white"
```


#### git

Element|Description
---|---
local_branch|
remote_branch|
ahead|
behind|
commit_hash|
action|
modified|
untracked|
stash_count|

Attribute|Type|Description
---|---|---
elements|list|

Examples:
```shell
zstyle ':apollo:example:*:*:git:*' elements "local_branch" "action" " " "commit_hash" " " "remote_branch" " " "modified" "|" "untracked" "|" "stash_count"
zstyle ':apollo:example:*:*:git:*' bg_color "black"
zstyle ':apollo:example:*:*:git:*::left:label' text "git "
zstyle ':apollo:example:*:*:git:*::left:label' fg_color "blue"
zstyle ':apollo:example:*:*:git:*' fg_color "yellow"
zstyle ':apollo:example:*:*:git:*:local_branch' fg_color "green"
zstyle ':apollo:example:*:*:git:*:action:left:label' text " "
zstyle ':apollo:example:*:*:git:*:remote_branch' fg_color "red"
zstyle ':apollo:example:*:*:git:*:untracked' fg_color "purple"
```


#### php_version

Examples:
```shell
zstyle ':apollo:example:*:*:php_version:*' fg_color "grey93"
zstyle ':apollo:example:*:*:php_version:*' bg_color "fuchsia"
zstyle ':apollo:example:*:*:php_version:*:left:label' text "PHP "
```


#### public_ip

Attribute|Type|Description
---|---|---
methods|list|
host|string|

Examples:
```shell
zstyle ':apollo:example:*:*:public_ip:*' fg_color "white"
zstyle ':apollo:example:*:*:public_ip:*' bg_color "darkgreen"
zstyle ':apollo:example:*:*:public_ip:*' methods "curl"
zstyle ':apollo:example:*:*:public_ip:*' host "ipv4.nexcess.net"
```


#### quota

Examples:
```shell
zstyle ':apollo:example:*:*:quota:*' fg_color "white"
zstyle ':apollo:example:*:*:quota:*' bg_color "red"
```


#### root_indicator

Examples:
```shell
zstyle ':apollo:example:*:*:root_indicator:*' fg_color "yellow"
zstyle ':apollo:example:*:*:root_indicator:*' bg_color "black"
```


#### status

Mode|Description
---|---
bad|

Attribute|Type|Description
---|---|---
verbose|boolean|
pipe_status|boolean|
always_show|boolean|

Examples:
```shell
zstyle ':apollo:example:*:*:status:*' fg_color "white"
zstyle ':apollo:example:*:*:status:*' bg_color "green"
zstyle ':apollo:example:*:*:status:*' always_show "true"
zstyle ':apollo:example:*:*:status:*' pipe_status "true"
zstyle ':apollo:example:*:*:status:*' verbose "true"
zstyle ':apollo:example:*:*:status:*' bg_color "red"
```


#### vcs

Examples:
```shell
zstyle ':apollo:example:*:*:vcs:*' fg_color "white"
zstyle ':apollo:example:*:*:vcs:*' bg_color "green"
```


#### vi_mode

Mode|Description
---|---
insert|
visual|
normal|
replace|

Element|Description
---|---
mode|

Examples:
```shell
zstyle ':apollo:example:*:*:vi_mode:*' fg_color "white"
zstyle ':apollo:example:*:*:vi_mode:*' bg_color "grey30"
zstyle ':apollo:example:*:*:vi_mode:insert:mode' text "INSERT"
zstyle ':apollo:example:*:*:vi_mode:visual:mode' text "VISUAL"
zstyle ':apollo:example:*:*:vi_mode:normal:mode' text "NORMAL"
zstyle ':apollo:example:*:*:vi_mode:replace:mode' text "REPLACE"
```


#### virtualenv

Examples:
```shell
zstyle ':apollo:example:*:*:virtualenv:*' fg_color "white"
zstyle ':apollo:example:*:*:virtualenv:*' bg_color "blue"
```


---

## Contributing

## FAQ

## Support

## Acknowledgments

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

- **[GPL v3 License](http://opensource.org/licenses/mit-license.php)**
