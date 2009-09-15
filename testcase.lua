
local tokyotyrant = require'tinytyrant'

DATETIME_FORMAT = '%Y-%m-%d_%H:%M:%S'
_NAME = arg[0]

function table_print (tt, indent, done)
  done = done or {}
  indent = indent or 0
  if type(tt) == "table" then
    local sb = {}
    table.insert(sb, "{\n");
    for key, value in pairs (tt) do
      table.insert(sb, string.rep (" ", indent)) -- indent it
      if type (value) == "table" and not done [value] then
        done [value] = true
        table.insert(sb, tostring(key) .. " = {\n");
        table.insert(sb, table_print (value, indent + 2, done))
        table.insert(sb, string.rep (" ", indent)) -- indent it
        table.insert(sb, "}\n");
      elseif "number" == type(key) then
        table.insert(sb, string.format("%s\n", tostring(value)))
      else
        table.insert(sb, string.format(
            '%s = %q\n', tostring (key), tostring(value)))
       end
    end
    table.insert(sb, "}\n");
    return table.concat(sb)
  else
    return tt .. "\n"
  end
end

function serialize (o)
	if type(o) == "number" then
		io.write(o)
	elseif type(o) == "string" then
		io.write(string.format("%q", o))
	elseif type(o) == "table" then
		io.write("{\n")
		for k,v in pairs(o) do
			io.write("  [")
			serialize(k)
			io.write("] = ")
			serialize(v)
			io.write(",\n")
		end
		io.write("}\n")
	--else
		--error("cannot serialize a " .. type(o))
	end
end

function to_string( tbl )
    if  "nil"       == type( tbl ) then
        return tostring(nil)
    elseif  "table" == type( tbl ) then
        return table_print(tbl)
    elseif  "string" == type( tbl ) then
        return tbl
    else
        return tostring(tbl)
    end
end

function get(db, pkey)
  local args = { tostring(pkey) }
  dbg('try misc')
  local res, err, msg = db:misc('get', args)
  dbg('ok')
  if res == nil then return nil, self.ENOREC end
  if #res % 2 == 1 then return nil, self.ERECV end
  local cols = {}
  for i=1, #res, 2 do
    cols[res[i]] = res[i+1]
  end
  return cols
end

local function dbg(...)
  --local args = {}
  for i, v in ipairs(arg) do
    arg[i] = tostring(v)
  end
  print(os.date(DATETIME_FORMAT) .. ' ' .. _NAME .. ' [[' .. table.concat(arg, ', ') .. ']]')
end



local content, db

function setup()
  content = { name="Homer Cezar", age=os.date('%H:%M:%S') }
  if arg[1] and arg[2] then
    db = tokyotyrant.RemoteDatabase{host=arg[1], port=tonumber(arg[2])}
  else
    db = tokyotyrant.RemoteDatabase{}
  end
  --[[
  dbg('open database...')
  local res, err, msg = db:open()
  dbg(to_string({id=id, err=err, msg=msg}))
  assert(res)
  dbg('ok')
  ]]
end

local function assertnumber(v, msg)
	assert(type(v) == 'number', msg or "not number")
	return v
end
local function assertstring(v, msg)
	assert(type(v) == 'string', msg or "not string")
	return v
end
local function asserttable(v, msg)
	assert(type(v) == 'table', msg or "not table")
	return v 
end
local function assertnil(v, msg)
	assert(type(v) == 'nil', msg or "not nil")
	return v
end
local function isnumber(v)
	if type(v) == 'number' then return v end
end
local function isstring(v)
	if type(v) == 'string' then return v end
end
local function istable(v)
	if type(v) == 'table' then return v end
end
local function isnil(v)
	if type(v) == 'nil' then return v end
end


