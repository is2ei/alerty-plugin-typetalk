Alerty::Plugin::Typetalk
===

[Alerty](https://github.com/sonots/alerty) plugin for [Typetalk](https://www.typetalk.com/)

## Installation

```
$ gem install alerty-plugin-typetalk
```

## Type

`typetalk`

## Configuration

`token`: Typetalk token  
`topic_id`: Typetalk topic id  
`template`: Template text. You can use placeholders listed below.  

## Placeholders

`${hostname}`: hostname which rans the command  
`${command}`: a given command  
`${exitstatus}`: exitstatus of the executed command  
`${output}`: output of the executed command  

## Example configuration

```yaml
log_path: STDOUT
log_level: debug
plugins:
  - type: typetalk
    token: xxxxxxxxxxxxxxxxxxxx
    topic_id: 12345
    template: "FAILURE: [${hostname}] ${command}\n${output}"
```
