local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
    vim.notify("Unable to require luasnip", "Error", {"Snippets"})
    return
end


require("luasnip.loaders.from_vscode").lazy_load()

-- Python
luasnip.add_snippets("python", {
    luasnip.snippet(
        "defmain",
        {
            luasnip.text_node({"def main("}),
            luasnip.insert_node(1),
            luasnip.text_node({"):", "\t"}),
            luasnip.insert_node(2, "pass"),
            luasnip.text_node({"", "", "if __name__ == \"__main__\":", "\t"}),
            luasnip.insert_node(3, "main"),
            luasnip.text_node({"("}),
            luasnip.insert_node(4),
            luasnip.text_node({")"}),
            luasnip.insert_node(0),
        }
    ),
})


-- C++
luasnip.add_snippets("cpp", {
    luasnip.snippet(
        "intmain",
        {
            luasnip.text_node({"int main() {", "\t"}),
            luasnip.insert_node(1, "return 0;"),
            luasnip.insert_node(0),
            luasnip.text_node({"", "}"})
        }
    ),
})
