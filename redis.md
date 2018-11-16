Redis ��

string 

	���
			1��set key value [EX seconds] [PX milliseconds] [NX|XX]    ����key-value
				key:��
				value��ֵ
				EX seconds �� ���ü������
				PX millisseconds �� ���ú������
				[NX|XX] �� NX ��ʾ���key�������򴴽��������޲����������ǣ���XX ��ʾ����key�ڲ��ڶ������������򸲸ǣ���Ĭ����XX
					
			2��get key 	
			3��expire key seconds      ��key���ù���ʱ�䣨�룩
			4��pexpire key milliseconds  ��key���ù���ʱ�䣨���룩
			5��expireat key timestamp    ��key���ù���ʱ������룩
			5��pexpireat key milliseconds-timestamp    ��key���ù���ʱ��������룩
			5��setex key seconds value   ����key-value �����ù���ʱ�䣨�룩	
				�൱�� set key value ex seconds
				�൱�� set key value   ��  expire key seconds  �������
				
			6��psetex key milliseconds value 	
			
			7��setnx key value      ����key-value  �жϵ�ǰ�Ƿ����key ���ڼ������� �������ڲŴ�����
				�൱��  set key value nx
			
			
			8��incr key   ��key��valueֵ��һ ��valueֵ��Ҫ��������
				�൱��  incrby key 1
				
			9��incrby key increment   ��keyֵ�� increment
				increment �����Ǹ���
			
			10��decr key    ��keyֵ��1
				�൱��decrby key 1
			
			11��decrby key decrement   ��keyֵ�� decrement
				decrement�����Ǹ���
			
			12��strlen key    ����key�����ַ����ĳ���
			
			13��mset key value [key value .....]
			14��msetnx key value [key value.....]
			14��mget key [key....]
			15��incrbyfloat key increment
			16��append key value     ��key�������ַ�����ĩβ׷���ַ���  key�������򴴽�
			17��getset key value    �����µ�key����ַ��� �����ؾɵ��ַ���  key������ʱ���ɹ� ����nil
			18��getrange key start end   ��ȡkey�����ַ�����һ���� 
			19��setrange key offset value  ��key������ַ����ӱ�offset��ʼ�滻Ϊvalue  value�ж೤�滻�೤��   key�����ڻ��½�
			20��getbit key offset    �� key ��������ַ���ֵ����ȡָ��ƫ�����ϵ�λ(bit)��
			
list    ��  list��������������顣����ζ�Ų����ɾ���ǳ��죬ʱ�临�Ӷ�ΪO(1),����������λ���ѣ�ʱ�临�Ӷ�ΪO(n). ���б������һ��Ԫ��֮�󣬸����ݽṹ���ᱻ�Զ�ɾ�����ڴ汻���ա�
	
	
	���
			1��lpush key value [value ...]  ��һ��ֵ����ֵ�嵽����ͷ�� ���������������ȴ�������
			2��lpushx key value             ��һ��ֵ���뵽�Ѵ��ڵ�����ͷ����
			3��rpush key value [value ...]  ��һ��ֵ����ֵ�嵽����β���� �������������ȴ�������
			4��rpushx key value             ��һ��ֵ���뵽�Ѵ��ڵ������β��
			5��lpop key                     �Ƴ�����ȡ����ͷ����һ��ֵ
			6��rpop key                     �Ƴ�����ȡ����β����һ��ֵ
			7��rpoplpush score destination  �Ƴ��б�����һ��Ԫ�أ�������Ԫ����ӵ���һ�������ͷ�������أ� �����һ�������������½�
			8��blpop key [key ...] timeout  �Ƴ�����ȡ�б�ͷ��һ������Ԫ�أ�����б�û��Ԫ�ػ�ȴ��б�ֱ����ʱ���б���Ԫ��
			9��brpop key [key ...] timeout  �Ƴ�����ȡ�б�β��һ������Ԫ�أ�����б�û��Ԫ�ػ�ȴ��б�ֱ����ʱ���б���Ԫ��
			10��brpoplpush score destination timeout ���б�ͷ������һ��Ԫ���붼��һ���б�ͷ������ã�����б���û��Ԫ�ػ�ȴ��б�ֱ����ʱ���б���Ԫ��
			11��lindex key index            ͨ��������ȡ�б��е�Ԫ��
			13��llen key                    ����б�ĳ���
			14��lrange key start end        ����б�ָ����Χ�ڵ�Ԫ��
			15��lrem key count value        ���б����Ƴ�count��Ԫ��
			16��lset ket index value        �����±��滻�б��е�Ԫ��
			17: ltrim key start end         ���б�ü���ֻ����ָ�������ڵ�Ԫ�أ������ȫ������
	
			
		�ҽ������ ����
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
			
		�ҽ��ҳ��� ջ
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

