Redis ：

string 

	命令；
			1；set key value [EX seconds] [PX milliseconds] [NX|XX]    创建key-value
				key:键
				value：值
				EX seconds ： 设置几秒过期
				PX millisseconds ： 设置毫秒过期
				[NX|XX] ： NX 表示如果key不存在则创建，存在无操作（不覆盖）。XX 表示无论key在不在都创建（创建或覆盖），默认是XX
					
			2：get key 	
			3：expire key seconds      给key设置过期时间（秒）
			4：pexpire key milliseconds  给key设置过期时间（毫秒）
			5：expireat key timestamp    给key设置过期时间戳（秒）
			5：pexpireat key milliseconds-timestamp    给key设置过期时间戳（毫秒）
			5：setex key seconds value   创建key-value 并设置过期时间（秒）	
				相当于 set key value ex seconds
				相当于 set key value   和  expire key seconds  两个命令。
				
			6；psetex key milliseconds value 	
			
			7：setnx key value      创建key-value  判断当前是否存在key 存在即不创建 ，不存在才创建。
				相当于  set key value nx
			
			
			8：incr key   给key的value值加一 （value值需要是整数）
				相当与  incrby key 1
				
			9：incrby key increment   给key值加 increment
				increment 可以是负数
			
			10：decr key    给key值减1
				相当于decrby key 1
			
			11：decrby key decrement   给key值减 decrement
				decrement可以是负数
			
			12：strlen key    返回key所存字符串的长度
			
			13：mset key value [key value .....]
			14：msetnx key value [key value.....]
			14：mget key [key....]
			15：incrbyfloat key increment
			16：append key value     向key的所存字符串的末尾追加字符串  key不存在则创建
			17：getset key value    设置新的key存的字符串 并返回旧的字符串  key不存在时不成功 返回nil
			18：getrange key start end   获取key所存字符串的一部分 
			19：setrange key offset value  将key所存的字符串从标offset开始替换为value  value有多长替换多长。   key不存在会新建
			20：getbit key offset    对 key 所储存的字符串值，获取指定偏移量上的位(bit)。
			
list    ：  list是链表而不是数组。这意味着插入和删除非常快，时间复杂度为O(1),但是索引定位很难，时间复杂度为O(n). 当列表弹出最后一个元素之后，该数据结构将会被自动删除，内存被回收。
	
	
	命令：
			1：lpush key value [value ...]  将一个值或多个值插到链表头部 ，；链表不存在则先创建链表
			2：lpushx key value             将一个值插入到已存在的链表头部。
			3：rpush key value [value ...]  将一个值或多个值插到链表尾部， ；链表不存在则先创建链表
			4：rpushx key value             将一个值插入到已存在的链表的尾部
			5：lpop key                     移出并获取链表头部第一个值
			6：rpop key                     移出并获取链表尾部第一个值
			7：rpoplpush score destination  移出列表的最后一个元素，并将该元素添加到另一个链表的头部并返回； 如果另一个链表不存在则新建
			8：blpop key [key ...] timeout  移出并获取列表头部一个或多个元素，如果列表没有元素会等待列表直到超时或列表有元素
			9：brpop key [key ...] timeout  移出并获取列表尾部一个或多个元素，如果列表没有元素会等待列表直到超时或列表有元素
			10：brpoplpush score destination timeout 从列表头部弹出一个元插入都另一个列表头部并获得，如果列表中没有元素会等待列表直到超时或列表有元素
			11：lindex key index            通过索引获取列表中的元素
			13：llen key                    获得列表的长度
			14：lrange key start end        获得列表指定范围内的元素
			15：lrem key count value        从列表中移出count个元素
			16：lset ket index value        根据下表替换列表中的元素
			17: ltrim key start end         对列表裁剪，只保留指定区域内的元素，其余的全部剪除
	
			
		右近左出： 队列
			> rpush books java php python
			(integer) 3
			> llen books
            (integer) 3
			> lpop books
			"java"	
			> lpop books
			"php"
			> lpop books
			"python"
			> lpop books
			(nil)
			
		右进右出： 栈
			> rpush books java php python 
			(integer) 3
			>llen
			(integer) 3
			>rpop booke
			"python"
			>rpop books
			"php"
			>rpop books
			"java"
			>rpop books
			(nil)

hash    :   无序字典 ，数组加链表二维结构  ；  Redis的字典值只能是字符串。redis是渐进式rehash：会在rehash的同时保留两个hash结构，查询时会同时查询两个hsah结构，
																							   然后再后续的定时任务中以及hash操作指令中，循序渐进的将旧hash的
																							   内容一点一点的迁移到新的hash结构中。当搬迁完成后，就会用新的hash
																							   结后取而代之。
																							   
    命令：																							   
			 
			1：hset key field value             将hash表中的字段field的值设置为value
			2：hmset key field value [field value ...]  批量设置
			3：hsetnx key faild value           设置前先判断hash表中是否存在字段faild，只有faild不存在时才能设置
			4：hget key field                   获取hash表中的字段field的值
			5：hmget key [key ...]              批量获取
			6：hgetall key                      获得hash表中的所有faild名 和  value值
			7：hvals key                        获得hash表中所有字段的value值
			8：hkeys key                        获得hash表中所有的字段名
			9：hdel key field [field ...]       删除hash表中的一个或者多个field
			10：hexists key field               判断hash表中是否存在字段
			11：hlen key                        获得hash表的长度
			12：hincrby key field increment     将hash表的字段值加 increment  （整数 可为小数）
			13：hincrbyfloat key field increment 将hash表的字段值加 increment （浮点数 可为小数）
			
		
			
