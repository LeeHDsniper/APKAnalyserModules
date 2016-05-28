.class public Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;
.super Landroid/widget/BaseAdapter;
.source "BehanceSDKWIPListAdapter.java"


# instance fields
.field private imageLoaderOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private imageloader:Lcom/nostra13/universalimageloader/core/ImageLoader;

.field private inflater:Landroid/view/LayoutInflater;

.field private selectedWIPId:I

.field private wipsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "selectedWIPId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p2, "wipsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    const/4 v2, 0x0

    .line 48
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 49
    iput-object p2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->wipsList:Ljava/util/List;

    .line 50
    invoke-virtual {p0, p3}, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->setSelectedWIPId(I)V

    .line 51
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->inflater:Landroid/view/LayoutInflater;

    .line 52
    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v1, 0x1080078

    .line 53
    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->imageLoaderOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    .line 54
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->imageloader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    .line 55
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->wipsList:Ljava/util/List;

    if-eqz v0, :cond_b

    .line 60
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->wipsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 62
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getItem(I)Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    .registers 3
    .param p1, "arg0"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->wipsList:Ljava/util/List;

    if-eqz v0, :cond_d

    .line 69
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->wipsList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;

    .line 71
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->getItem(I)Lcom/behance/sdk/dto/BehanceSDKWIPDTO;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 113
    int-to-long v0, p1

    return-wide v0
.end method

.method public getSelectedWIPId()I
    .registers 2

    .prologue
    .line 117
    iget v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->selectedWIPId:I

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 14
    .param p1, "arg0"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v9, 0x0

    .line 77
    const/4 v3, 0x0

    .line 78
    .local v3, "viewReused":Z
    if-nez p2, :cond_5e

    .line 79
    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->inflater:Landroid/view/LayoutInflater;

    sget v8, Lcom/behance/sdk/R$layout;->bsdk_adapter_wip_list_view_item:I

    invoke-virtual {v7, v8, p3, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 84
    .local v1, "rootView":Landroid/view/View;
    :goto_c
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->getItem(I)Lcom/behance/sdk/dto/BehanceSDKWIPDTO;

    move-result-object v4

    .line 85
    .local v4, "wipDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    if-eqz v4, :cond_5d

    .line 86
    sget v7, Lcom/behance/sdk/R$id;->bsdkWIPItemAdapterWIPNameTextView:I

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 87
    .local v5, "wipNameTxtView":Landroid/widget/TextView;
    sget v7, Lcom/behance/sdk/R$id;->bsdkWIPItemAdapterWIPThumbnailImageView:I

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    .line 88
    .local v6, "wipThumbnailImageView":Landroid/widget/ImageView;
    sget v7, Lcom/behance/sdk/R$id;->bsdkWIPItemAdapterWIPSelectedIndicator:I

    invoke-virtual {v1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 90
    .local v2, "selectedIndicator":Landroid/view/View;
    if-eqz v3, :cond_2e

    .line 92
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 94
    :cond_2e
    invoke-virtual {v4}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getTitle()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    sget-object v7, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMBNAIL_SM:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    invoke-virtual {v4, v7}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;)Ljava/lang/String;

    move-result-object v0

    .line 97
    .local v0, "latestRevisionImageUrl":Ljava/lang/String;
    if-eqz v0, :cond_4a

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_4a

    .line 98
    iget-object v7, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->imageloader:Lcom/nostra13/universalimageloader/core/ImageLoader;

    iget-object v8, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->imageLoaderOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v7, v0, v6, v8}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    .line 101
    :cond_4a
    invoke-virtual {v4}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getId()I

    move-result v7

    if-lez v7, :cond_61

    invoke-virtual {v4}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->getId()I

    move-result v7

    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->getSelectedWIPId()I

    move-result v8

    if-ne v7, v8, :cond_61

    .line 102
    invoke-virtual {v2, v9}, Landroid/view/View;->setVisibility(I)V

    .line 108
    .end local v0    # "latestRevisionImageUrl":Ljava/lang/String;
    .end local v2    # "selectedIndicator":Landroid/view/View;
    .end local v5    # "wipNameTxtView":Landroid/widget/TextView;
    .end local v6    # "wipThumbnailImageView":Landroid/widget/ImageView;
    :cond_5d
    :goto_5d
    return-object v1

    .line 81
    .end local v1    # "rootView":Landroid/view/View;
    .end local v4    # "wipDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    :cond_5e
    move-object v1, p2

    .line 82
    .restart local v1    # "rootView":Landroid/view/View;
    const/4 v3, 0x1

    goto :goto_c

    .line 104
    .restart local v0    # "latestRevisionImageUrl":Ljava/lang/String;
    .restart local v2    # "selectedIndicator":Landroid/view/View;
    .restart local v4    # "wipDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    .restart local v5    # "wipNameTxtView":Landroid/widget/TextView;
    .restart local v6    # "wipThumbnailImageView":Landroid/widget/ImageView;
    :cond_61
    const/4 v7, 0x4

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_5d
.end method

.method public setSelectedWIPId(I)V
    .registers 2
    .param p1, "selectedWIPId"    # I

    .prologue
    .line 121
    iput p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKWIPListAdapter;->selectedWIPId:I

    .line 122
    return-void
.end method