hash    :   �����ֵ� ������������ά�ṹ  ��  Redis���ֵ�ֵֻ�����ַ�����redis�ǽ���ʽrehash������rehash��ͬʱ��������hash�ṹ����ѯʱ��ͬʱ��ѯ����hsah�ṹ��
																							   Ȼ���ٺ����Ķ�ʱ�������Լ�hash����ָ���У�ѭ�򽥽��Ľ���hash��
																							   ����һ��һ���Ǩ�Ƶ��µ�hash�ṹ�С�����Ǩ��ɺ󣬾ͻ����µ�hash
																							   ���ȡ����֮��
																							   
    ���																							   
			 
			1��hset key field value             ��hash���е��ֶ�field��ֵ����Ϊvalue
			2��hmset key field value [field value ...]  ��������
			3��hsetnx key faild value           ����ǰ���ж�hash�����Ƿ�����ֶ�faild��ֻ��faild������ʱ��������
			4��hget key field                   ��ȡhash���е��ֶ�field��ֵ
			5��hmget key [key ...]              ������ȡ
			6��hgetall key                      ���hash���е�����faild�� ��  valueֵ
			7��hvals key                        ���hash���������ֶε�valueֵ
			8��hkeys key                        ���hash�������е��ֶ���
			9��hdel key field [field ...]       ɾ��hash���е�һ�����߶��field
			10��hexists key field               �ж�hash�����Ƿ�����ֶ�
			11��hlen key                        ���hash��ĳ���
			12��hincrby key field increment     ��hash����ֶ�ֵ�� increment  ������ ��ΪС����
			13��hincrbyfloat key field increment ��hash����ֶ�ֵ�� increment �������� ��ΪС����
			
		
			
set     ��  ��ֵ���������Ψһ�� �൱��һ��������ֵ䣬�ֵ������е�value����һ��ֵnull
			
			
	����:  
			1��sadd key member [member ...]          �����򼯺������һ�����߶��Ԫ��
			2��scard key                             ��ȡ���򼯺���Ԫ�ص�����
			3��sdiff key [key ....]                  ��ø�������м��ϵĲ
			4��sdiffstore destination key [key ...]  ��ò���ڼ���destination��
			5��sinter key [key ...]                  ��ø��������м��ϵĽ���
			6��sinterstore destination key [key ...] ��ý������ڼ���destination��
			7��sismember key member                  �ж�Ԫ���Ƿ��ڼ�����
			8��smembers key                          ��ü������е�Ԫ��
			9��smove source destination member       ��memberԪ�ش�source�����Ƶ�destination������
			10��spop key member [count]              ����Ƴ�����ü�����count��Ԫ��  countĬ��1
			11��srandmember key [count]              ���ؼ�����һ�����߶��Ԫ�� countĬ��1
			12��srem key member [member ...]         �Ƴ�������һ������Ԫ��
			13��sunion key [key ...]                 ���ظ������ϵĲ���
			14��sunionstore destination key [key ...] ���ظ������ϵĲ�����������destination��
			15��sscan key cursor [MATCH pattern] [Count count]       ����ʽ����
			
			
			
