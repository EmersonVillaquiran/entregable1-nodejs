--========= USERS ============
create table users (
	id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30)
);

select * from users


insert into users (first_name, last_name, email ) values
('Laura', 'Latorre', 'laura@gmail.com'),
('Salome', 'Garcia', 'salome@gmail.com'),
('Johan', 'Garces', 'johan@gmail.com');

--========= POST ============
create table post(
	id serial primary key,
	creator_id int references users(id),
	title varchar(30),
	text varchar(100)
);

select * from post 

insert into post (creator_id, title, text) values 
(1, 'Alimentación para cachorros', 'Lorem ipsum dolor sit amet...'),
(2, 'Tips de belleza', 'Lorem ipsum dolor sit amet...'),
(3, 'Top 5 peliculas 2024', 'Lorem ipsum dolor sit amet...');

insert into post (creator_id, title, text) values 
(1, 'Cuidado gatuno', 'Lorem ipsum dolor sit amet...'),
(2, 'Las mejores bases', 'Lorem ipsum dolor sit amet...');

--========= PIVOTE LIKES -USERS-POST ===========
create table likes(
	id serial primary key,
	users_id int references users(id),
	post_id int references post(id)
);

select * from likes 

insert into likes (users_id, post_id) values
(1,3),
(1,5),
(2,1),
(2,2),
(3,4);


---POST--USERS----

select post. *, users.first_name, users.last_name, users.email
from post
join users on post.creator_id = users.id;


---POST --- LIKES --- USERS

select * from post inner join likes
on post.id = likes.post_id inner join users 
on users.id = likes.users_id;


