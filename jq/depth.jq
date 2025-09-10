def depth(n): 
	if n == 0 then 
		empty 
	elif type == "object" then 
		with_entries(.value |= limit(n - 1)) 
	elif type == "array" then 
		map(limit(n - 1)) 
	else 
		. 
	end;
