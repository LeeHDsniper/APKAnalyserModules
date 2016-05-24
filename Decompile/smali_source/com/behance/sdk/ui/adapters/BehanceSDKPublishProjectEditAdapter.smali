.class public Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;
.super Landroid/widget/ArrayAdapter;
.source "BehanceSDKPublishProjectEditAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/behance/sdk/project/modules/ProjectModule;",
        ">;"
    }
.end annotation


# instance fields
.field private callback:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;

.field private layoutInflater:Landroid/view/LayoutInflater;


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
    .line 53
    .local p3, "projectModules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 54
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;)Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->callback:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;

    return-object v0
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 19
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 65
    move/from16 v8, p1

    .line 66
    .local v8, "itemPosition":I
    invoke-virtual {p0, v8}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/behance/sdk/project/modules/ProjectModule;

    .line 67
    .local v13, "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    if-nez p2, :cond_15

    .line 69
    iget-object v1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    sget v2, Lcom/behance/sdk/R$layout;->bsdk_adapter_publish_project_edit_fragment_grid_item:I

    const/4 v14, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v1, v2, v0, v14}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 73
    :cond_15
    sget v1, Lcom/behance/sdk/R$id;->add_project_edit_fragment_image_view:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 74
    .local v7, "imageView":Landroid/widget/ImageView;
    sget v1, Lcom/behance/sdk/R$id;->add_project_edit_fragment_image_view_duplicate:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 76
    .local v5, "imageViewDuplicate":Landroid/widget/ImageView;
    sget v1, Lcom/behance/sdk/R$id;->add_project_edit_fragment_embed_view:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    .line 77
    .local v11, "embedView":Landroid/view/View;
    sget v1, Lcom/behance/sdk/R$id;->add_project_edit_fragment_rotate_icon:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 78
    .local v4, "rotateImage":Landroid/view/View;
    invoke-interface {v13}, Lcom/behance/sdk/project/modules/ProjectModule;->getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    move-result-object v12

    .line 79
    .local v12, "moduleType":Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->IMAGE:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v1, v12}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4d

    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v1, v12}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_72

    :cond_4d
    move-object v6, v13

    .line 80
    check-cast v6, Lcom/behance/sdk/project/modules/ImageModule;

    .line 81
    .local v6, "image":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->getContext()Landroid/content/Context;

    move-result-object v3

    .line 82
    .local v3, "context":Landroid/content/Context;
    const/16 v1, 0x8

    invoke-virtual {v11, v1}, Landroid/view/View;->setVisibility(I)V

    .line 83
    const/4 v1, 0x0

    invoke-virtual {v7, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 84
    const/4 v1, 0x0

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 85
    invoke-virtual {v6, v3}, Lcom/behance/sdk/project/modules/ImageModule;->getThumbNail(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 86
    new-instance v1, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;

    move-object v2, p0

    invoke-direct/range {v1 .. v8}, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$1;-><init>(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;Landroid/content/Context;Landroid/view/View;Landroid/widget/ImageView;Lcom/behance/sdk/project/modules/ImageModule;Landroid/widget/ImageView;I)V

    invoke-virtual {v4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    .end local v3    # "context":Landroid/content/Context;
    .end local v6    # "image":Lcom/behance/sdk/project/modules/ImageModule;
    .end local v13    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_71
    :goto_71
    return-object p2

    .line 124
    .restart local v13    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    :cond_72
    sget-object v1, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->EMBED:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    invoke-virtual {v1, v12}, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_71

    .line 125
    const/16 v1, 0x8

    invoke-virtual {v7, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 126
    const/4 v1, 0x0

    invoke-virtual {v11, v1}, Landroid/view/View;->setVisibility(I)V

    .line 127
    const/16 v1, 0x8

    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 128
    check-cast v13, Lcom/behance/sdk/project/modules/EmbedModule;

    .end local v13    # "projectModule":Lcom/behance/sdk/project/modules/ProjectModule;
    invoke-virtual {v13}, Lcom/behance/sdk/project/modules/EmbedModule;->getDescription()Ljava/lang/String;

    move-result-object v9

    .line 129
    .local v9, "description":Ljava/lang/String;
    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishProjectEditFragmentEmbedDesc:I

    invoke-virtual {v11, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 130
    .local v10, "embedDesc":Landroid/widget/TextView;
    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_71
.end method

.method public setCallBack(Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;)V
    .registers 2
    .param p1, "callback"    # Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter;->callback:Lcom/behance/sdk/ui/adapters/BehanceSDKPublishProjectEditAdapter$Callbacks;

    .line 137
    return-void
.end method
