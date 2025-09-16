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
def filter_names:
 select(type == "object")| ."name" | select(. != null);
def extractTokenText:
  if type == "object" then
    with_entries(
      .key as $k
      | .value |= extractTokenText
    )
    | if has("tokenRange") and .tokenRange? != null and .tokenRange.beginToken? != null and .tokenRange.beginToken.text? != null then
        {tokenText: .tokenRange.beginToken.text}
      else
        .
      end
  elif type == "array" then
    map(extractTokenText)
  else
    .
  end;

def prune:
  if type == "object" then
    with_entries(
      select(
        .key == "name" and (.value.identifier? != null)
        or .key == "members"
      )
      | .value |= prune
    )
  elif type == "array" then
    map(prune)
  else
    .
  end;


def bprune:
  . as $node
  | if ($node | type) == "object" then
      reduce ($node | keys_unsorted[]) as $key (
        {}; 
        . + (
          if $key == "!" then
            {($key): $node[$key]}
          elif $key == "identifier" then
            {identifier: $node[$key]}
          elif ($node[$key] | type) == "array" then
            {($key): ($node[$key] | map(bprune) | map(select(. != null)))}
          elif ($node[$key] | type) == "object" then
            {($key): ($node[$key] | bprune)}
          else
            {}
          end
        )
      )
    elif ($node | type) == "array" then
      $node | map(bprune) | map(select(. != null))
    else
      null
    end;

def clean:
  . as $node
  | if ($node | type) == "object" then
      reduce ($node | keys_unsorted[]) as $key (
        {};
        . + (
          ($node[$key] | clean) as $cleaned
          | if ($cleaned == null or $cleaned == {} or $cleaned == [] or 
                (($cleaned | type) != "string" and 
                 ($cleaned | type) != "object" and 
                 ($cleaned | type) != "array")) then
              {}
            else
              {($key): $cleaned}
            end
        )
      )
    elif ($node | type) == "array" then
      $node
      | map(clean)
      | map(select(. != null and . != {} and . != [] and 
                   ((. | type) == "string" or 
                    (. | type) == "object" or 
                    (. | type) == "array")))
      | if length == 0 then null else . end
    elif ($node | type) == "string" then
      $node
    else
      null
    end;