sirted set��zset��    ��  ���򼯺�		   һ��������һ��set����֤���ڲ�value��Ψһ�ԣ���һ���������Ը�ÿ��value����һ��score���������value������Ȩ�ء������ڲ�ʵ���õ���һ����Ծ�б�����ݽṹ��	
			
	���
			1��zadd key [incr] score member [score member ...]         �����򼯺����һ��������Ա�����߸����Ѵ��ڳ�Ա�ķ���  incr�Ǽӷ�
			2: zcard key                                               ������򼯺ϵĳ�Ա����  
			3��zcount key min max                                      ������򼯺�ָ�����������Ա����
			4��zincrby key increment member                            ��һ��Ա�������� increment(�����Ǹ���)
			5��zinterstore destination numkeys key [key ...] [weights weight] [aggregate sum|min|max]    ��ȡ���������򼯺ϵĽ����������µ����򼯺�destination�У����������򼯺�������keysnumָ��
			6��zlexcount key min max                                   �������򼯺���ָ���ֵ������ڳ�Ա����                   
			7��zrange key start stop [withscores]                      ������򼯺��������ڵĳ�Ա [withscores] �ѷ���Ҳ���  ��ͨ��������
			8��zrangebylex key min max [limit offset count]            ���ݳ�Աֵ�����ó�Ա    ��ͨ����Ա��
			9: zrangebyscore key min max [limit offset count]          ���ݳ�Ա������ó�Ա        ��ͨ��������
			10��zrank key  member                                      ��ü���ָ����Ա
			11��zrem key member [member ...]                           �Ƴ�������һ�����߶����Ա
			12��zremrangebylex key min max                             �Ƴ������и����ֵ���������г�Ա
			13��zremrangebyscore key min max                           �Ƴ������и���������������г�Ա
			14��zremrangebyrank key min max                            �Ƴ������и���������������г�Ա
			15��zrevrange key start stop [withscores]                  �����ø�����������������г�Ա ��ͨ��������
			16��zrevrangebyscore key max min [withscores] [limit offset count]    �����ø�����������������г�Ա ��ͨ��������
			17: zrevrank key member                                    �������򼯺���ָ����Ա�����������򼯳�Ա������ֵ�ݼ�(�Ӵ�С)����
			18: zscore key member                                      ���ظ�����Ա�ķ���
			19��zunionstore  destination numkeys key [key ...] [weights weight] [aggregate sum|min|max] ��ȡ���������򼯺ϵĲ����������µ����򼯺�destination�У����������򼯺�������keysnumָ��
			20��zscan key cursor [MATCH pattern] [Count count]        ����ʽ����
			
			
list hash set zset ���������ݽṹ�����������ݽṹ������������������
	1.������������ڣ��Ǿʹ���һ���ڽ��в�����
	2.��������е�Ԫ��û��û����ô����ɾ���������ͷ��ڴ档
	
redis ���е����ݽṹ���������ù���ʱ�䣬ʱ�䵽��Ԫ���Զ�ɾ������Ҫע����ǹ������Զ���Ϊ��λ�ģ�����һ��hash�ṹ����������hash����Ĺ��ڣ����������е�ĳ����key
����Ҫ�ر�ע��������һ���ַ��������˹���ʱ�䣬Ȼ���������set�����޸����������Ĺ���ʱ�����ʧ��





5��1���ݽṹ���ó�����
	string  �����û���Ϣ���û���Ϣʹ��json���л����ַ�����
	lsit    ��Ӵ�������첽���С�����Ҫ�Ӻ��������ṹ�����л����ַ�������redis���б���һ���̴߳�����б�����ѯ���ݽ��д���
	hash    Ҳ��������������
	set     �����洢��н��û�ID����Ϊ��ȥ�ع��ܣ���֤һ���û������н����Ρ�
	zset    �����洢��˿�б�valueֵ�Ƿ�˿��ID��score�ǹ�עʱ�䡣���ԶԷ�˿�б���עʱ���������
			�洢ѧ���ɼ���value��ѧ��ID��score��ѧ���ɼ������ԶԳɼ���������