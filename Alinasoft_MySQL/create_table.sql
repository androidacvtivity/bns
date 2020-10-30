

CREATE TABLE `spacecraftstb` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(150) NOT NULL,
   `propellant` VARCHAR(150) NOT NULL,
	`destination` VARCHAR(150) NOT NULL,
	`image_url` VARCHAR(150) NOT NULL,
	`technology_exists`  TINYINT (4) NOT NULL,
	
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=MyISAM
AUTO_INCREMENT=80
;


-- 
-- -----------------
-- 
-- 
-- CREATE TABLE `users` (
-- 	`user_id` INT(11) NOT NULL AUTO_INCREMENT,
-- 	`first_name` VARCHAR(25) NOT NULL,
-- 	`last_name` VARCHAR(25) NOT NULL,
-- 	`user_city` VARCHAR(50) NOT NULL,
-- 	PRIMARY KEY (`user_id`)
-- )
-- COLLATE='latin1_swedish_ci'
-- ENGINE=MyISAM
-- AUTO_INCREMENT=80
-- ;
