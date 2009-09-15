


--[[
ttutil.h

#define TTDEFPORT			1978							/* default port of the server */
#define TTMAGICNUM		 0xc8							/* magic number of each command */
#define TTCMDPUT			 0x10							/* ID of put command */
#define TTCMDPUTKEEP	 0x11							/* ID of putkeep command */
#define TTCMDPUTCAT		0x12							/* ID of putcat command */
#define TTCMDPUTSHL		0x13							/* ID of putshl command */
#define TTCMDPUTNR		 0x18							/* ID of putnr command */
#define TTCMDOUT			 0x20							/* ID of out command */
#define TTCMDGET			 0x30							/* ID of get command */
#define TTCMDMGET			0x31							/* ID of mget command */
#define TTCMDVSIZ			0x38							/* ID of vsiz command */
#define TTCMDITERINIT	0x50							/* ID of iterinit command */
#define TTCMDITERNEXT	0x51							/* ID of iternext command */
#define TTCMDFWMKEYS	 0x58							/* ID of fwmkeys command */
#define TTCMDADDINT		0x60							/* ID of addint command */
#define TTCMDADDDOUBLE 0x61							/* ID of adddouble command */
#define TTCMDEXT			 0x68							/* ID of ext command */
#define TTCMDSYNC			0x70							/* ID of sync command */
#define TTCMDOPTIMIZE	0x71							/* ID of optimize command */
#define TTCMDVANISH		0x72							/* ID of vanish command */
#define TTCMDCOPY			0x73							/* ID of copy command */
#define TTCMDRESTORE	 0x74							/* ID of restore command */
#define TTCMDSETMST		0x78							/* ID of setmst command */
#define TTCMDRNUM			0x80							/* ID of rnum command */
#define TTCMDSIZE			0x81							/* ID of size command */
#define TTCMDSTAT			0x88							/* ID of stat command */
#define TTCMDMISC			0x90							/* ID of misc command */
#define TTCMDREPL			0xa0							/* ID of repl command */

ttutil.c
#define SOCKPATHBUFSIZ 108							 // size of a socket path buffer
#define SOCKRCVTIMEO	 0.25							// timeout of the recv call of socket
#define SOCKSNDTIMEO	 0.25							// timeout of the send call of socket
#define SOCKCNCTTIMEO	5.0							 // timeout of the connect call of socket
#define SOCKLINEBUFSIZ 4096							// size of a line buffer of socket
#define SOCKLINEMAXSIZ (16*1024*1024)		// maximum size of a line of socket
#define HTTPBODYMAXSIZ (256*1024*1024)	 // maximum size of the entity body of HTTP
#define TRILLIONNUM		1000000000000		 // trillion number


ttserver.c
#define DEFTHNUM			 8								 // default thread number
#define DEFPIDPATH		 "ttserver.pid"		// default name of the PID file
#define DEFRTSPATH		 "ttserver.rts"		// default name of the RTS file
#define DEFULIMSIZ		 (1LL<<30)				 // default limit size of an update log file
#define MAXARGSIZ			(32<<20)					// maximum size of each argument
#define MAXARGNUM			(1<<20)					 // maximum number of arguments
#define NUMBUFSIZ			32								// size of a numeric buffer
#define LINEBUFSIZ		 8192							// size of a line buffer
#define TOKENUNIT			256							 // unit number of tokens
#define RECMTXNUM			31								// number of mutexes of records
#define STASHBNUM			1021							// bucket number of the script stash object
#define REPLPERIOD		 1.0							 // period of calling replication request

#define TTMSKPUT			 (1ULL<<0)				 // bit mask of put command
#define TTMSKPUTKEEP	 (1ULL<<1)				 // bit mask of putkeep command
#define TTMSKPUTCAT		(1ULL<<2)				 // bit mask of putcat command
#define TTMSKPUTSHL		(1ULL<<3)				 // bit mask of putshl command
#define TTMSKPUTNR		 (1ULL<<4)				 // bit mask of putnr command
#define TTMSKOUT			 (1ULL<<5)				 // bit mask of out command
#define TTMSKGET			 (1ULL<<6)				 // bit mask of get command
#define TTMSKMGET			(1ULL<<7)				 // bit mask of mget command
#define TTMSKVSIZ			(1ULL<<8)				 // bit mask of vsiz command
#define TTMSKITERINIT	(1ULL<<9)				 // bit mask of iterinit command
#define TTMSKITERNEXT	(1ULL<<10)				// bit mask of iternext command
#define TTMSKFWMKEYS	 (1ULL<<11)				// bit mask of fwmkeys command
#define TTMSKADDINT		(1ULL<<12)				// bit mask of addint command
#define TTMSKADDDOUBLE (1ULL<<13)				// bit mask of adddouble command
#define TTMSKEXT			 (1ULL<<14)				// bit mask of ext command
#define TTMSKSYNC			(1ULL<<15)				// bit mask of sync command
#define TTMSKOPTIMIZE	(1ULL<<16)				// bit mask of sync command
#define TTMSKVANISH		(1ULL<<17)				// bit mask of vanish command
#define TTMSKCOPY			(1ULL<<19)				// bit mask of copy command
#define TTMSKRESTORE	 (1ULL<<19)				// bit mask of restore command
#define TTMSKSETMST		(1ULL<<20)				// bit mask of setmst command
#define TTMSKRNUM			(1ULL<<21)				// bit mask of rnum command
#define TTMSKSIZE			(1ULL<<22)				// bit mask of size command
#define TTMSKSTAT			(1ULL<<23)				// bit mask of stat command
#define TTMSKMISC			(1ULL<<24)				// bit mask of stat command
#define TTMSKREPL			(1ULL<<25)				// bit mask of repl command
#define TTMSKSLAVE		 (1ULL<<26)				// bit mask of slave command
#define TTMSKALLORG		(1ULL<<27)				// bit mask of all commands the original
#define TTMSKALLMC		 (1ULL<<28)				// bit mask of all commands the memcached
#define TTMSKALLHTTP	 (1ULL<<29)				// bit mask of all commands the HTTP
#define TTMSKALLREAD	 (1ULL<<30)				// bit mask of all commands of reading
#define TTMSKALLWRITE	(1ULL<<31)				// bit mask of all commands of writing
#define TTMSKALLMANAGE (1ULL<<32)				// bit mask of all commands of managing


>> tcrdb.h
enum {																	 /* enumeration for error codes */
	TTESUCCESS,														/* success */
	TTEINVALID,														/* invalid operation */
	TTENOHOST,														 /* host not found */
	TTEREFUSED,														/* connection refused */
	TTESEND,															 /* send error */
	TTERECV,															 /* recv error */
	TTEKEEP,															 /* existing record */
	TTENOREC,															/* no record found */
	TTEMISC = 9999												 /* miscellaneous error */
};


/*************************************************************************************************
 * table extension
 *************************************************************************************************/


enum {																	 /* enumeration for index types */
	RDBITLEXICAL = TDBITLEXICAL,					 /* lexical string */
	RDBITDECIMAL = TDBITDECIMAL,					 /* decimal string */
	RDBITTOKEN = TDBITTOKEN,							 /* token inverted index */
	RDBITQGRAM = TDBITQGRAM,							 /* q-gram inverted index */
	RDBITOPT = TDBITOPT,									 /* optimize */
	RDBITVOID = TDBITVOID,								 /* void */
	RDBITKEEP = TDBITKEEP									/* keep existing index */
};

typedef struct {												 /* type of structure for a query */
	TCRDB *rdb;														/* database object */
	TCLIST *args;													/* arguments for the method */
	TCXSTR *hint;													/* hint string */
} RDBQRY;

enum {																	 /* enumeration for query conditions */
	RDBQCSTREQ = TDBQCSTREQ,							 /* string is equal to */
	RDBQCSTRINC = TDBQCSTRINC,						 /* string is included in */
	RDBQCSTRBW = TDBQCSTRBW,							 /* string begins with */
	RDBQCSTREW = TDBQCSTREW,							 /* string ends with */
	RDBQCSTRAND = TDBQCSTRAND,						 /* string includes all tokens in */
	RDBQCSTROR = TDBQCSTROR,							 /* string includes at least one token in */
	RDBQCSTROREQ = TDBQCSTROREQ,					 /* string is equal to at least one token in */
	RDBQCSTRRX = TDBQCSTRRX,							 /* string matches regular expressions of */
	RDBQCNUMEQ = TDBQCNUMEQ,							 /* number is equal to */
	RDBQCNUMGT = TDBQCNUMGT,							 /* number is greater than */
	RDBQCNUMGE = TDBQCNUMGE,							 /* number is greater than or equal to */
	RDBQCNUMLT = TDBQCNUMLT,							 /* number is less than */
	RDBQCNUMLE = TDBQCNUMLE,							 /* number is less than or equal to */
	RDBQCNUMBT = TDBQCNUMBT,							 /* number is between two tokens of */
	RDBQCNUMOREQ = TDBQCNUMOREQ,					 /* number is equal to at least one token in */
	RDBQCFTSPH = TDBQCFTSPH,							 /* full-text search with the phrase of */
	RDBQCFTSAND = TDBQCFTSAND,						 /* full-text search with all tokens in */
	RDBQCFTSOR = TDBQCFTSOR,							 /* full-text search with at least one token in */
	RDBQCFTSEX = TDBQCFTSEX,							 /* full-text search with the compound expression of */
	RDBQCNEGATE = TDBQCNEGATE,						 /* negation flag */
	RDBQCNOIDX = TDBQCNOIDX								/* no index flag */
};

enum {																	 /* enumeration for order types */
	RDBQOSTRASC = TDBQOSTRASC,						 /* string ascending */
	RDBQOSTRDESC = TDBQOSTRDESC,					 /* string descending */
	RDBQONUMASC = TDBQONUMASC,						 /* number ascending */
	RDBQONUMDESC = TDBQONUMDESC						/* number descending */
};

enum {																	 /* enumeration for set operation types */
	RDBMSUNION = TDBMSUNION,							 /* union */
	RDBMSISECT = TDBMSISECT,							 /* intersection */
	RDBMSDIFF = TDBMSDIFF									/* difference */
};

>> tcrdb.c
/* Get the message string corresponding to an error code. */
const char *tcrdberrmsg(int ecode){
	switch(ecode){
	case TTESUCCESS: return "success";
	case TTEINVALID: return "invalid operation";
	case TTENOHOST: return "host not found";
	case TTEREFUSED: return "connection refused";
	case TTESEND: return "send error";
	case TTERECV: return "recv error";
	case TTEKEEP: return "existing record";
	case TTENOREC: return "no record found";
	case TTEMISC: return "miscellaneous error";
	}
	return "unknown error";
}


]]

