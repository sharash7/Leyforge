# Architecture-lint fixtures

`good/` is a known-good dependency example. `bad/` deliberately reaches into `provider.internal`; `seeded-violation-rules.json` must report `TEST-ARCH-001` with file and line context. These files are linter input only and are never imported or executed.
