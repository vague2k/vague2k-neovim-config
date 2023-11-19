local lint = require("lint")

lint.linters_by_ft = {
    javascript = { "biomejs" },
    typescript = { "biomejs" },
    javascriptreact = { "biomejs" },
    typescriptreact = { "biomejs" },
    python = { "pylint" },
    go = { "golangcilint" },
}
