create databases if not exists food;
CREATE TABLE if not exists `food` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf-8;

insert  into `food`(`id`,`name`) values (1,'food1');
insert  into `food`(`id`,`name`) values (2,'food2');
insert  into `food`(`id`,`name`) values (3,'food3');
insert  into `food`(`id`,`name`) values (4,'food4');
insert  into `food`(`id`,`name`) values (5,'food5');
insert  into `food`(`id`,`name`) values (6,'food6');
insert  into `food`(`id`,`name`) values (7,'food7');
insert  into `food`(`id`,`name`) values (8,'food8');
insert  into `food`(`id`,`name`) values (9,'food9');
insert  into `food`(`id`,`name`) values (10,'food10');
insert  into `food`(`id`,`name`) values (11,'food11');
insert  into `food`(`id`,`name`) values (12,'food12');