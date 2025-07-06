local M = {}

-- Tool definition
M.name = "pr_helper"
M.description = "Helps create GitHub PR descriptions from git diffs"

-- XML schema for the tool
M.xml_schema = [[
<tool name="pr_helper">
  <action>
    <branch>string</branch>  <!-- Optional: branch to diff against (default: develop) -->
    <format>string</format>  <!-- Optional: format type (default: markdown) -->
  </action>
</tool>
]]

-- Execute the tool
M.execute = function(params, on_complete)
  local branch = params.branch or "develop"
  local format = params.format or "markdown"
  
  -- Create temp file for the diff
  local temp_file = os.tmpname()
  
  -- Run git diff command
  vim.fn.jobstart({"sh", "-c", "git diff " .. branch .. " > " .. temp_file}, {
    on_exit = function(_, code)
      if code ~= 0 then
        on_complete("Error generating diff", true)
        return
      end
      
      -- Read the diff file
      local diff = vim.fn.readfile(temp_file)
      diff = table.concat(diff, "\n")
      
      -- Clean up temp file
      os.remove(temp_file)
      
      -- Share diff with LLM to generate PR description
      on_complete("Here's the git diff:\n```diff\n" .. diff .. "\n```\n\nPlease summarize this for a GitHub PR description in markdown format.", false)
    end
  })
end

return M

