create table `book_category` (
	`category_id` bigint unsigned not null auto_increment,
	`category_name` varchar(64) not null comment '类别名称',
	`create_time` datetime not null default current_timestamp comment '创建时间',
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '修改时间',
	primary key(`category_id`)
) comment '类别表';

create table `book_info` (
	`book_id` bigint unsigned not null auto_increment,
	`book_name` varchar(64) not null comment '商品名称',
	`book_price` decimal(8,2) not null comment '商品价格',
	`book_image` varchar(255) comment '封面',
	`book_description` varchar(512) comment '描述',
	`category_id` int not null comment '书籍类别',
	`create_time` datetime not null default current_timestamp comment '创建时间',
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '修改时间',
	primary key(`book_id`)
) comment '书籍表';

create table `order_master` (
	`order_id` bigint unsigned not null auto_increment,
	`buyer_id` int not null comment '买家ID',
	`order_amount` decimal(10,2) not null comment '订单总金额',
	`order_status` tinyint(3) not null default '0' comment '订单状态,0新订单,1已完成订单',
	`create_time` datetime not null default current_timestamp comment '创建时间',
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '修改时间',
	primary key (`order_id`),
	key `idx_buyer_id`(`buyer_id`)
) comment '订单总表';

create table `order_detail` (
	`detail_id` bigint unsigned not null auto_increment,
	`order_id` bigint unsigned not null,
	`book_id` varchar(32) not null,
	`book_number` int not null comment '商品数量',
	`create_time` datetime not null default current_timestamp comment '创建时间',
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '修改时间',
	primary key (detail_id)
) comment '订单明细表';

create table `buyer_info` (
	`buyer_id` bigint unsigned not null auto_increment,
	`buyer_name` varchar(32) not null comment '买家名字',
	`buyer_email` varchar(32) not null comment '买家邮箱',
	`buyer_phone` varchar(32) not null comment '买家电话',
	`buyer_address` varchar(255) not null comment '买家地址',
	`buyer_password` varchar(16) not null comment '买家密码',
	`create_time` datetime not null default current_timestamp comment '创建时间',
	`update_time` datetime not null default current_timestamp on update current_timestamp comment '修改时间',
	primary key(`buyer_id`)
) comment '买家信息表';