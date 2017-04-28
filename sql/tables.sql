Drop table if EXISTS`Rate`;
Drop table if EXISTS`Follow`;
Drop table if EXISTS`Comment`;
Drop table if EXISTS`Like`;
Drop table if EXISTS`Pledge`;
Drop table if EXISTS`sample`;
Drop table if EXISTS`project`;
Drop table if EXISTS`user`;

CREATE TABLE `User`(
	`uname`  VARCHAR(40) NOT NULL,
	`upwd`  BINARY(60) NULL,
	`name`   VARCHAR(40) NULL,
	`ccn`  VARCHAR(40) NULL,
	`email`  VARCHAR(40) NULL,
	`addr`  VARCHAR(40) NULL,
	`interest`  VARCHAR(40) NULL,
	PRIMARY KEY (`uname`)
);

CREATE TABLE `Project` (
	`pid` INT NOT NULL,
	`pname`  VARCHAR(40) NULL,
	`uname`  VARCHAR(40) NULL,
	`description`  VARCHAR(40) NULL,
    `profpic` VARCHAR(40) NULL, # filename of the profile picture
	`tag`   VARCHAR(40) NULL,
	`minamount` INT NULL,
    `maxamount` INT NULL,
    `curamount` INT NULL,
	`posttime`  DATETIME NULL,
	`status`   VARCHAR(40) NULL,
	`endtime`  DATETIME NULL,
    `actualendtime`  DATETIME NULL,
	`plannedcompletiontime`  DATETIME NULL,
	`actualcompletiontime`  DATETIME NULL,
	`progress`  INT NULL,
	PRIMARY KEY (`pid`),
	FOREIGN KEY (`uname`) REFERENCES `user`(`uname`)
);

CREATE TABLE `Sample` (
	`pid`  INT NOT NULL,
	`dir`  VARCHAR(40) NOT NULL,
	`uploadtime`  DATETIME NULL,
	PRIMARY KEY (`dir`),
	FOREIGN KEY (`pid`) REFERENCES `project`(`pid`)
);

CREATE TABLE `Pledge` (
	`uname` VARCHAR(40) NOT NULL,
	`pid`  INT NOT NULL,
	`amount` INT NULL,
	`time`  DATETIME NOT NULL,
	`charged` BOOLEAN NOT NULL,
	PRIMARY KEY (`pid`, `uname`, `time`),
	FOREIGN KEY (`pid`) REFERENCES `project`(`pid`),
    FOREIGN KEY (`uname`) REFERENCES `user`(`uname`)
);

CREATE TABLE `Like` (
	`uname` VARCHAR(40) NOT NULL,
	`pid`  INT NOT NULL,
	PRIMARY KEY (`pid`,`uname`),
	FOREIGN KEY (`pid`) REFERENCES `project`(`pid`),
    FOREIGN KEY (`uname`) REFERENCES `user`(`uname`)
);

CREATE TABLE `Comment` (
	`uname` VARCHAR(40) NOT NULL,
	`pid`  INT NOT NULL,
	`content` VARCHAR(40) NULL,
	`time`  DATETIME not NULL,
	PRIMARY KEY (`pid`,`uname`,`time`),
	FOREIGN KEY (`pid`) REFERENCES `project`(`pid`),
    FOREIGN KEY (`uname`) REFERENCES `user`(`uname`)
);

CREATE TABLE `Rate` (
	`uname` VARCHAR(40) NOT NULL,
	`pid`  INT NOT NULL,
	`score` FLOAT NULL,
	`time`  DATETIME NOT NULL,
	PRIMARY KEY (`pid`,`uname`,`time`),
	FOREIGN KEY (`pid`) REFERENCES `project`(`pid`),
    FOREIGN KEY (`uname`) REFERENCES `user`(`uname`)
);

CREATE TABLE `Follow` (
	`uname1` VARCHAR(40) NOT NULL,
	`uname2` VARCHAR(40) NOT NULL,
	PRIMARY KEY (`uname1`,`uname2`),
    FOREIGN KEY (`uname1`) REFERENCES `user`(`uname`),
    FOREIGN KEY (`uname2`) REFERENCES `user`(`uname`)
);