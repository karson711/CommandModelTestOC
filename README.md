# CommandModelTestOC
命令模式OC版：优化进阶
命令模式-案例分析-加强理解？->泛型设计
	案例一：原始案例->俄罗斯方块

	案例二：命令模式-案例设计

	案例三：命令模式-案例进阶-撤销功能

	案例四：命令模式-案例进阶-动态调用->代码优化第一步
		第一步：分析问题？
			很多命令类？->类爆炸（开发中巨大问题）
			冗余
		第二步：解决方案？
			动态命令：好处在于我们不需要新建各种命令类
			block实现
		第三步：解决问题？->实现功能？
			命令模式变种（今后当你看到了这些代码结构你要清楚知道这是命令模式变种）->DynamicCommand
			回调方式：协议、block、通知
			动态命令管理器->DynamicCommandManager
		第四步：分析调用流程？
			1、添加命令->调用了addCommand方法
			2、创建命令->createCommand创建命令
				注意：创建了一个block，将block作为了参数传递
			3、保存block->赋值给属性
			4、调用撤销->undo方法
			5、执行命令->执行DynamicCommand对象中的execute方法
			6、回调block
			7、执行tm方法->toTransform()
			架构设计->设计模式->需要你课后复习->反复理解(掌握)
			撤销
			
	案例五：命令模式-案例进阶-复合命令->优化第二步
		命令变种->复合命令：执行多个命令
		第一步：新建一个复合命令->WrapperCommand
			特点：实现协议->TMCommandProtocol
			框架设计有点枯燥->一旦你笑话了，你功力绝对大增
		第二步：新建一个复合命令管理器->WrapperCommandManager
		
		第三步：总结
			以后你看到了这样的代码结构，框架结构，你要清楚知道这是复合命令（变种）

	案例六：命令模式-案例进阶-泛型命令->优化第三步->系统NSUndoManager实现
		重申一次：框架设计->NSUndoManager？->课程就会应用框架
		第一步：什么是泛型？
			在定义的时候不需要指定类型，在使用的时候指定类型。
		第二步：泛型基础知识普及？->档次至少提高2个逼格
			OC、Swift、Java、C++…
			OC、Swift、Java泛型
			C++称之为模版类，模版函数
		第三步：学习泛型？
			1、新建一个泛型类->泛型命令->GenericsCommand
				注意：id是指向泛型类型引用
			2、新建一个命令管理类->泛型命令->GenericsCommandManager
		
	案例七：命令模式-案例进阶-并发处理
		1、分析问题？
			多线程当中存在同时缓存命令
		2、解决方案？	
			多线程->队列
		3、功能实现？
			第一步：定义一个并发管理器->QueueCommandMananger

	案例八：命令模式-案例进阶-block命令（优化）
		之前：用的协议
		现在：block实现
		第一步：定义一个BlockCommandManager命令
		为什么有的地方用T，有的地方用id？
			规定：
				1、声明文件中->指定泛型->T
				2、实现文件中->指定具体类型(id万能指针->引用->指向任意对象)