function test_insert()
  -- genuid
  dbg('db:genuid...')
  local id, err, msg = db:genuid()
  dbg(to_string({id=id, err=err, msg=msg}))
  --assertstring(db:genuid())
  dbg('ok')

  -- put
  dbg('db:put...')
  local res, err, msg = db:put(id, content)
  dbg(to_string({res=res, err=err, msg=msg}))
  assert(res == true)
  assertnil(err)
  assertnil(msg)
  dbg('ok')

  -- get
  dbg('db:get...')
  local res, err, msg = db:get(id)
  dbg(to_string({res=res, err=err, msg=msg}))
  asserttable(res)
  assertnil(err)
  assertnil(msg)
  dbg('...ok')

  -- out
  dbg('db:out...')
  local res, err, msg = db:out(id)
  dbg(to_string({res=res, err=err, msg=msg}))
  assert(res == true)
  assertnil(err)
  assertnil(msg)
  dbg('...ok')  
  
  --rnum
  dbg('db:rnum...')
  local res, err, msg = db:rnum()
  dbg(to_string({res=res, err=err, msg=msg}))
  assertnumber(res)
  assertnil(err)
  assertnil(msg)
  dbg('...ok')
  
  --size
  dbg('db:size...')
  local res, err, msg = db:size()
  dbg(to_string({res=res, err=err, msg=msg}))
  assertnumber(res)
  assertnil(err)
  assertnil(msg)
  dbg('...ok')  
  
  --stat
  dbg('db:stat...')
  local res, err, msg = db:stat()
  dbg(to_string({res=res, err=err, msg=msg}))
  assertstring(res)
  assertnil(err)
  assertnil(msg)
  dbg('...ok')  
  
  --stattable
  dbg('db:stat...')
  local res, err, msg = db:stattable()
  dbg(to_string({res=res, err=err, msg=msg}))
  asserttable(res)
  assertnil(err)
  assertnil(msg)
  dbg('...ok')  
  
  
    --local content = database_select(handle, ...)
  --assert_table( content )
  --assert_equal( { "row 1", "row 2", "row 3", "row 4" }, content )
end

function test_reconnect()
  --rnum
  dbg('db:rnum...')
  local res, err, msg = db:rnum()
  dbg(to_string({res=res, err=err, msg=msg}))
  dbg('...ok')
  
  --size
  dbg('db:size...')
  local res, err, msg = db:size()
  dbg(to_string({res=res, err=err, msg=msg}))
  dbg('...ok')  
	print('Close the server enter to continue')
	io.read()
  --rnum
  dbg('db:rnum...')
  local res, err, msg = db:rnum()
  dbg(to_string({res=res, err=err, msg=msg}))
  dbg('...ok')
  
  --size
  dbg('db:size...')
  local res, err, msg = db:size()
  dbg(to_string({res=res, err=err, msg=msg}))
  dbg('...ok')  

	print('Start the server enter to continue')
	io.read()
	  
  --rnum
  dbg('db:rnum...')
  local res, err, msg = db:rnum()
  dbg(to_string({res=res, err=err, msg=msg}))
  dbg('...ok')
  
  --size
  dbg('db:size...')
  local res, err, msg = db:size()
  dbg(to_string({res=res, err=err, msg=msg}))
  dbg('...ok')  
  
  
  
    --local content = database_select(handle, ...)
  --assert_table( content )
  --assert_equal( { "row 1", "row 2", "row 3", "row 4" }, content )
end

