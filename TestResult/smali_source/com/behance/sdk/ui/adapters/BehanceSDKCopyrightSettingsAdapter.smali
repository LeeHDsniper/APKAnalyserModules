.class public Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;
.super Lcom/behance/sdk/google/listview/SectionalBaseAdapter;
.source "BehanceSDKCopyrightSettingsAdapter.java"


# instance fields
.field all:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;",
            ">;>;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private pinnedHeaderViewLeftPadding:I

.field private selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "selectedCopyRight"    # Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;-><init>()V

    .line 25
    invoke-static {}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getDefaultValue()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 28
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->context:Landroid/content/Context;

    .line 29
    iput-object p2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 30
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->initializeHeaderViewPadding()V

    .line 31
    invoke-static {p1}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getAllCopyrightOptions(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    .line 32
    return-void
.end method

.method private initializeHeaderViewPadding()V
    .registers 3

    .prologue
    .line 35
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$dimen;->bsdk_search_filter_creative_field_left_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->pinnedHeaderViewLeftPadding:I

    .line 36
    return-void
.end method

.method private setSelected(Landroid/widget/TextView;Landroid/widget/ImageView;)V
    .registers 6
    .param p1, "creativeFieldTxtView"    # Landroid/widget/TextView;
    .param p2, "selectIndicatorImageView"    # Landroid/widget/ImageView;

    .prologue
    .line 125
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 126
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$color;->bsdk_search_filter_creative_fields_dialog_selected_text_color:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 127
    .local v0, "color":I
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 128
    return-void
.end method

.method private setUnselected(Landroid/widget/TextView;Landroid/widget/ImageView;)V
    .registers 6
    .param p1, "creativeFieldTxtView"    # Landroid/widget/TextView;
    .param p2, "selectIndicatorImageView"    # Landroid/widget/ImageView;

    .prologue
    .line 115
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$color;->bsdk_search_filter_creative_fields_dialog_text_color:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 116
    .local v0, "color":I
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 117
    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 118
    return-void
.end method


# virtual methods
.method protected bindSectionHeader(Landroid/view/View;IZ)V
    .registers 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "displaySectionHeader"    # Z

    .prologue
    const/4 v4, 0x0

    .line 73
    sget v3, Lcom/behance/sdk/R$id;->bsdkCopyrightSettingsGroupHeader:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 74
    .local v0, "groupHeaderDividerView":Landroid/view/View;
    sget v3, Lcom/behance/sdk/R$id;->bsdkCopyrightSettingsGroupItemDivider:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 76
    .local v2, "topDividerView":Landroid/view/View;
    if-eqz p3, :cond_27

    .line 78
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 79
    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    move-object v1, v0

    .line 80
    check-cast v1, Landroid/widget/TextView;

    .line 81
    .local v1, "lSectionTitle":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->getSections()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p2}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->getSectionForPosition(I)I

    move-result v4

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .end local v1    # "lSectionTitle":Landroid/widget/TextView;
    :goto_26
    return-void

    .line 84
    :cond_27
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 85
    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_26
.end method

.method public configurePinnedHeader(Landroid/view/View;II)V
    .registers 9
    .param p1, "header"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "alpha"    # I

    .prologue
    .line 132
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    .line 133
    .local v0, "lSectionHeader":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->getSections()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->getSectionForPosition(I)I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->pinnedHeaderViewLeftPadding:I

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v2

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v3

    .line 135
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v4

    .line 134
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 136
    return-void
.end method