require'luarocks.require'

local socket = require'socket'
local struct = require'struct'
local setmetatable = _G.setmetatable

--[[
A minimal implementation of tokyotyrant client for table databases,
using luasocket.

It's basics a fork of lua-tokyotyrant that is full implementation 
please visite http://github.com/phoenixsol/lua-tokyotyrant/
]]

__VERSION = '0.0.1'

-- private functions
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



local RemoteDatabase = {
	port = '1978',
	host = 'localhost',
	file = nil,
	socket = nil,
	timeout = 10,		 -- Wait 10 sec in send and receive op to timeout
	timeout_type = 't',	 -- timeout mode 'b': block timeout, 't': total timeout.
	send_retries = 10,
	
	ESUCCESS = 'success',
	EINVALID = 'invalid operation',
	ENOHOST	= 'host not found',
	EREFUSED = 'connection refused',
	ESEND = 'send error',
	ERECV = 'recv error',
	EKEEP = 'existing record',
	ENOREC = 'no record found',
	EMISC	= 'miscellaneous error',
	
	ERR_CONN = 'connection error',
	_dbs = {}
}

function RemoteDatabase.new(cls, obj)
	obj = obj or {}
	setmetatable(obj, cls)
	cls.__index = RemoteDatabase
	return obj
end

setmetatable(RemoteDatabase, {__call = RemoteDatabase.new})

