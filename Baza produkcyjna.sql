CREATE TABLE kategorie (
idkategorii SERIAL PRIMARY KEY,
nazwa VARCHAR(50));

CREATE TABLE filmy (
idfilmu SERIAL PRIMARY KEY,
tytul VARCHAR(40),
rokpremiery INTEGER,
idkategorii INTEGER REFERENCES kategorie(idkategorii),
jezyk VARCHAR(20));

CREATE TABLE uzytkownicy(
iduzytkownika SERIAL PRIMARY KEY,
email VARCHAR(100),
imie VARCHAR(30),
nazwisko VARCHAR(50),
miasto VARCHAR(50),
datarejestracji DATE);

CREATE TABLE oceny (
idoceny SERIAL PRIMARY KEY,
iduzytkownika INTEGER REFERENCES uzytkownicy(iduzytkownika),
idfilmu INTEGER REFERENCES filmy(idfilmu),
ocenafilmu INTEGER CHECK(ocenafilmu BETWEEN 1 AND 10),
ocenarezysera INTEGER CHECK (ocenarezysera BETWEEN 1 AND 10),
dataoceny DATE);

CREATE TABLE rezyserzy (
idrezysera SERIAL PRIMARY KEY,
imie VARCHAR(30),
drugieimie VARCHAR(30),
nazwisko VARCHAR(50),
rokurodzenia INTEGER);

CREATE TABLE rezyserzyfilmow(
idrezysera INTEGER REFERENCES rezyserzy(idrezysera),
idfilmu INTEGER REFERENCES filmy(idfilmu));