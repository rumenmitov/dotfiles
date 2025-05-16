local utils = {}

function utils.enableAutoComplete(client, bufnr)
    -- INFO: This enables auto-complete on each character.
    for i = 32, 126 do
        table.insert(client.server_capabilities.completionProvider.triggerCharacters,
            string.char(i))
    end

    vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = true,
        convert = function(item)
            return { abbr = item.label:gsub('%b()', '') }
        end,
    })
end

return utils