function RemoteDatabase:_receiveint8 ()
	local data, err, emsg = self.socket:receive(1)
	if isstring(data) then return struct.unpack('>i1', data) end
	return nil, err, emsg
end

function RemoteDatabase:_receiveint32 ()
	local data, err, emsg = self.socket:receive(4)
	if isstring(data) then return struct.unpack('>i4', data) end
	return nil, err, emsg
end

function RemoteDatabase:_receiveint64 ()
	local data, err, emsg = self.socket:receive(8)
	if isstring(data) then return struct.unpack('>i8', data) end
	return nil, err, emsg
end

function RemoteDatabase:_receiveuchar()
	local data, err, emsg = self.socket:receive(1)
	if isstring(data) then return struct.unpack('>B', data) end
	return nil, err, emsg
end

function RemoteDatabase:send(req)
	self:open()
	for r=1, self.send_retries do
		local res, err, emsg = self.socket:send(req)
		if res ~= nil then
			return res
		elseif res == nil and err ~= 'closed' then
			return nil, err, emsg
		else
			return self:open(true)
		end
	end
	local res, err, emsg = self.socket:send(req)
	local res, err, emsg = self.socket:send(req)
end

function RemoteDatabase:open(force)
	if not self.socket or force then
		-- socket don't created or closed
		local err, emsg
		self.socket, err, emsg = socket.connect(self.host, self.port)
		if not self.socket then return nil, err, emsg end
		self.socket:settimeout(self.timeout, self.timeout_type)
		return true
	else
		return nil, self.ERR_CONN, 'open: connection open'
	end
