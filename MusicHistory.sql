--1. Query all of the entries in the Genre table
select * from Genre;

select * from Song;

select * from Album;

--2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
select * from Artist order by ArtistName;

--3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
select s.title,
		a.artistname
from song s
	left join Artist a on s.ArtistId = a.id;

--4. Write a SELECT query that lists all the Artists that have a Pop Album
select a.genreId, b.artistname from Album a left join Artist b on b.Id = a.ArtistId
where GenreId = 7;

--5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
select a.genreId, b.artistname from Album a left join Artist b on b.id = a.ArtistId
where GenreId = 2 or genreId = 4;

--6. Write a SELECT statement that lists the Albums with no songs
select a.Title, s.Title from  Album a left join song s on a.id = s.AlbumId where s.Title is null;

--7. Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist (ArtistName, YearEstablished) values ('Radiohead', '1985');

--8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) values ('Hail to the Thief', '2003', '3395', 'Capitol', '29', '2');

--9. Using the INSERT statement, add some songs that are on that album to the Song table.
insert into Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) values ('2 + 2 = 5 (The Lukewarm)', '199', '06/09/2003', '2', '29', '24');

--10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in.
--    Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
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

--11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select
	Count(Song.Title), album.Title
from Album
	left join Song
	on Song.AlbumId = Album.Id
group by Album.Title
order by 1 desc;

--12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select
	Count(Song.Title), Artist.ArtistName
from Artist
	left join Song
	on Song.ArtistId = Artist.Id
group by Artist.ArtistName
order by 1 desc;

--13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
select
	COUNT(Song.Title), Genre.Name
from Genre
	left join Song
	on Song.GenreId = Genre.Id
group by Genre.Name
order by 1 desc;

--14. Write a SELECT query that lists the Artists that have put out records on more than one record label. Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
select
	COUNT(Album.Label), Artist.ArtistName
	from Album
	left join Artist
	on album.ArtistId = Artist.Id
	group by Artist.ArtistName
	having count (album.label) > 1;

--15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
select album.Title,
		album.AlbumLength
from Album
where album.AlbumLength in
	(select max(albumlength)
	from Album);

--16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
select 
	song.Title,
	song.SongLength
from Song
where song.SongLength in
	(select MAX(songlength)
	from Song);

--17. Modify the previous query to also display the title of the album.
select
	song.Title,
	song.SongLength,
	Album.Title
from Song
	left join Album
	on song.AlbumId = Album.Id
where song.SongLength in 
	(select MAX(songlength)
	from Song);
