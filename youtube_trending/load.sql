create table youtube (
  video_id text not null primary key,
  title text,
  publishedAt datetime,
  channelId text,
  channelTitle text,
  categoryId int,
  trending_date datetime,
  tags text,
  view_count int,
  likes int,
  dislikes int,
  comment_count int,
  thumbnail_link text,
  comments_disabled boolean,
  ratings_disabled boolean,
  video_description text
);

load data local infile 'US_youtube_trending_data.csv'
skip all errors
into table youtube
character set 'utf8'
fields terminated by ',' enclosed by '"'
lines terminated by '\r\n'
max_errors 0;