end

function RemoteDatabase:close()
	if not self.socket then return false, self.ERR_CONN, 'close: appears to be closed' end
	self.socket:close()
	rawset(self, 'socket', nil)
	return true
end

function RemoteDatabase:out(pkey)
	--[=[ out: for the function `tcrdbout'
		Request: [magic:2][ksiz:4][kbuf:*]
			Two bytes of the command ID: 0xC8 and 0x20
			A 32-bit integer standing for the length of the key
			Arbitrary data of the key
		Response: [code:1]
			An 8-bit integer whose value is 0 on success or another on failure
	]=]
	local pkey = assertstring(pkey)
	local req = struct.pack('>BBi4', 0xc8, 0x20, #pkey)
	req = req .. pkey
	--self:_checkconn()
	--local res, err = self.socket:send(req)
	if not self:send(req) then return nil, self.ESEND end
	-- get code
	local code, err, emgs = self:_receiveint8 ()
	if code == nil then return nil, err, emsg end
	if code == 0 then
		return true
	elseif code ~= 0 then
	 return nil, self.EMISC, 'out: unknown receive code'
	end
	return nil, self.EMISC, 'out: unknown'
end

function RemoteDatabase:rnum()
	--[=[ rnum: for the function `tcrdbrnum'
    Request: [magic:2]
        Two bytes of the command ID: 0xC8 and 0x80
    Response: [code:1][rnum:8]
        An 8-bit integer whose value is always 0
        A 64-bit integer standing for the number of records
	]=]
	local req = struct.pack('>BB', 0xc8, 0x80)
	if not self:send(req) then return nil, self.ESEND end
	--if not self.socket:send(req) then return nil, self.ESEND end
	-- get code
	local code, err, emgs = self:_receiveint8 ()
	if code == nil then return nil, err, emsg end
	if code == 0 then
		local rnum, err, emgs = self:_receiveint64 ()
		if rnum == nil then return nil, err, emsg end
		return rnum
	elseif code ~= 0 then
	 return nil, self.EMISC, 'rnum: unknown receive code'
	end
	return nil, self.EMISC, 'rnum: unknown'