.method public getAmazingView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 91
    move-object v3, p2

    .line 92
    .local v3, "rootView":Landroid/view/View;
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->context:Landroid/content/Context;

    const-string v6, "layout_inflater"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater;

    .line 93
    .local v2, "inflater":Landroid/view/LayoutInflater;
    if-nez v3, :cond_14

    .line 94
    sget v5, Lcom/behance/sdk/R$layout;->bsdk_adapter_publish_project_copyright_settings_item:I

    const/4 v6, 0x0

    invoke-virtual {v2, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 96
    :cond_14
    sget v5, Lcom/behance/sdk/R$id;->bsdkCopyrightSettingsDialogItemTxtView:I

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 97
    .local v1, "creativeFieldTxtView":Landroid/widget/TextView;
    sget v5, Lcom/behance/sdk/R$id;->bsdkCopyrightSettingsDialogItemSelectedIdicatorImageView:I

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 98
    .local v4, "selectIndicatorImageView":Landroid/widget/ImageView;
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->getItem(I)Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v0

    .line 99
    .local v0, "copyRightSetting":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->context:Landroid/content/Context;

    invoke-virtual {v0, v5}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getDescription(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    invoke-virtual {v5, v0}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 102
    invoke-direct {p0, v1, v4}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->setSelected(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 107
    :goto_3c
    return-object v3

    .line 104
    :cond_3d
    invoke-direct {p0, v1, v4}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->setUnselected(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    goto :goto_3c
.end method

.method public getCount()I
    .registers 6

    .prologue
    .line 40
    const/4 v2, 0x0

    .line 41
    .local v2, "res":I
    iget-object v3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 42
    .local v1, "keySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 43
    .local v0, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/2addr v2, v3

    .line 44
    goto :goto_b

    .line 45
    .end local v0    # "key":Ljava/lang/String;
    :cond_25
    return v2
.end method

.method public getItem(I)Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .registers 8
    .param p1, "position"    # I

    .prologue
    .line 50
    const/4 v0, 0x0

    .line 51
    .local v0, "c":I
    iget-object v4, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 52
    .local v2, "keySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_37

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 53
    .local v1, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 54
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    if-lt p1, v0, :cond_31

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    add-int/2addr v5, v0

    if-ge p1, v5, :cond_31

    .line 55
    sub-int v4, p1, v0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 59
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    :goto_30
    return-object v4

    .line 57
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    :cond_31
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    add-int/2addr v0, v5

    .line 58
    goto :goto_b

    .line 59
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    :cond_37
    const/4 v4, 0x0

    goto :goto_30
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->getItem(I)Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 64
    int-to-long v0, p1

    return-wide v0
.end method

.method public getPositionForSection(I)I
    .registers 8
    .param p1, "section"    # I

    .prologue
    .line 140
    if-gez p1, :cond_3

    .line 141
    const/4 p1, 0x0

    .line 142
    :cond_3
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 143
    .local v3, "keySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v5

    if-lt p1, v5, :cond_15

    .line 144
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v5

    add-int/lit8 p1, v5, -0x1

    .line 145
    :cond_15
    const/4 v0, 0x0

    .line 146
    .local v0, "c":I
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 147
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v5

    if-ge v1, v5, :cond_3a

    .line 148
    if-ne p1, v1, :cond_24

    .line 154
    .end local v0    # "c":I
    :goto_23
    return v0

    .line 151
    .restart local v0    # "c":I
    :cond_24
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 152
    .local v4, "next":Ljava/lang/String;
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/2addr v0, v5

    .line 147
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 154
    .end local v4    # "next":Ljava/lang/String;
    :cond_3a
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public getSectionForPosition(I)I
    .registers 9
    .param p1, "position"    # I

    .prologue
    .line 159
    const/4 v0, 0x0

    .line 160
    .local v0, "c":I
    iget-object v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 161
    .local v3, "keySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 162
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v6

    if-ge v1, v6, :cond_32

    .line 163
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 164
    .local v5, "next":Ljava/lang/String;
    iget-object v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 165
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    if-lt p1, v0, :cond_2a

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    add-int/2addr v6, v0

    if-ge p1, v6, :cond_2a

    .line 170
    .end local v1    # "i":I
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    .end local v5    # "next":Ljava/lang/String;
    :goto_29
    return v1

    .line 168
    .restart local v1    # "i":I
    .restart local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    .restart local v5    # "next":Ljava/lang/String;
    :cond_2a
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    add-int/2addr v0, v6

    .line 162
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 170
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;>;"
    .end local v5    # "next":Ljava/lang/String;
    :cond_32
    const/4 v1, -0x1

    goto :goto_29
.end method

.method public bridge synthetic getSections()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 19
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->getSections()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSections()[Ljava/lang/String;
    .registers 4

    .prologue
    .line 175
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->all:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 176
    .local v0, "keySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 177
    .local v1, "res":[Ljava/lang/String;
    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method protected onNextPageRequested(I)V
    .registers 2
    .param p1, "page"    # I

    .prologue
    .line 69
    return-void
.end method

.method public setSelectedCopyRight(Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;)V
    .registers 2
    .param p1, "selectedCopyrightSetting"    # Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .prologue
    .line 184
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCopyrightSettingsAdapter;->selectedCopyRight:Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    .line 185
    return-void
.end method
