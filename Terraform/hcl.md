# HCL 

- HCL is a toolkit for creating structured configuration languages that are both human- and machine-friendly, for use with command-line tools. Although intended to be generally useful, it is primarily targeted towards devops tools, servers, etc.

- HCL has both a native syntax, intended to be pleasant to read and write for humans, and a JSON-based variant that is easier for machines to generate and parse.

- The HCL native syntax is inspired by [libucl](https://github.com/vstakhov/libucl), [nginx configuration](https://nginx.org/en/docs/beginners_guide.html#conf_structure), and others.

It includes an expression syntax that allows basic inline computation and, with support from the calling application, use of variables and functions for more dynamic configuration languages.

HCL provides a set of constructs that can be used by a calling application to construct a configuration language. The application defines which attribute names and nested block types are expected, and HCL parses the configuration file, verifies that it conforms to the expected structure, and returns high-level objects that the application can use for further processing.

```hcl
package main

import (
	"log"

	"github.com/hashicorp/hcl/v2/hclsimple"
)

type Config struct {
	IOMode  string        `hcl:"io_mode"`
	Service ServiceConfig `hcl:"service,block"`
}

type ServiceConfig struct {
	Protocol   string          `hcl:"protocol,label"`
	Type       string          `hcl:"type,label"`
	ListenAddr string          `hcl:"listen_addr"`
	Processes  []ProcessConfig `hcl:"process,block"`
}

type ProcessConfig struct {
	Type    string   `hcl:"type,label"`
	Command []string `hcl:"command"`
}

func main() {
	var config Config
	err := hclsimple.DecodeFile("config.hcl", nil, &config)
	if err != nil {
		log.Fatalf("Failed to load configuration: %s", err)
	}
	log.Printf("Configuration is %#v", config)
}
```

# Why HCL?
Newcomers to HCL often ask: why not JSON, YAML, etc?

Whereas JSON and YAML are formats for serializing data structures, HCL is a syntax and API specifically designed for building structured configuration formats.

HCL attempts to strike a compromise between generic serialization formats such as JSON and configuration formats built around full programming languages such as Ruby. HCL syntax is designed to be easily read and written by humans, and allows declarative logic to permit its use in more complex applications.

HCL is intended as a base syntax for configuration formats built around key-value pairs and hierarchical blocks whose structure is well-defined by the calling application, and this definition of the configuration structure allows for better error messages and more convenient definition within the calling application.

It can't be denied that JSON is very convenient as a lingua franca for interoperability between different pieces of software. Because of this, HCL defines a common configuration model that can be parsed from either its native syntax or from a well-defined equivalent JSON structure. This allows configuration to be provided as a mixture of human-authored configuration files in the native syntax and machine-generated files in JSON.