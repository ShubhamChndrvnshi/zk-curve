## FIRST CAIRO PROGRAM

- To run a cairo program, it first needs to be compiled into a json file. Command to compile: cairo-compile filename.cairo --output compiled_fileName.json.
	Ex: cairo-compile test.cairo --output test_compiled.json

- To run a compiled file in trace mode, below is the command:
	cairo-run --program=test_compiled.json --print_output --print_info --relocate_prints --tracer
