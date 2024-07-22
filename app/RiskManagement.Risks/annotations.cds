using RiskManagementService as service from '../../srv/service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Title}',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Priority}',
                Value : prio,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Description}',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Impact}',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Criticality}',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Supplier',
                Value : supplier_BusinessPartner,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Title}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Priority}',
            Value : prio,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Description}',
            Value : descr,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Impact}',
            Value : impact,
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Criticality}',
            Value : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : supplier_BusinessPartner,
            Label : 'Supplier',
        },
    ],
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'createdAt',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'createdBy',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
        ],
    }
};

annotate service.Risks with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'A_BusinessPartner',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_BusinessPartner,
                ValueListProperty : 'BusinessPartner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Customer',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Supplier',
            },
        ],
    }
};

annotate service.Risks with {
    supplier @Common.ValueListWithFixedValues : true
};
annotate service.A_BusinessPartner with {
    BusinessPartner @Common.Text : BusinessPartnerFullName
};
annotate service.Risks with {
    supplier @Common.Text : {
            $value : supplier.BusinessPartnerFullName,
            ![@UI.TextArrangement] : #TextOnly,
        }
};
