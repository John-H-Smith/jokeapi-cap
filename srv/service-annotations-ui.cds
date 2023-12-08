using CatalogService from './cat-service';

annotate CatalogService.Joke with @(
    title: '{i18n>JokeHeaderSingular}',
    odata.draft.enabled,
    UI.SelectionFields: [ language_ID, enabled ],
    UI.LineItem: [
        { $Type: 'UI.DataFieldForAction', Action: 'CatalogService.EntityContainer/toggleEnable', Label: 'Enable/Disable' },
        { Value: text },
        { Value: language_ID }
    ],
    UI.FieldGroup: {
        Data: [
            {
                $Type: 'UI.DataField', 
                Value: 'categories'
            },
            {
                $Type: 'UI.DataField',
                Value: 'text'
            }
        ]
    },
    UI.FieldGroup #Header: {
        Data: [
            { Value: language_ID }
        ]
    },
    UI.HeaderInfo: {
        TypeName: '{i18n>JokeHeaderSingular}',
        TypeNamePlural: '{i18n>JokeHeaderPlural}',
        Title: {
            $Type: 'UI.DataField',
            Value: text,
        },
    },
    UI.HeaderFacets: [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Header'
        }
    ],
    UI.Facets: [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : '{i18n>Categories}',
            Facets : [
                {
                $Type               : 'UI.CollectionFacet',
                Label               : '{i18n>Categories}',
                Facets              : [
                    {
                        $Type               : 'UI.ReferenceFacet',
                        Target              : 'categories/@UI.LineItem#ObjectPageFacet'
                    }
                ]
                }
            ]

        },
    ]
) {
    ID @(
        UI.Hidden,
        Common.Text: text
    );

    text @(
        title : '{i18n>JokeHeaderSingular}',
    );

    language @(
        title: '{i18n>Language}',
        Common.Text : language.language,
        Common.TextArrangement: #TextFirst,
        Common.ValueList: {
            CollectionPath: 'Language',
            Parameters: [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty: language_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly', 
                    ValueListProperty: 'language'
                },
            ]
        }
    );

    categories @(

    );

    enabled @(
        title : '{i18n>JokeEnabled}',
    );
};

annotate CatalogService.Language with @(
    title: '{i18n>Language}',
    readonly
) {
    ID @(
        Common.Text: 'language',
        Common.TextArrangement: #TextSeparate
    );

    language @title : '{i18n>Language}';
};

annotate CatalogService.Joke_Categories with @(
    UI.LineItem #ObjectPageFacet: [
        { Value: category_ID }
    ],    
) { 
    category @(
        title: '{i18n>Category}',
        Common.Text : category.name,
        Common.TextArrangement: #TextOnly,
        Common.ValueList: {
            CollectionPath: 'Category',
            Parameters: [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty: category_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type: 'Common.ValueListParameterDisplayOnly', 
                    ValueListProperty: 'name'
                },
            ]
        }
    );
};

annotate CatalogService.toggleEnable with @(
    title: '{i18n>JokeToggleEnable}',
);