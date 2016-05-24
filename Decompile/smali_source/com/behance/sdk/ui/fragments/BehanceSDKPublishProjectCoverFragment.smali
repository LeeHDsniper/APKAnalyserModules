.class public Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;
.super Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;
.source "BehanceSDKPublishProjectCoverFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;
.implements Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;
    }
.end annotation


# instance fields
.field private addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

.field private cover:Lcom/behance/sdk/project/modules/CoverImage;

.field private coverImage:Lcom/behance/sdk/project/modules/ImageModule;

.field private coverImageBackground:Landroid/view/View;

.field private coverImageSelection:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;"
        }
    .end annotation
.end field

.field private cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

.field private croppedImage:Landroid/widget/ImageView;

.field private filmStripLayout:Landroid/widget/LinearLayout;

.field private listener:Landroid/view/View$OnClickListener;

.field private position:I

.field private progressBar:Landroid/view/View;

.field private state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;-><init>()V

    .line 74
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v0

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    .line 91
    return-void
.end method

.method static synthetic access$002(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;Lcom/behance/sdk/project/modules/CoverImage;)Lcom/behance/sdk/project/modules/CoverImage;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;
    .param p1, "x1"    # Lcom/behance/sdk/project/modules/CoverImage;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    return-object p1
.end method

.method static synthetic access$1000(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageBackground:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$102(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;
    .param p1, "x1"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    return-object p1
.end method

.method static synthetic access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;I)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;
    .param p1, "x1"    # I

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->showCoverImage(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    .prologue
    .line 53
    iget v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I

    return v0
.end method

.method static synthetic access$302(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;I)I
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;
    .param p1, "x1"    # I

    .prologue
    .line 53
    iput p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I

    return p1
.end method

.method static synthetic access$400(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/widget/LinearLayout;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->filmStripLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$500(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->hideSelector(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$600(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;Landroid/view/View;)V
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->showSelector(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$700(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Lcom/behance/sdk/edmodo/cropper/CropImageView;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->progressBar:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$900(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)Landroid/widget/ImageView;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->croppedImage:Landroid/widget/ImageView;

    return-object v0
.end method

.method private addImagesToLayout(Landroid/widget/LinearLayout;)V
    .registers 4
    .param p1, "layout"    # Landroid/widget/LinearLayout;

    .prologue
    .line 212
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_f

    .line 213
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addImagetoLayout(I)V

    .line 212
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 215
    :cond_f
    return-void
.end method

.method private addImagetoLayout(I)V
    .registers 9
    .param p1, "position"    # I

    .prologue
    .line 218
    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    .line 219
    .local v0, "image":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getLayoutInflater(Landroid/os/Bundle;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 220
    .local v2, "layoutInflater":Landroid/view/LayoutInflater;
    sget v5, Lcom/behance/sdk/R$layout;->bsdk_adapter_publish_project_cover_image_filmstrip_list_item:I

    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    check-cast v4, Landroid/view/ViewGroup;

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v4, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 221
    .local v3, "view":Landroid/view/View;
    sget v4, Lcom/behance/sdk/R$id;->bsdkPublishProjectCoverImageFilmStripImage:I

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 222
    .local v1, "imageView":Landroid/widget/ImageView;
    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-virtual {v0, v4}, Lcom/behance/sdk/project/modules/ImageModule;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_30

    .line 223
    iput p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I

    .line 224
    invoke-direct {p0, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->showSelector(Landroid/view/View;)V

    .line 226
    :cond_30
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/behance/sdk/project/modules/ImageModule;->getThumbNail(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 227
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getClickListenerForImages()Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->filmStripLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 229
    invoke-virtual {v3, p1}, Landroid/view/View;->setId(I)V

    .line 230
    return-void
.end method

.method private getClickListenerForImages()Landroid/view/View$OnClickListener;
    .registers 2

    .prologue
    .line 252
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->listener:Landroid/view/View$OnClickListener;

    if-nez v0, :cond_b

    .line 253
    new-instance v0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;

    invoke-direct {v0, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)V

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->listener:Landroid/view/View$OnClickListener;

    .line 272
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->listener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method private hideSelector(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 245
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->filmStripLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 246
    .local v0, "childAt":Landroid/view/View;
    if-eqz v0, :cond_b

    .line 247
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->hideSelector(Landroid/view/View;)V

    .line 249
    :cond_b
    return-void
.end method

.method private hideSelector(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 238
    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishProjectCoverImageFilmStripImageSelector:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 239
    .local v0, "selector":Landroid/view/View;
    if-eqz v0, :cond_d

    .line 240
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 241
    :cond_d
    return-void
.end method

.method private showCoverImage(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 289
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    .line 290
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->updateSelectedCoverImage()V

    .line 291
    return-void
.end method

.method private showSelector(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 233
    sget v1, Lcom/behance/sdk/R$id;->bsdkPublishProjectCoverImageFilmStripImageSelector:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 234
    .local v0, "selector":Landroid/view/View;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 235
    return-void
.end method

.method private updateSelectedCoverImage()V
    .registers 4

    .prologue
    .line 295
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    sget-object v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->DONE:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    if-ne v0, v1, :cond_26

    .line 296
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->croppedImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    invoke-virtual {v1}, Lcom/behance/sdk/project/modules/CoverImage;->getBitMap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 297
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->croppedImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 298
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->setVisibility(I)V

    .line 299
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageBackground:Landroid/view/View;

    sget v1, Lcom/behance/sdk/R$color;->bsdk_add_project_cover_image_fragment_done_state_background:I

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 334
    :goto_25
    return-void

    .line 301
    :cond_26
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v0, :cond_3b

    .line 302
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    new-instance v2, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;

    invoke-direct {v2, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$2;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;)V

    invoke-virtual {v0, v1, v2}, Lcom/behance/sdk/project/modules/ImageModule;->displayImage(Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    goto :goto_25

    .line 331
    :cond_3b
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->disableActionBarRightNav()V

    goto :goto_25
.end method


# virtual methods
.method protected backButtonPressed()V
    .registers 4

    .prologue
    .line 107
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    if-nez v0, :cond_e

    .line 108
    new-instance v0, Lcom/behance/sdk/project/modules/CoverImage;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/project/modules/CoverImage;-><init>(Lcom/behance/sdk/project/modules/ImageModule;Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    .line 110
    :cond_e
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setSelectedCoverImage(Lcom/behance/sdk/project/modules/CoverImage;)V

    .line 111
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->backButtonPressed()V

    .line 112
    return-void
.end method

.method protected getLayout()I
    .registers 2

    .prologue
    .line 97
    sget v0, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_publish_project_select_cover:I

    return v0
.end method

.method protected getTitle()I
    .registers 2

    .prologue
    .line 102
    sget v0, Lcom/behance/sdk/R$string;->bsdk_add_content_project_cover_selection_title:I

    return v0
.end method

.method protected nextButtonPressed()V
    .registers 5

    .prologue
    .line 116
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    sget-object v2, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->DONE:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    if-ne v1, v2, :cond_11

    .line 117
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    invoke-virtual {v1, v2}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->setSelectedCoverImage(Lcom/behance/sdk/project/modules/CoverImage;)V

    .line 118
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->nextButtonPressed()V

    .line 127
    :cond_10
    :goto_10
    return-void

    .line 119
    :cond_11
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    sget-object v2, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    if-ne v1, v2, :cond_10

    .line 120
    sget-object v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->DONE:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    .line 121
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->actionBarForwardButton:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$string;->bsdk_addproject_custom_actionbar_forward_nav_default_txt:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    invoke-virtual {v1}, Lcom/behance/sdk/edmodo/cropper/CropImageView;->getCroppedImage()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 123
    .local v0, "croppedImage":Landroid/graphics/Bitmap;
    new-instance v1, Lcom/behance/sdk/project/modules/CoverImage;

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-direct {v1, v2, v0}, Lcom/behance/sdk/project/modules/CoverImage;-><init>(Lcom/behance/sdk/project/modules/ImageModule;Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    .line 124
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    .line 125
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->updateSelectedCoverImage()V

    goto :goto_10
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 131
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onAttach(Landroid/app/Activity;)V

    .line 132
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addProjectModuleChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;)V

    .line 133
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 199
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    .line 200
    .local v1, "id":I
    sget v3, Lcom/behance/sdk/R$id;->add_project_cover_selection_fragment_add_btn:I

    if-ne v1, v3, :cond_21

    .line 201
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    .line 202
    .local v0, "context":Landroid/content/Context;
    instance-of v3, v0, Landroid/support/v4/app/FragmentActivity;

    if-eqz v3, :cond_21

    .line 203
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    .line 204
    .local v2, "supportFragmentManager":Landroid/support/v4/app/FragmentManager;
    invoke-static {}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getUnlimitedImageSelectionOptions()Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    move-result-object v3

    const-string v4, "FRAGMENT_TAG_ADD_PROJECT_COVER_NEW_IMAGE_SELECTION_FRAGMENT"

    invoke-static {p0, v3, v2, v4}, Lcom/behance/sdk/util/BehanceSDKLaunchUtil;->launchAlbumsViewToPickPicture(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKImageSelectorOptions;Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 209
    .end local v0    # "context":Landroid/content/Context;
    .end local v2    # "supportFragmentManager":Landroid/support/v4/app/FragmentManager;
    :cond_21
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 12
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x0

    .line 143
    invoke-super {p0, p1, p2, p3}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 144
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    invoke-virtual {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->hideSoftKeyBoardIfActive(Landroid/view/View;)V

    .line 145
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->add_project_cover_selection_fragment_cover_image_layout:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageBackground:Landroid/view/View;

    .line 146
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->add_project_cover_selection_fragment_cover_image:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/edmodo/cropper/CropImageView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cropImageView:Lcom/behance/sdk/edmodo/cropper/CropImageView;

    .line 147
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->add_project_cover_selection_fragment_cropped_cover_Image:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->croppedImage:Landroid/widget/ImageView;

    .line 148
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->bsdkPublishProjectCoverPrgressBar:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->progressBar:Landroid/view/View;

    .line 149
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->add_project_cover_selection_fragment_selected_images:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->filmStripLayout:Landroid/widget/LinearLayout;

    .line 150
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v5}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getImagesSelectedForCover()Ljava/util/List;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    .line 151
    if-eqz p3, :cond_ed

    .line 152
    const-string v5, "ADD_PROJECT_COVER_IMAGE_KEY"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/project/modules/ImageModule;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    .line 153
    const-string v5, "ADD_PROJECT_COVER_IMAGE_SELECTION_STATE"

    sget-object v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    invoke-virtual {v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p3, v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->valueOf(Ljava/lang/String;)Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    .line 154
    const-string v5, "ADD_PROJECT_CROPPED_COVER_IMAGE_KEY"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 155
    .local v0, "coverImageBitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_80

    .line 156
    const-string v5, "ADD_PROJECT_CROPPED_COVER_IMAGE_ORIGINAL_KEY"

    invoke-virtual {p3, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, Lcom/behance/sdk/project/modules/ImageModule;

    .line 157
    .local v3, "orginalImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    new-instance v5, Lcom/behance/sdk/project/modules/CoverImage;

    invoke-direct {v5, v3, v0}, Lcom/behance/sdk/project/modules/CoverImage;-><init>(Lcom/behance/sdk/project/modules/ImageModule;Landroid/graphics/Bitmap;)V

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    .line 162
    .end local v0    # "coverImageBitmap":Landroid/graphics/Bitmap;
    .end local v3    # "orginalImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_80
    :goto_80
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    if-eqz v5, :cond_108

    .line 163
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    invoke-virtual {v5}, Lcom/behance/sdk/project/modules/CoverImage;->getOriginalImage()Lcom/behance/sdk/project/modules/ImageModule;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    .line 164
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_f6

    .line 165
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/project/modules/ImageModule;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    .line 166
    iput v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I

    .line 167
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    .line 168
    sget-object v5, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    .line 180
    :cond_a9
    :goto_a9
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    sget-object v6, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    if-ne v5, v6, :cond_be

    .line 181
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->actionBarForwardButton:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/behance/sdk/R$string;->bsdk_addproject_project_cover_selection_right_nav_crop_txt:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    :cond_be
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->filmStripLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addImagesToLayout(Landroid/widget/LinearLayout;)V

    .line 184
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->updateSelectedCoverImage()V

    .line 185
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    sget v6, Lcom/behance/sdk/R$id;->add_project_cover_selection_fragment_add_btn:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 186
    .local v2, "inflate":Landroid/view/View;
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    if-eqz p3, :cond_ea

    .line 188
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    .line 189
    .local v4, "supportFragmentManager":Landroid/support/v4/app/FragmentManager;
    const-string v5, "FRAGMENT_TAG_ADD_PROJECT_COVER_NEW_IMAGE_SELECTION_FRAGMENT"

    invoke-virtual {v4, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 190
    .local v1, "imageChooserFragmentInstance":Landroid/support/v4/app/Fragment;
    instance-of v5, v1, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    if-eqz v5, :cond_ea

    .line 191
    check-cast v1, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    .end local v1    # "imageChooserFragmentInstance":Landroid/support/v4/app/Fragment;
    invoke-virtual {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;)V

    .line 194
    .end local v4    # "supportFragmentManager":Landroid/support/v4/app/FragmentManager;
    :cond_ea
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->rootView:Landroid/view/View;

    return-object v5

    .line 160
    .end local v2    # "inflate":Landroid/view/View;
    :cond_ed
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v5}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getSelectedCoverImage()Lcom/behance/sdk/project/modules/CoverImage;

    move-result-object v5

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    goto :goto_80

    .line 169
    :cond_f6
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    invoke-virtual {v5}, Lcom/behance/sdk/project/modules/CoverImage;->getBitMap()Landroid/graphics/Bitmap;

    move-result-object v5

    if-eqz v5, :cond_103

    .line 170
    sget-object v5, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->DONE:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    goto :goto_a9

    .line 172
    :cond_103
    sget-object v5, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    goto :goto_a9

    .line 174
    :cond_108
    sget-object v5, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    .line 175
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    if-nez v5, :cond_a9

    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_a9

    .line 176
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/behance/sdk/project/modules/ImageModule;

    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    .line 177
    iput v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I

    goto :goto_a9
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 137
    invoke-super {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onDetach()V

    .line 138
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v0, p0}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->removeProjectModuleChangeListener(Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager$ProjectModuleChangeListener;)V

    .line 139
    return-void
.end method

.method public onImageSelectorOnError(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 369
    return-void
.end method

.method public onImageSelectorSelectionBackPressed()V
    .registers 1

    .prologue
    .line 364
    return-void
.end method

.method public onImageSelectorSelectionCanceled()V
    .registers 1

    .prologue
    .line 359
    return-void
.end method

.method public onImageSelectorSelectionFinished(Ljava/util/List;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "selectedImageModulesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    const/4 v4, 0x0

    .line 338
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    move-result-object v3

    .line 339
    .local v3, "wfManager":Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;
    invoke-virtual {v3, p1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->addImagesSelectedForCover(Ljava/util/List;)V

    .line 340
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v2

    .line 341
    .local v2, "size":I
    if-nez v2, :cond_2a

    const/4 v0, 0x1

    .line 342
    .local v0, "autoSelect":Z
    :goto_11
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 343
    if-eqz v0, :cond_2c

    .line 344
    invoke-direct {p0, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->showCoverImage(I)V

    .line 350
    :goto_1b
    move v1, v2

    .local v1, "i":I
    :goto_1c
    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_35

    .line 351
    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addImagetoLayout(I)V

    .line 350
    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    .end local v0    # "autoSelect":Z
    .end local v1    # "i":I
    :cond_2a
    move v0, v4

    .line 341
    goto :goto_11

    .line 347
    .restart local v0    # "autoSelect":Z
    :cond_2c
    iget v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I

    invoke-direct {p0, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->hideSelector(I)V

    .line 348
    invoke-direct {p0, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->showCoverImage(I)V

    goto :goto_1b

    .line 354
    .restart local v1    # "i":I
    :cond_35
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 277
    invoke-super {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectBaseFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 278
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    if-eqz v0, :cond_12

    .line 279
    const-string v0, "ADD_PROJECT_COVER_IMAGE_SELECTION_STATE"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    invoke-virtual {v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    :cond_12
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v0, :cond_1d

    .line 281
    const-string v0, "ADD_PROJECT_COVER_IMAGE_KEY"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 282
    :cond_1d
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    if-eqz v0, :cond_37

    .line 283
    const-string v0, "ADD_PROJECT_CROPPED_COVER_IMAGE_KEY"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    invoke-virtual {v1}, Lcom/behance/sdk/project/modules/CoverImage;->getBitMap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 284
    const-string v0, "ADD_PROJECT_CROPPED_COVER_IMAGE_ORIGINAL_KEY"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    invoke-virtual {v1}, Lcom/behance/sdk/project/modules/CoverImage;->getOriginalImage()Lcom/behance/sdk/project/modules/ImageModule;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 286
    :cond_37
    return-void
.end method

.method public projectModulesChanged(Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ProjectModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "modules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ProjectModule;>;"
    const/4 v3, 0x0

    .line 373
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addProjectManager:Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;

    invoke-virtual {v1}, Lcom/behance/sdk/managers/BehanceSDKProjectPublishWFManager;->getImagesSelectedForCover()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    .line 374
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    if-eqz v1, :cond_58

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_58

    .line 375
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_44

    .line 376
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/behance/sdk/project/modules/ImageModule;

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    .line 377
    iput v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->position:I

    .line 378
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->cover:Lcom/behance/sdk/project/modules/CoverImage;

    .line 379
    sget-object v1, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;->INPROGRESS:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    iput-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->state:Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment$CropMode;

    .line 380
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->actionBarForwardButton:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/behance/sdk/R$string;->bsdk_addproject_project_cover_selection_right_nav_crop_txt:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->updateSelectedCoverImage()V

    .line 383
    :cond_44
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->filmStripLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 384
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4a
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_58

    .line 385
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addImagetoLayout(I)V

    .line 384
    add-int/lit8 v0, v0, 0x1

    goto :goto_4a

    .line 388
    .end local v0    # "i":I
    :cond_58
    return-void
.end method

.method public rotateImage(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 4
    .param p1, "module"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 392
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->filmStripLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 393
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImageSelection:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_14

    .line 394
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->addImagetoLayout(I)V

    .line 393
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 396
    :cond_14
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->coverImage:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-virtual {p1, v1}, Lcom/behance/sdk/project/modules/ImageModule;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 397
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKPublishProjectCoverFragment;->updateSelectedCoverImage()V

    .line 398
    :cond_1f
    return-void
.end method