set     ：  键值对是无序的唯一的 相当于一个特殊的字典，字典中所有的value都是一个值null
			
			
	命令:  
			1：sadd key member [member ...]          向无序集合中添加一个或者多个元素
			2：scard key                             获取无序集合中元素的数量
			3：sdiff key [key ....]                  获得给予的所有集合的差集
			4：sdiffstore destination key [key ...]  获得差集存在集合destination中
			5：sinter key [key ...]                  获得给出的所有集合的交集
			6：sinterstore destination key [key ...] 获得交集存在集合destination中
			7：sismember key member                  判断元素是否在集合中
			8：smembers key                          获得集合所有的元素
			9：smove source destination member       将member元素从source集合移到destination集合中
			10：spop key member [count]              随机移出并获得集合中count个元素  count默认1
			11：srandmember key [count]              返回集合中一个或者多个元素 count默认1
			12：srem key member [member ...]         移出集合中一个或多个元素
			13：sunion key [key ...]                 返回给定集合的并集
			14：sunionstore destination key [key ...] 返回给定集合的并集并保存在destination中
			15：sscan key cursor [MATCH pattern] [Count count]       增量式迭代
			
			
			
sirted set（zset）    ：  有序集合		   一方面它是一个set，保证了内部value的唯一性，另一方面他可以给每个value赋予一个score，代表这个value的排序权重。它的内部实现用的是一种跳跃列表的数据结构。	
			
	命令：
			1：zadd key [incr] score member [score member ...]         向有序集合添加一个或多个成员，或者更新已存在成员的分数  incr是加分
			2: zcard key                                               获得有序集合的成员个数  
			3：zcount key min max                                      获得有序集合指定分数区间成员个数
			4：zincrby key increment member                            给一成员分数增加 increment(可以是负数)
			5：zinterstore destination numkeys key [key ...] [weights weight] [aggregate sum|min|max]    获取给出的有序集合的交集保存在新的有序集合destination中，给出的有序集合数量有keysnum指定
			6：zlexcount key min max                                   计算有序集合中指定字典区间内成员数量                   
			7：zrange key start stop [withscores]                      获得有序集合中区间内的成员 [withscores] 把分数也获得  （通过索引）
			8：zrangebylex key min max [limit offset count]            根据成员值区间获得成员    （通过成员）
			9: zrangebyscore key min max [limit offset count]          根据成员分数获得成员        （通过分数）
			10：zrank key  member                                      获得集合指定成员
			11：zrem key member [member ...]                           移除集合中一个或者多个成员
			12：zremrangebylex key min max                             移出集合中给定字典区域的所有成员
			13：zremrangebyscore key min max                           移出集合中给定分数区间的所有成员
			14：zremrangebyrank key min max                            移出集合中给定排名区间的所有成员
			15：zrevrange key start stop [withscores]                  倒序获得给定索引区间类的所有成员 （通过索引）
			16：zrevrangebyscore key max min [withscores] [limit offset count]    倒序获得给定分数区间类的所有成员 （通过分数）
			17: zrevrank key member                                    返回有序集合中指定成员的排名，有序集成员按分数值递减(从大到小)排序
			18: zscore key member                                      返回给定成员的分数
			19：zunionstore  destination numkeys key [key ...] [weights weight] [aggregate sum|min|max] 获取给出的有序集合的并集保存在新的有序集合destination中，给出的有序集合数量有keysnum指定
			20：zscan key cursor [MATCH pattern] [Count count]        增量式迭代
			
			
list hash set zset 这四种数据结构是容器型数据结构，共享下面两条规则：
	1.如果容器不存在，那就创建一个在进行操作。
	2.如果容器中的元素没有没，那么立即删除容器，释放内存。
	
redis 所有的数据结构都可以设置过期时间，时间到了元素自动删除。需要注意的是过期是以对象为单位的，比如一个hash结构过期是整个hash对象的过期，而不是其中的某个子key
还需要特别注意的是如果一个字符串设置了过期时间，然后你调用了set方法修改了它，他的过期时间会消失。





5种1数据结构常用场景：
	string  缓存用户信息。用户信息使用json序列化成字符串。
	lsit    长哟过来坐异步队列。将需要延后处理的任务结构体序列化成字符串塞进redis的列表，另一个线程从这个列表中轮询数据进行处理
	hash    也可以用来做缓存
	set     用来存储活动中奖用户ID，因为又去重功能，保证一个用户不会中奖两次。
	zset    用来存储粉丝列表，value值是粉丝的ID，score是关注时间。可以对粉丝列表按关注时间进行排序
			存储学生成绩，value是学生ID，score是学生成绩。可以对成绩进行排序