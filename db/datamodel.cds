namespace fh.jokeapi;
using { managed } from '@sap/cds/common';

entity Joke : managed {
    key ID : UUID @Core.Computed;
    text : String;
    enabled: Boolean default true;
    language : Association to Language;
    categories : Composition of many Joke_Categories on categories.joke = $self;
}

entity Language : managed {
    key ID : String;
    language: String;
}

entity Category : managed {
    key ID : UUID @Core.Computed;
    name : String;
    jokes : Composition of many Joke_Categories on jokes.category = $self;
}

entity Joke_Categories : managed {
    key joke :  Association to Joke;
    key category : Association to Category;
}