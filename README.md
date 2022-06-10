# Use Semver Tool

A wrapper for using [fsaintjacques/semver-tool](https://github.com/fsaintjacques/semver-tool) with Actions.

## Example

A simple usage:

```yaml
steps:
    - name: Use Semver Tool
      id: semver-tool
      uses: vitorfhc/use-semver-tool@v1
      with:
        cmd: validate 'v1.2.3'

    - name: Is Valid
      if: steps.semver-tool.outputs.output == 'valid'
      run: echo Valid
```

## Inputs

|Variable|Description|Default|Required|
|-|-|-|-|
|cmd|command to be executed|N/A|Yes|

## Outputs

|Variable|Description|
|-|-|
|output|output of the tool execution|
