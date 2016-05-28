.class public Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;
.super Landroid/widget/BaseAdapter;
.source "BehanceSDKAdobeCloudSelectionListItemAdapter.java"


# instance fields
.field private cloudsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;"
        }
    .end annotation
.end field

.field private inflater:Landroid/view/LayoutInflater;

.field private selectedCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "selectedCloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;",
            ")V"
        }
    .end annotation

    .prologue
    .line 40
    .local p2, "cloudsList":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 41
    iput-object p2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->cloudsList:Ljava/util/List;

    .line 42
    invoke-virtual {p0, p3}, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->setSelectedCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V

    .line 43
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->inflater:Landroid/view/LayoutInflater;

    .line 44
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->cloudsList:Ljava/util/List;

    if-eqz v0, :cond_b

    .line 49
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->cloudsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 51
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getItem(I)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 3
    .param p1, "arg0"    # I

    .prologue
    .line 57
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->cloudsList:Ljava/util/List;

    if-eqz v0, :cond_d

    .line 58
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->cloudsList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 60
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->getItem(I)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 91
    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->selectedCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 12
    .param p1, "arg0"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v7, 0x0

    .line 66
    if-nez p2, :cond_44

    .line 67
    iget-object v5, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->inflater:Landroid/view/LayoutInflater;

    sget v6, Lcom/behance/sdk/R$layout;->bsdk_adapter_adobe_cloud_selection_list_item:I

    invoke-virtual {v5, v6, p3, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 71
    .local v2, "rootView":Landroid/view/View;
    :goto_b
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->getItem(I)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v0

    .line 72
    .local v0, "adobeCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    if-eqz v0, :cond_43

    .line 73
    sget v5, Lcom/behance/sdk/R$id;->bsdkCloudSelectionItemAdapterCloudNameTextView:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 74
    .local v1, "cloudNameTxtView":Landroid/widget/TextView;
    sget v5, Lcom/behance/sdk/R$id;->bsdkCloudSelectionItemAdapterSelectedIndicator:I

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 76
    .local v4, "selectedIndicator":Landroid/view/View;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->getSelectedCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    move-result-object v3

    .line 79
    .local v3, "selectedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    if-eqz v3, :cond_46

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getName()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_46

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_46

    .line 80
    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .end local v1    # "cloudNameTxtView":Landroid/widget/TextView;
    .end local v3    # "selectedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v4    # "selectedIndicator":Landroid/view/View;
    :cond_43
    :goto_43
    return-object v2

    .line 69
    .end local v0    # "adobeCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .end local v2    # "rootView":Landroid/view/View;
    :cond_44
    move-object v2, p2

    .restart local v2    # "rootView":Landroid/view/View;
    goto :goto_b

    .line 82
    .restart local v0    # "adobeCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .restart local v1    # "cloudNameTxtView":Landroid/widget/TextView;
    .restart local v3    # "selectedCloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .restart local v4    # "selectedIndicator":Landroid/view/View;
    :cond_46
    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_43
.end method

.method public setSelectedCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 2
    .param p1, "selectedCloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKAdobeCloudSelectionListItemAdapter;->selectedCloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 100
    return-void
.end method
