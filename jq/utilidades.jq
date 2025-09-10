def depth(n):
  if n == 0 then
    empty
  elif type == "object" then
    with_entries(.value |= depth(n - 1))
  elif type == "array" then
    map(depth(n - 1))
  else
    .
  end;
def ast:
  map(.ast |= fromjson);
