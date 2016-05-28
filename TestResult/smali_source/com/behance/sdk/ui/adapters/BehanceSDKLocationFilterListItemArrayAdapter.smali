.class public Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;
.super Landroid/widget/ArrayAdapter;
.source "BehanceSDKLocationFilterListItemArrayAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/widget/ArrayAdapter",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private final data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field private selectedLocationDTO:Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;Ljava/util/List;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "selectedLocationDTO"    # Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;",
            "Ljava/util/List",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<TT;>;"
    .local p3, "values":Ljava/util/List;, "Ljava/util/List<TT;>;"
    sget v0, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_location_filter_item_adapter:I

    invoke-direct {p0, p1, v0, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 24
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->context:Landroid/content/Context;

    .line 25
    invoke-virtual {p0, p2}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->setSelectedLocationDTO(Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;)V

    .line 26
    iput-object p3, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->data:Ljava/util/List;

    .line 27
    return-void
.end method


# virtual methods
.method public getSelectedLocationDTO()Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;
    .registers 2

    .prologue
    .line 55
    .local p0, "this":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<TT;>;"
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->selectedLocationDTO:Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 13
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .local p0, "this":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<TT;>;"
    const/4 v8, 0x0

    .line 31
    iget-object v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->context:Landroid/content/Context;

    const-string v7, "layout_inflater"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 33
    .local v1, "inflater":Landroid/view/LayoutInflater;
    sget v6, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_location_filter_item_adapter:I

    invoke-virtual {v1, v6, p3, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 35
    .local v4, "rowView":Landroid/view/View;
    sget v6, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogLocationItemTxtView:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 36
    .local v3, "locationNameTxtView":Landroid/widget/TextView;
    sget v6, Lcom/behance/sdk/R$id;->bsdkLocationFilterDialogLocationItemSelectedIdicatorImageView:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 38
    .local v5, "selectedItemIndicatorImageView":Landroid/view/View;
    iget-object v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->data:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 39
    .local v0, "genericLocationDTO":Ljava/lang/Object;, "TT;"
    instance-of v6, v0, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    if-eqz v6, :cond_5d

    move-object v2, v0

    .line 40
    check-cast v2, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    .line 41
    .local v2, "locationDTO":Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;
    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->getSelectedLocationDTO()Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    move-result-object v6

    if-eqz v6, :cond_5e

    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->getSelectedLocationDTO()Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    move-result-object v6

    invoke-virtual {v6}, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5e

    .line 44
    iget-object v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/behance/sdk/R$color;->bsdk_adobe_blue:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    invoke-virtual {v5, v8}, Landroid/view/View;->setVisibility(I)V

    .line 51
    .end local v2    # "locationDTO":Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;
    :cond_5d
    :goto_5d
    return-object v4

    .line 47
    .restart local v2    # "locationDTO":Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;
    :cond_5e
    iget-object v6, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/behance/sdk/R$color;->bsdk_location_filter_dialog_location_item_txt_color:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5d
.end method

.method public setSelectedLocationDTO(Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;)V
    .registers 2
    .param p1, "selectedLocationDTO"    # Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    .prologue
    .line 59
    .local p0, "this":Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;, "Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter<TT;>;"
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKLocationFilterListItemArrayAdapter;->selectedLocationDTO:Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;

    .line 60
    return-void
.end method
