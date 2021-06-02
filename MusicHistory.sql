--1.
select * from Genre;

select * from Song;

select * from Album;

--2.
select * from Artist order by ArtistName;

--3.
select s.title,
		a.artistname
from song s
	left join Artist a on s.ArtistId = a.id;

--4.
select a.genreId, b.artistname from Album a left join Artist b on b.Id = a.ArtistId
where GenreId = 7;

--5.
select a.genreId, b.artistname from Album a left join Artist b on b.id = a.ArtistId
where GenreId = 2 or genreId = 4;

--6.
select a.Title, s.Title from  Album a left join song s on a.id = s.AlbumId where s.Title is null;

--7.
insert into Artist (ArtistName, YearEstablished) values ('Radiohead', '1985');

--8.
insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ('Hail to the Thief', '2003', '3395', 'Capitol', '29', '2');

--9.
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('2 + 2 = 5 (The Lukewarm)', '199', '06/09/2003', '2', '29', '24');

--10.
select 
	Song.title,
	Album.title,
	Artist.ArtistName
from Album
left join Song
	on Song.AlbumId = Album.Id
left join Artist
	on Artist.Id = Album.ArtistId
where ArtistName = 'Radiohead';

--11.
select
	Count(Song.Title), album.Title
from Album
	left join Song
	on Song.AlbumId = Album.Id
group by Album.Title
order by 1 desc;

--12.
select
	Count(Song.Title), Artist.ArtistName
from Artist
	left join Song
	on Song.ArtistId = Artist.Id
group by Artist.ArtistName
order by 1 desc;

--13.
select
	COUNT(Song.Title), Genre.Name
from Genre
	left join Song
	on Song.GenreId = Genre.Id
group by Genre.Name
order by 1 desc;

--14.
select
	COUNT(Album.Label), Artist.ArtistName
	from Album
	left join Artist
	on album.ArtistId = Artist.Id
	group by Artist.ArtistName
	having count (album.label) > 1;