end

function RemoteDatabase:size()
	--[=[size: for the function `tcrdbsize'
    Request: [magic:2]
        Two bytes of the command ID: 0xC8 and 0x81
    Response: [code:1][rnum:8]
        An 8-bit integer whose value is always 0
        A 64-bit integer standing for the size of the database 
	]=]
	local req = struct.pack('>BB', 0xc8, 0x81)
	if not self:send(req) then return nil, self.ESEND end
	--if not self.socket:send(req) then return nil, self.ESEND end
	-- get code
	local code, err, emgs = self:_receiveint8 ()
	if code == nil then return nil, err, emsg end
	if code == 0 then
		local rnum, err, emgs = self:_receiveint64 ()
		if rnum == nil then return nil, err, emsg end
		return rnum
	elseif code ~= 0 then
	 return nil, self.EMISC, 'rnum: unknown receive code'
	end
	return nil, self.EMISC, 'rnum: unknown'
end

function RemoteDatabase:stat()
	--[=[stat: for the function `tcrdbstat'
    Request: [magic:2]
        Two bytes of the command ID: 0xC8 and 0x88
    Response: [code:1][ssiz:4][sbuf:*]
        An 8-bit integer whose value is always 0
        A 32-bit integer standing for the length of the status message
        Arbitrary data of the result 
	]=]
	local req = struct.pack('>BB', 0xc8, 0x88)
	if not self:send(req) then return nil, self.ESEND end
	--if not self.socket:send(req) then return nil, self.ESEND end
	-- get code
	local code, err, emgs = self:_receiveint8 ()
	if code == nil then return nil, err, emsg end
	if code == 0 then
		local ssiz, err, emgs = self:_receiveint32 ()
		if ssiz == nil then return nil, err, emsg end
		local sbuf, err, emgs = self.socket:receive (ssiz)
		if sbuf == nil then return nil, err, emsg end
		return sbuf
	elseif code ~= 0 then
	 return nil, self.EMISC, 'rnum: unknown receive code'
	end
	return nil, self.EMISC, 'rnum: unknown'
end