function test_query()
	--[[
  -- genuid
  dbg('db:genuid...')
  local id, err, msg = db:genuid()
  dbg(to_string({id=id, err=err, msg=msg}))
  assertstring(db:genuid())
  dbg('ok')

  -- put
  dbg('db:put...')
  local res, err, msg = db:put(id, content)
  dbg(to_string({res=res, err=err, msg=msg}))
  assert(res == true)
  assertnil(err)
  assertnil(msg)
  dbg('ok')

  -- get
  dbg('db:get...')
  local res, err, msg = db:get(id)
  dbg(to_string({res=res, err=err, msg=msg}))
  asserttable(res)
  assertnil(err)
  assertnil(msg)
  dbg('...ok')
  ]]
  -- genuid
  dbg('db:genuid...')
  local id, err, msg = db:genuid()
  dbg(to_string({id=id, err=err, msg=msg}))
  assertstring(id)
  dbg('ok')

  -- put
  dbg('db:put...')
  local res, err, msg = db:put('barney', {name="Barney", age="10"})
  dbg(to_string({res=res, err=err, msg=msg}))
  assert(res == true)
  assertnil(err)
  assertnil(msg)
  dbg('ok')
  
  -- genuid
  dbg('db:genuid...')
  local id, err, msg = db:genuid()
  dbg(to_string({id=id, err=err, msg=msg}))
  assertstring(id)
  dbg('ok')

  -- put
  dbg('db:put...')
  local res, err, msg = db:put('lisa', {name="Lisa", age="30"})
  dbg(to_string({res=res, err=err, msg=msg}))
  assert(res == true)
  assertnil(err)
  assertnil(msg)
  dbg('ok')
  
  -- add
  dbg('db: add content...')
  local id = assertstring(db:genuid())
  local res, err, msg = db:put('family_bart', {name="Bart", age="12"})
  assert(res == true)
  assertnil(err)
  assertnil(msg)
  dbg('ok')
  
  -- get
  dbg('query init...')
  qry = tokyotyrant.Query
  qry:new(db)
  dbg('...ok')
  dbg('query: addcond...')
	qry:addcond("name", '1', "Barn")
	dbg('...ok')
	--[[
	dbg('query: setorder...')
	qry:setorder("name", '0')
	dbg('...ok')
	dbg('query: setlimit...')
	qry:setlimit(10, 0)
	dbg('...ok')
	]]
	dbg(to_string({query=qry}))
	serialize(qry)
	dbg('query: search...')
	local res, err, emsg = qry:search()
	dbg(to_string({res=res, err=err, msg=msg}))
	dbg('...ok')
	dbg('query: for results...')
	for i = 1, #res do
		 rcols = db:get(res[i])
		 print("name:" .. rcols.name)
		 print("age"	.. rcols.age)
	end
	dbg('...ok')
	qry.args = {}
	qry:setorder("age", '3')
	qry:setlimit(1, 1)
	local res, err, emsg = qry:search()
	dbg(to_string({res=res, err=err, msg=msg}))
	dbg('...ok')
	dbg('query: for results...')
	for i = 1, #res do
		 rcols = db:get(res[i])
		 print("name:" .. rcols.name)
		 print("age"	.. rcols.age)
	end
	dbg('...ok')
	dbg('query: test flags')
	qry.args = {}
	--qry:addcond('', '1', "bar")
	qry:addcond('age', qry.QCNUMLE, 15, {qry.QCNEGATE})
	local res, err, emsg = qry:search()
	dbg(to_string({res=res, err=err, msg=msg}))
	for i = 1, #res do
		 print(res[i])
		 rcols = db:get(res[i])
		 print("\tname:" .. rcols.name)
		 print("\tage"	.. rcols.age)
	end
	dbg('...ok')
  --[[
  local res, err, msg = db:get(id)
  dbg(to_string({res=res, err=err, msg=msg}))
  asserttable(res)
  assertnil(err)
  assertnil(msg)
  dbg('...ok')
  ]]
end

function teardown()
  --db:sync()
  db:close()
  --[[handle = nil
  content = nil
  delete_file("test.db")]]
end

--[[
function teardown()
  database_drop_table(handle, ...)
  database_close(handle)
  handle = nil
  content = nil
  delete_file("test.db")
end

function test_select()
  local content = database_select(handle, ...)
  assert_table( content )
  assert_equal( content, content )
end

function test_insert()
  database_insert(handle, "row 4", ...)
  local content = database_select(handle, ...)
  assert_table( content )
  assert_equal( { "row 1", "row 2", "row 3", "row 4" }, content )
end

function test_delete()
  database_delete(handle, "row 2", ...)
  local content = database_select(handle, ...)
  assert_table( content )
  assert_equal( { "row 1", "row 3" }, content )
end
]]


setup()
test_reconnect()
print('Press enter to continue')
io.read()
test_insert()

test_insert()


test_query()
teardown()
