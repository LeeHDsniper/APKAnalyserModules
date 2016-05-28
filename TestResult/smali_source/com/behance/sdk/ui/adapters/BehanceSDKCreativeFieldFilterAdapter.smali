.class public Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;
.super Lcom/behance/sdk/google/listview/SectionalBaseAdapter;
.source "BehanceSDKCreativeFieldFilterAdapter.java"


# instance fields
.field all:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;>;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private pinnedHeaderViewLeftPadding:I

.field private selectedField:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/util/List;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p2, "data":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .local p3, "selectedField":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    invoke-direct {p0}, Lcom/behance/sdk/google/listview/SectionalBaseAdapter;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->context:Landroid/content/Context;

    .line 33
    iput-object p3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->selectedField:Ljava/util/List;

    .line 34
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->initializeHeaderViewPadding()V

    .line 35
    invoke-direct {p0, p2, p3}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->initalizeData(Ljava/util/List;Ljava/util/List;)V

    .line 36
    return-void
.end method

.method private getStartingAlphabet(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 73
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    .line 75
    :goto_f
    return-object v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private initalizeData(Ljava/util/List;Ljava/util/List;)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .local p2, "selectedField":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    new-instance v7, Ljava/util/LinkedHashMap;

    invoke-direct {v7}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    .line 48
    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    sget-object v8, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->POPULAR:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    iget-object v9, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->context:Landroid/content/Context;

    invoke-virtual {v8, v9}, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1d
    :goto_1d
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6e

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    .line 50
    .local v3, "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->getName()Ljava/lang/String;

    move-result-object v5

    .line 51
    .local v5, "name":Ljava/lang/String;
    invoke-direct {p0, v5}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->getStartingAlphabet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 52
    .local v6, "start":Ljava/lang/String;
    iget-object v8, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v8, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 53
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    if-nez v4, :cond_45

    .line 54
    new-instance v4, Ljava/util/ArrayList;

    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .restart local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iget-object v8, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v8, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    :cond_45
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    invoke-virtual {v3}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->getCategory()Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    move-result-object v0

    .line 59
    .local v0, "category":Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;
    sget-object v8, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->NONE:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    if-eq v0, v8, :cond_1d

    .line 60
    iget-object v8, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->context:Landroid/content/Context;

    invoke-virtual {v0, v8}, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 61
    .local v1, "categoryStr":Ljava/lang/String;
    iget-object v8, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v8, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 62
    .local v2, "catrgoryList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    if-nez v2, :cond_6a

    .line 63
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "catrgoryList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .restart local v2    # "catrgoryList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    iget-object v8, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v8, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    :cond_6a
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 69
    .end local v0    # "category":Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;
    .end local v1    # "categoryStr":Ljava/lang/String;
    .end local v2    # "catrgoryList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .end local v3    # "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "start":Ljava/lang/String;
    :cond_6e
    return-void
.end method

.method private initializeHeaderViewPadding()V
    .registers 3

    .prologue
    .line 39
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$dimen;->bsdk_search_filter_creative_field_left_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->pinnedHeaderViewLeftPadding:I

    .line 40
    return-void
.end method

.method private setSelected(Landroid/widget/TextView;Landroid/widget/ImageView;)V
    .registers 6
    .param p1, "creativeFieldTxtView"    # Landroid/widget/TextView;
    .param p2, "selectIndicatorImageView"    # Landroid/widget/ImageView;

    .prologue
    .line 174
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 175
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$color;->bsdk_search_filter_creative_fields_dialog_selected_text_color:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 176
    .local v0, "color":I
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 177
    return-void
.end method

.method private setUnselected(Landroid/widget/TextView;Landroid/widget/ImageView;)V
    .registers 6
    .param p1, "creativeFieldTxtView"    # Landroid/widget/TextView;
    .param p2, "selectIndicatorImageView"    # Landroid/widget/ImageView;

    .prologue
    .line 164
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$color;->bsdk_search_filter_creative_fields_dialog_text_color:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 165
    .local v0, "color":I
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 166
    const/16 v1, 0x8

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 167
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

    .line 113
    sget v3, Lcom/behance/sdk/R$id;->bsdkCreativeFieldGroupHeader:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 114
    .local v0, "groupHeader":Landroid/view/View;
    sget v3, Lcom/behance/sdk/R$id;->bsdkCreativeFieldGroupItemDivider:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 116
    .local v2, "topDividerView":Landroid/view/View;
    if-eqz p3, :cond_27

    .line 118
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 119
    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    move-object v1, v0

    .line 120
    check-cast v1, Landroid/widget/TextView;

    .line 121
    .local v1, "lSectionTitle":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->getSections()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p2}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->getSectionForPosition(I)I

    move-result v4

    aget-object v3, v3, v4

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .end local v1    # "lSectionTitle":Landroid/widget/TextView;
    :goto_26
    return-void

    .line 123
    :cond_27
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 124
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
    .line 181
    move-object v0, p1

    check-cast v0, Landroid/widget/TextView;

    .line 182
    .local v0, "lSectionHeader":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->getSections()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->getSectionForPosition(I)I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    iget v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->pinnedHeaderViewLeftPadding:I

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v2

    invoke-virtual {v0}, Landroid/widget/TextView;->getPaddingRight()I

    move-result v3

    .line 184
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v4

    .line 183
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 185
    return-void
.end method