function RemoteDatabase:misc (name, args, opts)
	--[=[misc: for the function `tcrdbmisc'
		Request: [magic:2][nsiz:4][opts:4][rnum:4][nbuf:*][{[asiz:4][abuf:*]}:*]
			Two bytes of the command ID: 0xC8 and 0x90
			A 32-bit integer standing for the length of the function name
			A 32-bit integer standing for the options
			A 32-bit integer standing for the number of arguments
			Arbitrary data of the function name
			iteration: A 32-bit integer standing for the length of the argument
			iteration: Arbitrary data of the argument
		Response: [code:1][rnum:4][{[esiz:4][ebuf:*]}:*]
			An 8-bit integer whose value is 0 on success or another on failure
			A 32-bit integer standing for the number of result elements
			iteration: A 32-bit integer standing for the length of the element
			iteration: Arbitrary data of the element
	]=]
	local name = assertstring(name)
	local args = args or {}
	local opts = opts or 0
	local req = struct.pack('>BBi4i4i4', 0xc8, 0x90, #name, opts, #args)
	req = req .. name
	for i, v in ipairs(args) do
		v = tostring(v)
		req = req .. struct.pack('>i4', #v) .. v
	end
	local res, err, emsg = self:send(req)
	if not res then return nil, err, emsg end
	-- get code
	local code, err, emgs = self:_receiveint8 ()
	if code == nil then return nil, err, emsg end
	if code == 0 then
		-- get rowsnum
		local rowsnum = self:_receiveint32 ()
		if rowsnum == nil then return nil, self.ERECV, 'misc: receiving rnum' end
		--get array data
		local results = {}
		for i=1, rowsnum do
			local size = self:_receiveint32 ()
			if size == nil or size <= 0 then return nil, self.ERECV, 'misc: receiving array data' end
			results[i] = self.socket:receive(size)
		end
		return results
	elseif code ~= 0 then
	 return nil, self.EMISC, 'misc: unknown receive code'
	end
	return nil, self.EMISC, 'misc: unknown'
end


function RemoteDatabase:genuid()
	local res, err, emsg = self:misc('genuid')
	if err then return nil, err, emsg end
	if istable(res) and #res == 1 and isstring(res[1]) then
		return res[1]
	end
	if err then return nil, self.ERECV, 'genuid: error' end
end

function RemoteDatabase:put(pkey, cols)
	local pkey = tostring(pkey)
	if type(cols) ~= 'table' then error("'cols' must be a table of columns") end
	local args = {pkey}
	for k,v in pairs(cols) do
		args[#args+1] = k
		args[#args+1] = v
	end
	local res, err, msg = self:misc("put", args, 0)
	if res == nil then return nil, err, msg end
	return true
end

function RemoteDatabase:get(pkey)
	local pkey = assertstring(pkey, 'get: pkey need to be string')
	local args = {pkey}
	local res, err, emsg = self:misc("get", args)
	if err then return nil, err, emsg end
	if istable(res) then
		if #res % 2 == 1 then return nil, self.ERECV, 'get: worng fields values' end
		local cols = {}
		for i=1, #res, 2 do
			cols[res[i]] = res[i+1]
		end
		return cols
	end
	
	return nil, self.EMISC, 'get: unknown'
end

function RemoteDatabase:stattable()
	--[=[stat: for the function `tcrdbstat'
    Request: [magic:2]
        Two bytes of the command ID: 0xC8 and 0x88
    Response: [code:1][ssiz:4][sbuf:*]
        An 8-bit integer whose value is always 0
        A 32-bit integer standing for the length of the status message
        Arbitrary data of the result 
	]=]
	local stat, err, emgs = self:stat()
	if stat == nil then
		return nil, err, emsg
	elseif isstring(stat) then
		local cols = {}
		-- TODO: test if this right with windows end lines
		for k, v in stat:gfind('(%S+)%s([^\n]+)[\r]?[\n\r]') do
			cols[k] = v
		end
		return cols
	end
	return nil, self.EMISC, 'stattable: unknown'
end


--- Remote Database Query Object
--( helper class for RDBTBL )--
local Query = { --query conditions:
	QCSTREQ = 0,	 --string is equal to
	QCSTRINC = 1,	--string is included in
	QCSTRBW = 2,	 --string begins with
	QCSTREW = 3,	 --string ends with
	QCSTRAND = 4,	--string includes all tokens in
	QCSTROR = 5,	 --string includes at least one token in
	QCSTROREQ = 6, --string is equal to at least one token in
	QCSTRRX = 7,	 --string matches regular expressions of
	QCNUMEQ = 8,	 --number is equal to
	QCNUMGT = 9,	 --number is greater than
	QCNUMGE = 10,	--number is greater than or equal to
	QCNUMLT = 11,	--number is less than
	QCNUMLE = 12,	--number is less than or equal to
	QCNUMBT = 13,	--number is between two tokens of
	QCNUMOREQ = 14,--number is equal to at least one token in
	QCFTSPH = 15,	--full-text search with the phrase of
	QCFTSAND = 16, --full-text search with all tokens in
	QCFTSOR = 17,	--full-text search with at least one token in
	QCFTSEX = 18,	--f-text search with the compound expression of
	QCNEGATE = 16777216, --negation flag
	QCNOIDX = 33554432,	--no index flag
	--order types:
	QOSTRASC = 0, --string ascending
	QOSTRDESC = 1,--string descending
	QONUMASC = 2, --number ascending
	QONUMDESC = 3,--number descending
}

function Query:new(rdb)
	self.rdb = asserttable(rdb)
	self.args = {}
end

