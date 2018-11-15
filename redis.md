Redis ��

string 

	���
			1.set  get   ���û�ȡ   set key value    get key
			2.expire   ���ñ�������ʱ��    expire key 5
			3.setex    setex hyj 5 hhhh   ��ֵ����������������5�����ʱ�䣬��ͬ�� set hyj hhhh       expire hyj 5   ��������
			4.setnx    ������������ڼ��ɴ����ɹ� ����ʧ��  setnx key value
		���ڼ���  ��Ҫvalue����������	
            5.incr     ����1 ����Ҫvalue������   set age 30   incr age   get age   //30    									
			6.incrby   ���Ӽ���    set age 30    incrby age 5   get age   //35       ������ֵ�����Ǹ�������Ϊ��   ��ͬ��decrby
			7.decr     �Լ�1 ��  set age 30   decr age          get age   //29
			8.decrby   ���ټ���  set age 30   decrby age 7      get age 5    //25    ���ٵ����������Ǹ�������Ϊ�ӣ���ͬ��decrby
			
			
list    ��  list��������������顣����ζ�Ų����ɾ���ǳ��죬ʱ�临�Ӷ�ΪO(1),����������λ���ѣ�ʱ�临�Ӷ�ΪO(n). ���б������һ��Ԫ��֮�󣬸����ݽṹ���ᱻ�Զ�ɾ�����ڴ汻���ա�
	
	books �� {'php'}
	���
	        1.rpush  ���ұ߲����б�   rpush books python java           //{'php','python','java'}
			2.lpush  ����߲����б�   lpush books c c++ C#              //{'c#','c++','c','php','python','java'}
			3.rpop   ���ұߵ����б�   rpop  books                       //java
			4.lpop   ����ߵ����б�   lpop  books                       //c#
			5.llen   �б���
			6.lindex ��Ҫ��������б��� ��������index��������    O(n)   lindex list index
			7.ltrim  ��������˼���ϴ󣬽�lretain���������ȽϺ��ʣ���Ϊltrim����������start_index �� end_index ����һ�����䣬����������ڵ�ֵ��ltrimҪ����������֮���ͳͳ������������ltrim��ʵ��һ����������������Ҫ��   ltrim list start_inde end_index
			8.lrange ��ȡ����Ԫ�� O(n) 	  lrange list 0 -1
						index �����Ǹ���  -1��ʾ���һ��  -2 ��ʾ�����ڶ���
			
			
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
            1.hset      hset books java ��think in java��			 hset books java "think in java" php "php����õ�����"																				    
			2.hget      
			3.hgetall
			4.hlen
			5.hincrby 
			
set     ��  ��ֱ���������Ψһ�� �൱��һ��������ֵ䣬�ֵ������е�value����һ��ֵnull
			
			
			1.sadd     sadd books java php
			2.smembers books   ���set������
			3.sismember    �ж�ĳ��value�Ƿ����
			4.scard  ��ȡ����
			5.spop key [count]  ����
			
zset    ��  ���򼯺�		   һ��������һ��set����֤���ڲ�value��Ψһ�ԣ���һ���������Ը�ÿ��value����һ��score���������value������Ȩ�ء������ڲ�ʵ���õ���һ����Ծ�б�����ݽṹ��	
			
			
			1.zadd key score value [score [value] ...]
			2.zrage key 0 -1   ��score����
			3.zrevrange key 0 -1  ��score ����
			4.zcard key   �൱��count
			5.zscore key value   ����value���score  
			6.zrank key value   �������
			7.zrangebyscore key start_score end_score             //zrangebyscore key -inf 8.91 withscores             ���ݷ�ֵ���䣨-�����8.91] ����zset   ind ����infinite��������˼
			8.zrem key value   ɾ��
			
			
			
			
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