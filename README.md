# Jolie Package resolution demo

This repository contains jolie code for illustrate possible upcoming problem for jolie when developer starts adopting the package manager (jpm in particular)

In this example we simulate the hoisted structure of packages similarly to the result by npm from running `npm install`.

We assume that this package (root) has following dependency graph.

- root -> [ A(1.0.0), B(1.1.0) ]
- A(1.0.0) -> [ B(1.0.0) ]
- B(1.0.0) -> []
- B(1.1.0) -> []

The result from running `npm install` from given dependency graph would yeild following structure of `node_modules`

```
. (root)
└── node_modules
    ├── A (1.0.0)
    │   └── node_modules
    │       └── B (1.0.0)
    └── B (1.1.0)
```

Packages in `examples` directory constructs similar structure with jolie packages, and with this simple example, the following problems raises when execute the program:

Problems:

1. Operation name clashing?

running examples/name-clashing/main.ol will raised NullPointerException from the interpreter

2. Incorrectly import target

running examples/package-discovery/main.ol, the console will output `A prints 1.1.0` which means the module finder of jolie interpreter will always(and only*) performs lookup for the module inside `packages` directory in current working directory.

\* Remove `packages/B` will resulted in ModuleNotFound