---add a narrowing condition
--@param name	specifies a column name. if blank find in primary key.
--empty string indicates the primary key.
--@param op	specifies an operation type:
--QCSTREQ = 0,	 --string is equal to
--QCSTRINC = 1,	--string is included in
--QCSTRBW = 2,	 --string begins with
--QCSTREW = 3,	 --string ends with
--QCSTRAND = 4,	--string includes all tokens in
--QCSTROR = 5,	 --string includes at least one token in
--QCSTROREQ = 6, --string is equal to at least one token in
--QCSTRRX = 7,	 --string matches regular expressions of
--QCNUMEQ = 8,	 --number is equal to
--QCNUMGT = 9,	 --number is greater than
--QCNUMGE = 10,	--number is greater than or equal to
--QCNUMLT = 11,	--number is less than
--QCNUMLE = 12,	--number is less than or equal to
--QCNUMBT = 13,	--number is between two tokens of
--QCNUMOREQ = 14,--number is equal to at least one token in
--QCFTSPH = 15,	--full-text search with the phrase of
--QCFTSAND = 16, --full-text search with all tokens in
--QCFTSOR = 17,	--full-text search with at least one token in
--QCFTSEX = 18,	--f-text search with the compound expression of
--all ops can be flagged by bitwise-or:
--QCNEGATE = 1 << 24, --negation flag
--QCNOIDX = 1 << 25,	--no index flag
--@expr	specifies an operand expression
--@return	nil
function Query:addcond(name, op, expr, flags)
	local op = op
	local flags = flags or {}
	for i, flag in ipairs(flags) do
		op = flag + op
	end
	self.args[#self.args+1] = 'addcond'..'\0'..name..'\0'..tostring(op)..'\0'..expr
	return nil
end

---set result order
--@param name	specifies column name. empty string indicates the primary key.
--@param otype	specifies the order type:
--QOSTRASC = 0, --string ascending
--QOSTRDESC = 1,--string descending
--QONUMASC = 2, --number ascending
--QONUMDESC = 3,--number descending
--@return	nil
function Query:setorder(name, otype)
	self.args[#self.args+1] = 'setorder'..'\0'..name..'\0'..tostring(otype)
	return nil
end

---set maximum number of records for the result
--@param max	the maximum number of records. nil or negative means no limit
--@param skip the number of skipped records. nil or !>0 means none skipped
--@return	nil
function Query:setlimit(mx, skip)
	local mx = mx or -1
	local skip = skip or -1
	self.args[#self.args]= 'setlimit'..'\0'..tostring(mx)..'\0'..tostring(skip)
	return nil
end

---execute the search
--@return	array of primary keys of corresponding records
--or {}, error message
function Query:search()
	return self.rdb:misc('search', self.args)
end

--[[

---remove each corresponding record
--@return true or false, error message
function Query:searchout()
	self.args[#self.args+1] = 'out'
	local i = #self.args
	local res, err = self.rdb:misc('search', args, 0)
	table.remove(self.args, i)
	return res ~= nil or false, err
end

---get records corresponding to search
--due to protocol restriction, method cannot handle records with binary cols
--including the '\0' character
--@param names	specifies an array of colum names to fetch.
--empty string means the primary key
--nil means fetch every column
--@return	array of column hashes of corresponding records
--or {}, error message
function Query:searchget(names)
	if type(names) ~= 'table' then
		error("'names' must be an array of column names")
	end
	local args = {}
	if #names > 0 then
		args[1] = "get\0" .. table.concat(names, '\0')
	else args[1] = "get" end
	local res, err = self.rdb:misc('search', args, RDB.MONOULOG)
	if not res then return {}, err end
	for i,v in res do
		local cols = {}
		local func, str = strsplit(v, '\%z')
		while true do
			local kk, vv = func(str), func(str)
			if kk then cols[kk] = vv
			else break end
		end
		res[i] = cols
	end
	return res
end

---get the count of corresponding records
--@return	count or 0, error message
function Query:searchcount()
	local res, err = self.rdb:misc('search', {'count'}, RDB.MONOULOG)
	if not res then return 0, err end
	return tonumber(res[1])
end
]]
return {RemoteDatabase=RemoteDatabase, Query=Query}
