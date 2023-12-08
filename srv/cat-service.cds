using fh.jokeapi as api from '../db/datamodel';

service CatalogService {
    entity Joke as projection on api.Joke;
    entity Language as projection on api.Language;
    entity Category as projection on api.Category;
    entity Joke_Categories as projection on api.Joke_Categories;

    action toggleEnable (uuid:type of Joke:ID ) returns { enabled: Boolean };
}