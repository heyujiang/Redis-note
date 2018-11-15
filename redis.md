Redis ：

string 

	命令；
			1.set  get   设置获取   set key value    get key
			2.expire   设置变量过期时间    expire key 5
			3.setex    setex hyj 5 hhhh   赋值变量并给变量设置5秒国企时间，等同于 set hyj hhhh       expire hyj 5   两个命令
			4.setnx    如果变量不存在即可创建成功 否则失败  setnx key value
		用于计数  需要value是是整数；	
            5.incr     自增1 ，需要value是整数   set age 30   incr age   get age   //30    									
			6.incrby   增加几个    set age 30    incrby age 5   get age   //35       增加数值可以是负数，即为减   等同于decrby
			7.decr     自减1 ，  set age 30   decr age          get age   //29
			8.decrby   减少几个  set age 30   decrby age 7      get age 5    //25    减少的数量可以是负数，即为加，等同于decrby
			
			
list    ：  list是链表而不是数组。这意味着插入和删除非常快，时间复杂度为O(1),但是索引定位很难，时间复杂度为O(n). 当列表弹出最后一个元素之后，该数据结构将会被自动删除，内存被回收。
	
	books ： {'php'}
	命令：
	        1.rpush  从右边插入列表   rpush books python java           //{'php','python','java'}
			2.lpush  从左边插入列表   lpush books c c++ C#              //{'c#','c++','c','php','python','java'}
			3.rpop   从右边弹出列表   rpop  books                       //java
			4.lpop   从左边弹出列表   lpop  books                       //c#
			5.llen   列表长度
			6.lindex 需要对链表进行遍历 性能随着index增大而变差    O(n)   lindex list index
			7.ltrim  和字面意思相差较大，叫lretain（保留）比较合适，因为ltrim跟两个参数start_index 和 end_index 定义一个区间，在这个区间内的值，ltrim要保留，区间之外的统统砍掉，可以用ltrim来实现一个定常的链表（很重要）   ltrim list start_inde end_index
			8.lrange 获取所有元素 O(n) 	  lrange list 0 -1
						index 可以是负数  -1表示最后一个  -2 表示倒数第二个
			
			
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
            1.hset      hset books java “think in java”			 hset books java "think in java" php "php是最好的语言"																				    
			2.hget      
			3.hgetall
			4.hlen
			5.hincrby 
			
set     ：  简直对是无序的唯一的 相当于一个特殊的字典，字典中所有的value都是一个值null
			
			
			1.sadd     sadd books java php
			2.smembers books   获得set中所有
			3.sismember    判断某个value是否存在
			4.scard  获取长度
			5.spop key [count]  弹出
			
zset    ：  有序集合		   一方面它是一个set，保证了内部value的唯一性，另一方面他可以给每个value赋予一个score，代表这个value的排序权重。它的内部实现用的是一种跳跃列表的数据结构。	
			
			
			1.zadd key score value [score [value] ...]
			2.zrage key 0 -1   按score正序
			3.zrevrange key 0 -1  按score 倒序
			4.zcard key   相当与count
			5.zscore key value   根据value获得score  
			6.zrank key value   获得排名
			7.zrangebyscore key start_score end_score             //zrangebyscore key -inf 8.91 withscores             根据分值区间（-无穷大，8.91] 遍历zset   ind 代表infinite无穷大的意思
			8.zrem key value   删除
			
			
			
			
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