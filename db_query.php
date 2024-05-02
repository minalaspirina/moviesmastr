<?php
function get_movies($user_input, $filter) {  
    $movies = array();

    $conn = new mysqli('localhost', 'root', '', 'db_film');

    if ($conn->connect_error) {
        die("Connessione fallita: " . $conn->connect_error);
    }

    if ($user_input !== NULL) {
        $moviesQuery = 'SELECT * FROM movie WHERE '. $filter .' LIKE "%'.$user_input.'%"';
    } else if ($user_input === NULL) {
        $moviesQuery = 'SELECT * FROM movie';
    }

    $moviesResult = $conn -> query($moviesQuery);

    while ($moviesRow = $moviesResult -> fetch_assoc()) {
        $movies[] = $moviesRow;

        $last_movie = $movies[count($movies) - 1];
        $movieID = $last_movie['id'];


        $actorsQuery = 'SELECT actor.* FROM movie_actor 
        INNER JOIN actor ON actor.id = movie_actor.actor_id 
        WHERE movie_actor.movie_id = '.$movieID;

        $actorsResult = $conn -> query($actorsQuery);
        if (!$actorsResult) {
            die("Error retrieving actors for movie $movieID: " . $conn -> connect_error);
        } 

        while ($actorsRow = $actorsResult -> fetch_assoc()) {
            $movies[count($movies) - 1]['actors'][] = $actorsRow;
        }


        
        $directorsQuery = 'SELECT director.* FROM movie_director 
        INNER JOIN director ON director.id = movie_director.director_id 
        WHERE movie_director.movie_id = '.$movieID;

        $directorsResult = $conn -> query($directorsQuery);
        if (!$directorsResult) {
            die("Error retrieving directors for movie $movieID: " . $conn -> connect_error);
        }

        while ($directorsRow = $directorsResult -> fetch_assoc()) {
            $movies[count($movies) - 1]['directors'][] = $directorsRow;
        }


        
        $genresQuery = 'SELECT genre.* FROM movie_genre 
        INNER JOIN genre ON genre.id = movie_genre.genre_id 
        WHERE movie_genre.movie_id = '.$movieID;

        $genresResult = $conn -> query($genresQuery);
        if (!$genresResult) {
            die("Error retrieving genres for movie $movieID: " . $conn -> connect_error);
        }

        while ($genresRow = $genresResult -> fetch_assoc()) {
            $movies[count($movies) - 1]['genres'][] = $genresRow;
        }
    }


    $conn -> close();

    return $movies;
}


function get_actors($user_input, $filter) {  
    $actors = array();

    $conn = new mysqli('localhost', 'root', '', 'db_film');

    if ($conn->connect_error) {
        die("Connessione fallita: " . $conn->connect_error);
    }

    if ($user_input !== NULL) {
        $actorsQuery = 'SELECT * FROM actor WHERE '. $filter .' LIKE "%'.$user_input.'%"';

    } else if ($user_input === NULL) {
        $actorsQuery = 'SELECT * FROM actor';
    }

    $actorsResult = $conn -> query($actorsQuery);

    while ($actorsRow = $actorsResult -> fetch_assoc()) {
        $actors[] = $actorsRow;

        $last_actor = $actors[count($actors) - 1];
        $actorID = $last_actor['id'];


        
        $moviesQuery = 'SELECT movie.* FROM movie_actor 
        INNER JOIN movie ON movie.id = movie_actor.movie_id
        WHERE movie_actor.actor_id = '. $actorID;

        $moviesResult = $conn -> query($moviesQuery);
        if (!$moviesResult) {
            die("Error retrieving actors for movie $actorID: " . $conn -> connect_error);
        }

        while ($moviesRow = $moviesResult -> fetch_assoc()) {
            $actors[count($actors) - 1]['movies'][] = $moviesRow;
        }
    }


    $conn -> close();

    return $actors;
}


function get_directors($user_input, $filter) {  
    $directors = array();

    $conn = new mysqli('localhost', 'root', '', 'db_film');

    if ($conn->connect_error) {
        die("Connessione fallita: " . $conn->connect_error);
    }

    
    if ($user_input !== NULL) {
        $directorsQuery = 'SELECT * FROM director WHERE '. $filter .' LIKE "%'.$user_input.'%"';

        
    } else if ($user_input === NULL) {
        $directorsQuery = 'SELECT * FROM director';
    }
    
    $directorsResult = $conn -> query($directorsQuery);

    while ($directorsRow = $directorsResult -> fetch_assoc()) {
        $directors[] = $directorsRow;

        $last_director = $directors[count($directors) - 1];
        $directorID = $last_director['id'];


        $moviesQuery = 'SELECT movie.* FROM movie_director 
        INNER JOIN movie ON movie.id = movie_director.movie_id
        WHERE movie_director.director_id = '. $directorID;

        $moviesResult = $conn -> query($moviesQuery);
        if (!$moviesResult) {
            die("Error retrieving directors for movie $directorID: " . $conn -> connect_error);
        }

        while ($moviesRow = $moviesResult -> fetch_assoc()) {
            $directors[count($directors) - 1]['director'][] = $moviesRow;
        }
    }


    $conn -> close();

    return $directors;
}


function get_genres($user_input, $filter) {  
    $genres = array();

    $conn = new mysqli('localhost', 'root', '', 'db_film');

    if ($conn->connect_error) {
        die("Connessione fallita: " . $conn->connect_error);
    }

    if ($user_input !== NULL) {
        $genresQuery = 'SELECT * FROM genre WHERE '. $filter .' LIKE "%'.$user_input.'%"';

        
    } else if ($user_input === NULL) {
        $genresQuery = 'SELECT * FROM genre';
    }

    $geresResult = $conn -> query($genresQuery);

    while ($genresRow = $geresResult -> fetch_assoc()) {
        $genres[] = $genresRow;

        $last_genre = $genres[count($genres) - 1];
        $genreID = $last_genre['id'];


    
        $moviesQuery = 'SELECT movie.* FROM movie_genre 
        INNER JOIN movie ON movie.id = movie_genre.movie_id
        WHERE movie_genre.genre_id = '. $genreID;

        $moviesResult = $conn -> query($moviesQuery);
        if (!$moviesResult) {
            die("Error retrieving genres for movie $genreID: " . $conn -> connect_error);
        }

        while ($moviesRow = $moviesResult -> fetch_assoc()) {
            $genres[count($genres) - 1]['genre'][] = $moviesRow;
        }
    }


    $conn -> close();

    return $genres;
}



?>