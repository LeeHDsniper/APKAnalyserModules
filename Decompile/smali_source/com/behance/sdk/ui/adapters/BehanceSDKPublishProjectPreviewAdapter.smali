.class public Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;
.super Landroid/widget/ArrayAdapter;
.source "BehanceSDKPublishProjectPreviewAdapter.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/behance/sdk/project/modules/ProjectModule;",
        ">;",
        "Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;"
    }
.end annotation


# instance fields
.field private callbacks:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;

.field private layoutInflater:Landroid/view/LayoutInflater;

.field private numOfModulesLoaded:I

.field private numOfModulesLoading:I


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resource"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 49
    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoaded:I

    .line 51
    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoading:I

    .line 63
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    .line 64
    return-void
.end method

.method private checkForLoadingComplete()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 124
    iget v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoaded:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoaded:I

    iget v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoading:I

    if-lt v0, v1, :cond_18

    .line 125
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->callbacks:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;

    if-eqz v0, :cond_14

    .line 126
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->callbacks:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;

    invoke-interface {v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;->onViewLoadingComplete()V

    .line 127
    :cond_14
    iput v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoading:I

    .line 128
    iput v2, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoaded:I

    .line 130
    :cond_18
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 16
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 70
    if-nez p2, :cond_b

    .line 72
    iget-object v9, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    sget v10, Lcom/behance/sdk/R$layout;->bsdk_adapter_publish_project_preview_project_fragment_list_item:I

    const/4 v11, 0x0

    invoke-virtual {v9, v10, p3, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 74
    :cond_b
    invoke-virtual {p0, p1}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 75
    .local v6, "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    sget v9, Lcom/behance/sdk/R$id;->add_project_preview_project_fragment_image_view:I

    invoke-virtual {p2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 76
    .local v5, "imageView":Landroid/widget/ImageView;
    const/4 v9, 0x0

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 77
    sget v9, Lcom/behance/sdk/R$id;->add_project_preview_fragment_embed_view:I

    invoke-virtual {p2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 78
    .local v3, "embedContentLayout":Landroid/view/View;
    invoke-interface {v6}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v8

    .line 79
    .local v8, "type":Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    sget-object v9, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v9, v8}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_37

    sget-object v9, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v9, v8}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4d

    .line 80
    :cond_37
    const/16 v9, 0x8

    invoke-virtual {v3, v9}, Landroid/view/View;->setVisibility(I)V

    .line 81
    const/4 v9, 0x0

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    move-object v4, v6

    .line 82
    check-cast v4, Lcom/behance/sdk/project/modules/ImageModule;

    .line 83
    .local v4, "image":Lcom/behance/sdk/project/modules/ImageModule;
    iget v9, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoading:I

    add-int/lit8 v9, v9, 0x1

    iput v9, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->numOfModulesLoading:I

    .line 84
    invoke-virtual {v4, v5, p0}, Lcom/behance/sdk/project/modules/ImageModule;->displayImage(Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    .line 96
    .end local v4    # "image":Lcom/behance/sdk/project/modules/ImageModule;
    .end local v6    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_4c
    :goto_4c
    return-object p2

    .line 85
    .restart local v6    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_4d
    sget-object v9, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->EMBED:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v9, v8}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4c

    .line 86
    const/4 v9, 0x0

    invoke-virtual {v3, v9}, Landroid/view/View;->setVisibility(I)V

    .line 87
    const/16 v9, 0x8

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    move-object v9, v6

    .line 88
    check-cast v9, Lcom/behance/sdk/project/modules/EmbedModule;

    invoke-virtual {v9}, Lcom/behance/sdk/project/modules/EmbedModule;->getDescription()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "description":Ljava/lang/String;
    check-cast v6, Lcom/behance/sdk/project/modules/EmbedModule;

    .end local v6    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-virtual {v6}, Lcom/behance/sdk/project/modules/EmbedModule;->getSubDescription()Ljava/lang/String;

    move-result-object v7

    .line 90
    .local v7, "subDescription":Ljava/lang/String;
    sget v9, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewFragmentEmbedDesc:I

    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 91
    .local v1, "embedContentDecs":Landroid/widget/TextView;
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    sget v9, Lcom/behance/sdk/R$id;->bsdkPublishProjectPreviewFragmentEmbedSubDesc:I

    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 93
    .local v2, "embedContentDecssub":Landroid/widget/TextView;
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->checkForLoadingComplete()V

    goto :goto_4c
.end method

.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .registers 3
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;

    .prologue
    .line 102
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->checkForLoadingComplete()V

    .line 103
    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "loadedBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->checkForLoadingComplete()V

    .line 109
    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .registers 4
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "arg2"    # Lcom/nostra13/universalimageloader/core/assist/FailReason;

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->checkForLoadingComplete()V

    .line 115
    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .registers 3
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Landroid/view/View;

    .prologue
    .line 121
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter;->callbacks:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectPreviewAdapter$Callbacks;

    .line 59
    return-void
.end method