.method public getAmazingView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v9, 0x0

    .line 130
    move-object v4, p2

    .line 131
    .local v4, "rootView":Landroid/view/View;
    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->context:Landroid/content/Context;

    const-string v8, "layout_inflater"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/LayoutInflater;

    .line 132
    .local v3, "inflater":Landroid/view/LayoutInflater;
    if-nez v4, :cond_14

    .line 133
    sget v7, Lcom/behance/sdk/R$layout;->bsdk_adapter_publish_project_creative_field_item:I

    invoke-virtual {v3, v7, p3, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 135
    :cond_14
    sget v7, Lcom/behance/sdk/R$id;->bsdkCreativeFieldFilterDialogItemTxtView:I

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 136
    .local v2, "creativeFieldTxtView":Landroid/widget/TextView;
    sget v7, Lcom/behance/sdk/R$id;->bsdkCreativeFieldFilterDialogItemSelectedIdicatorImageView:I

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 137
    .local v5, "selectIndicatorImageView":Landroid/widget/ImageView;
    sget v7, Lcom/behance/sdk/R$id;->bsdkCreativeFieldGroupItemDivider:I

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 139
    .local v6, "topDividerView":Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->getItem(I)Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    move-result-object v0

    .line 140
    .local v0, "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->getId()Ljava/lang/String;

    move-result-object v1

    .line 143
    .local v1, "creativeFieldId":Ljava/lang/String;
    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->selectedField:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5d

    .line 144
    invoke-direct {p0, v2, v5}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->setSelected(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 148
    :goto_44
    const-string v7, "ALL_CREATIVE_FIELDS_ID"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_61

    .line 149
    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 150
    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->selectedField:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_5c

    .line 151
    invoke-direct {p0, v2, v5}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->setSelected(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 156
    :cond_5c
    :goto_5c
    return-object v4

    .line 146
    :cond_5d
    invoke-direct {p0, v2, v5}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->setUnselected(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    goto :goto_44

    .line 153
    :cond_61
    invoke-virtual {v6, v9}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5c
.end method

.method public getCount()I
    .registers 6

    .prologue
    .line 80
    const/4 v2, 0x0

    .line 81
    .local v2, "res":I
    iget-object v3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 82
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

    .line 83
    .local v0, "key":Ljava/lang/String;
    iget-object v3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/2addr v2, v3

    .line 84
    goto :goto_b

    .line 85
    .end local v0    # "key":Ljava/lang/String;
    :cond_25
    return v2
.end method

.method public getItem(I)Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    .registers 8
    .param p1, "position"    # I

    .prologue
    .line 90
    const/4 v0, 0x0

    .line 91
    .local v0, "c":I
    iget-object v4, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 92
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

    .line 93
    .local v1, "key":Ljava/lang/String;
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 94
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    if-lt p1, v0, :cond_31

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    add-int/2addr v5, v0

    if-ge p1, v5, :cond_31

    .line 95
    sub-int v4, p1, v0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    .line 99
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    :goto_30
    return-object v4

    .line 97
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    :cond_31
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    add-int/2addr v0, v5

    .line 98
    goto :goto_b

    .line 99
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    :cond_37
    const/4 v4, 0x0

    goto :goto_30
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->getItem(I)Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 104
    int-to-long v0, p1

    return-wide v0
.end method

.method public getPositionForSection(I)I
    .registers 8
    .param p1, "section"    # I

    .prologue
    .line 189
    if-gez p1, :cond_3

    .line 190
    const/4 p1, 0x0

    .line 191
    :cond_3
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 192
    .local v3, "keySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v5

    if-lt p1, v5, :cond_15

    .line 193
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v5

    add-int/lit8 p1, v5, -0x1

    .line 194
    :cond_15
    const/4 v0, 0x0

    .line 195
    .local v0, "c":I
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 196
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v5

    if-ge v1, v5, :cond_3a

    .line 197
    if-ne p1, v1, :cond_24

    .line 203
    .end local v0    # "c":I
    :goto_23
    return v0

    .line 200
    .restart local v0    # "c":I
    :cond_24
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 201
    .local v4, "next":Ljava/lang/String;
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/2addr v0, v5

    .line 196
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 203
    .end local v4    # "next":Ljava/lang/String;
    :cond_3a
    const/4 v0, 0x0

    goto :goto_23
.end method

.method public getSectionForPosition(I)I
    .registers 9
    .param p1, "position"    # I

    .prologue
    .line 208
    const/4 v0, 0x0

    .line 209
    .local v0, "c":I
    iget-object v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 210
    .local v3, "keySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 211
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v6

    if-ge v1, v6, :cond_32

    .line 212
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 213
    .local v5, "next":Ljava/lang/String;
    iget-object v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 214
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    if-lt p1, v0, :cond_2a

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    add-int/2addr v6, v0

    if-ge p1, v6, :cond_2a

    .line 219
    .end local v1    # "i":I
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .end local v5    # "next":Ljava/lang/String;
    :goto_29
    return v1

    .line 217
    .restart local v1    # "i":I
    .restart local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .restart local v5    # "next":Ljava/lang/String;
    :cond_2a
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    add-int/2addr v0, v6

    .line 211
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 219
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .end local v5    # "next":Ljava/lang/String;
    :cond_32
    const/4 v1, -0x1

    goto :goto_29
.end method

.method public bridge synthetic getSections()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->getSections()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSections()[Ljava/lang/String;
    .registers 4

    .prologue
    .line 224
    iget-object v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKCreativeFieldFilterAdapter;->all:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 225
    .local v0, "keySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 226
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
    .line 109
    return-void
.end method
