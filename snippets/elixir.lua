return {
  s("ins", {
    f(function(args, snip)
      local res, env = {}, snip.env
      for _, ele in ipairs(env.LS_SELECT_RAW) do table.insert(res, "IO.inspect(" .. ele .. ", label: \"line_number: " .. env.TM_LINE_NUMBER .. ", filename: " .. env.TM_FILENAME .. "\")") end
      return res
    end, {})
  })
}
