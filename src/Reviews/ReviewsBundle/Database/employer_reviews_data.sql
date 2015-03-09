USE employerreviews;

SET foreign_key_checks = 0;

DELETE FROM employer;
INSERT INTO employer 
(	
	employer_id,
	name,
	type,
	sector,
	average_rating
)
VALUES 
(
	1582792,
	'ProtonProductions',
	'Sole Trader,',
	'Entertainment',
	0
);

DELETE FROM employer_type;
INSERT INTO employer_type
(
	employer_type_id,
	employer_type_name,
	employer_type_description
) 
VALUES
(
	1,
	'Sole Trader',
	'A Single Person Business'
),
(
	2,
	'Company',
	'A group of workers and at least a manager'
);

DELETE FROM employer_sector;
INSERT INTO employer_sector
(
	employer_sector_id,
	employer_sector_name,
	employer_sector_description
)
VALUES
(
	1,
	'Entertainment',
	'Music Theartre Film'
),
(
	2,
	'Telecommunication',
	'Mobile and Land line related industry'
);

DELETE FROM users;
INSERT INTO users
(
	user_id,
	username,
	first,
	last
)
VALUES
(
	1,
	'stassolodkin',
	'Stas',
	'Solodkin'
);

DELETE FROM review;
INSERT INTO review (
	review_id,
	employer_id,
	user_id,
	review_positive,
	position,
	review_rating,
	review_story
)
VALUES
(
	123745,
	1582792,
	1,
	'T',
	'Recording Engineer',
	10,
	"It is an awesome experience, not only because music industry is the most interesting industry to work in, but also because my boss, Stas Solodkin, is also one of the best bosses ever. I truly am lucky working for Protone Productions!"
);

DELETE FROM employer_contact;
INSERT INTO employer_contact (
	employer_id,
	contact_id
)
VALUES
(
	1582792,
	1	
);

DELETE FROM user_contact;
INSERT INTO user_contact (
	user_id,
	contact_id
)
VALUES
(
	1,
	2	
);

DELETE FROM contact_details;
INSERT INTO contact_details (
	contact_id,
	address,
	phone,
	fax,
	email
)
VALUES
(
	1,
	'18 Claredin ST',
	'+614xxxxxxxx',
	'+614yyyyyyyy',
	'info@protone.com.au'
),
(
	2,
	'3/21 Anderson St',
	'+61405607273',
	'+61405607274',
	'stas.solodkin@yahoo.com'
);

DELETE FROM contact_details_zip;
INSERT INTO contact_details_zip (
	contact_id,
	zip_id
)
VALUES
(
	1,
	1
),
(
	2,
	2
);

DELETE FROM zip;
INSERT INTO zip (
	zip_id,
	city,
	country,
	state,
	post_code
)
VALUES
(
	1,
	'Melbourne',
	'Australia',
	'Victoria',
	'3100'
),
(
	2,
	'Melbourne',
	'Australia',
	'Victoria',
	'3162'
);

SET foreign_key_checks = 0;

