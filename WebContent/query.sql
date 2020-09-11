CREATE TABLE t_user(
	i_user INT unsigned PRIMARY KEY AUTO_INCREMENT,
	user_id varchar(30) NOT NULL UNIQUE,
	user_pw varchar(70) NOT NULL,
	salt VARCHAR(30) NOT NULL,
	nm varchar(5) NOT NULL,
	profile_img VARCHAR(50),
	r_dt DATETIME DEFAULT NOW(),
	m_dt DATETIME DEFAULT NOW()
);

Select * FROM t_user;

DROP TABLE t_restaurant;
                    
CREATE TABLE t_restaurant(
	i_rest INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nm VARCHAR(20) NOT NULL,
	addr VARCHAR(100) NOT NULL,
	lat DOUBLE UNSIGNED NOT NULL,
	lng DOUBLE UNSIGNED NOT NULL,
	cd_category INT UNSIGNED NOT NULL,
	i_user INT UNSIGNED NOT NULL,
	r_dt DATETIME DEFAULT NOW(),
	m_dt DATETIME DEFAULT NOW(),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user)
);

Select * FROM t_restaurant;

INSERT INTO t_restaurant (nm, addr, lat, lng, cd_category, i_user)
VALUES ('테스트','대구', 1, 2, 1, 1);

CREATE TABLE c_code_m(
	i_m INT UNSIGNED PRIMARY KEY,
	`desc` VARCHAR(30) DEFAULT '',
	cd_nm VARCHAR(10) DEFAULT ''
	);

CREATE TABLE c_code_d(
	i_m INT UNSIGNED,
	cd INT UNSIGNED,
	val VARCHAR(15) NOT NULL,
	PRIMARY KEY(i_m, cd),
	FOREIGN KEY(i_m) REFERENCES c_code_m(i_m)
);
-- 포린키 거는 이유 : 잘못된값을 넣지 않기 위해

CREATE TABLE t_restaurant_recommend_menu (
	i_rest INT UNSIGNED,
	seq INT UNSIGNED,
	menu_nm VARCHAR(20) NOT NULL,
	menu_price INT UNSIGNED NOT NULL,
	menu_pic VARCHAR(50),
	PRIMARY KEY(i_rest, seq),
	FOREIGN KEY(i_rest) REFERENCES t_restaurant(i_rest)
);

c_code_mCREATE TABLE t_restaurant_menu (
	i_rest INT UNSIGNED,
	seq INT UNSIGNED,
	menu_pic VARCHAR(50),
	PRIMARY KEY(i_rest, seq),
	FOREIGN KEY(i_rest) REFERENCES t_restaurant(i_rest)
);


