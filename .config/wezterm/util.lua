return {
	merge = function(tbl1, tbl2)
		for key, value in pairs(tbl2) do
			tbl1[key] = value
		end
	end,
}
