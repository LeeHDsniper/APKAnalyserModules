.class public Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "BehanceSDKImageSelectorDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private albumImagesGridView:Landroid/widget/GridView;

.field private albumsGridView:Landroid/widget/GridView;

.field private allowedFileExtensionsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

.field private headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

.field private imageValidatorType:Ljava/lang/String;

.field private lastDisplayedAlbumIndex:I

.field private maxImageHeight:I

.field private maxImageSizeBytes:J

.field private maxImageWidth:I

.field private maxNumberOfImages:I

.field private minImageHeight:I

.field private minImageSizeBytes:J

.field private minImageWidth:I

.field private progressSpinner:Landroid/view/View;

.field private prohibitedFileExtensionsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private selectedCameraImageUri:Landroid/net/Uri;

.field private selectedImageModulesList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;"
        }
    .end annotation
.end field

.field private showImageSelectionSources:Z

.field private titleBarActionBtnTxtView:Landroid/widget/TextView;

.field private titleBarTitleTxtView:Landroid/widget/TextView;

.field private viewFlipper:Landroid/widget/ViewFlipper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 71
    const-class v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 123
    return-void
.end method

.method static synthetic access$000(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
    .param p1, "x1"    # Landroid/widget/AdapterView;
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # I
    .param p4, "x4"    # J

    .prologue
    .line 68
    invoke-direct/range {p0 .. p5}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->onAlbumGridItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method static synthetic access$100(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
    .param p1, "x1"    # Landroid/widget/AdapterView;
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # I
    .param p4, "x4"    # J

    .prologue
    .line 68
    invoke-direct/range {p0 .. p5}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->onAlbumImageGridItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method static synthetic access$200(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;)Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;
    .registers 2
    .param p0, "x0"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

    return-object v0
.end method

.method private clearAlbumsCache()V
    .registers 2

    .prologue
    .line 501
    invoke-static {}, Lcom/behance/sdk/files/LocalImageLoader;->clearCachedAlbumAndImagesData()V

    .line 502
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    if-eqz v0, :cond_c

    .line 503
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->clearAlbumsCache()V

    .line 505
    :cond_c
    return-void
.end method

.method private closeThisDialog()V
    .registers 1

    .prologue
    .line 705
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->dismissAllowingStateLoss()V

    .line 706
    return-void
.end method

.method private displayAlbumsView()V
    .registers 4

    .prologue
    .line 563
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarTitleTxtView:Landroid/widget/TextView;

    sget v1, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_title_albums_txt:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 566
    iget v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    sget v1, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    if-ne v0, v1, :cond_2c

    .line 567
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v1, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_multiple_photos_cancel_label:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 572
    :goto_14
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 573
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    sget v2, Lcom/behance/sdk/R$anim;->bsdk_dialog_exit:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/content/Context;I)V

    .line 574
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 575
    return-void

    .line 569
    :cond_2c
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v1, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_cancel_label:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_14
.end method

.method private displaySelectedAlbumImagesView(Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;Z)V
    .registers 12
    .param p1, "albumDTO"    # Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    .param p2, "animateViewDisplay"    # Z

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 578
    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getImages()Ljava/util/List;

    move-result-object v2

    .line 579
    .local v2, "selectedAlbumImages":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    if-eqz v2, :cond_78

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_78

    .line 581
    new-instance v0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v0, v3, v2}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 582
    .local v0, "albumImagesGridAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->setSelectedImageModulesList(Ljava/util/List;)V

    .line 583
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->albumImagesGridView:Landroid/widget/GridView;

    invoke-virtual {v3, v0}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 585
    iget v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    sget v4, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    if-ne v3, v4, :cond_5e

    .line 586
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarTitleTxtView:Landroid/widget/TextView;

    sget v4, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_title_choose_photos_txt:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 587
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_56

    .line 588
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v4, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_multiple_photos_done_label:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 599
    :goto_3e
    if-eqz p2, :cond_6d

    .line 600
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    sget v5, Lcom/behance/sdk/R$anim;->bsdk_dialog_enter:I

    invoke-virtual {v3, v4, v5}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/content/Context;I)V

    .line 601
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v3, v6}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 606
    :goto_50
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v3, v8}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 612
    .end local v0    # "albumImagesGridAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;
    :goto_55
    return-void

    .line 590
    .restart local v0    # "albumImagesGridAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;
    :cond_56
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v4, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_multiple_photos_cancel_label:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_3e

    .line 595
    :cond_5e
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarTitleTxtView:Landroid/widget/TextView;

    sget v4, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_title_choose_single_photo_txt:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 596
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v4, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_cancel_label:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_3e

    .line 603
    :cond_6d
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v3, v6}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 604
    iget-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v3, v6}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    goto :goto_50

    .line 608
    .end local v0    # "albumImagesGridAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;
    :cond_78
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_empty_album_msg:I

    new-array v5, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v3, v4, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 609
    .local v1, "messageStr":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-static {v3, v1, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 610
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayAlbumsView()V

    goto :goto_55
.end method

.method private displayToastMessage(Ljava/lang/String;)V
    .registers 4
    .param p1, "msgToDisplay"    # Ljava/lang/String;

    .prologue
    .line 476
    if-eqz p1, :cond_e

    .line 477
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 479
    :cond_e
    return-void
.end method

.method public static getInstance(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;Lcom/behance/sdk/BehanceSDKImageSelectorOptions;)Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
    .registers 10
    .param p0, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;
    .param p1, "options"    # Lcom/behance/sdk/BehanceSDKImageSelectorOptions;

    .prologue
    .line 134
    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;

    invoke-direct {v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;-><init>()V

    .line 135
    .local v1, "fragmentInstance":Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;
    invoke-virtual {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;)V

    .line 136
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 137
    .local v0, "args":Landroid/os/Bundle;
    if-eqz p1, :cond_82

    .line 138
    const-string v4, "ARGS_MAX_NUMBER_OF_IMAGES"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getMaxNumberOfImages()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 139
    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getMinImageDimensions()Lcom/behance/sdk/BehanceSDKImageDimensions;

    move-result-object v3

    .line 140
    .local v3, "minImageDimensions":Lcom/behance/sdk/BehanceSDKImageDimensions;
    if-eqz v3, :cond_30

    .line 141
    const-string v4, "ARGS_MIN_IMAGE_WIDTH"

    invoke-virtual {v3}, Lcom/behance/sdk/BehanceSDKImageDimensions;->getWidth()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 142
    const-string v4, "ARGS_MIN_IMAGE_HEIGHT"

    invoke-virtual {v3}, Lcom/behance/sdk/BehanceSDKImageDimensions;->getHeight()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 145
    :cond_30
    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getMaxImageDimensions()Lcom/behance/sdk/BehanceSDKImageDimensions;

    move-result-object v2

    .line 146
    .local v2, "maxImageDimensions":Lcom/behance/sdk/BehanceSDKImageDimensions;
    if-eqz v2, :cond_48

    .line 147
    const-string v4, "ARGS_MAX_IMAGE_WIDTH"

    invoke-virtual {v2}, Lcom/behance/sdk/BehanceSDKImageDimensions;->getWidth()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 148
    const-string v4, "ARGS_MAX_IMAGE_HEIGHT"

    invoke-virtual {v2}, Lcom/behance/sdk/BehanceSDKImageDimensions;->getHeight()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 150
    :cond_48
    const-string v4, "ARGS_ALBUMS_WITH_IMAGE_SELECTION_SOURCES"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->isShowImageImageSelectionSources()Z

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 152
    const-string v4, "ARGS_MIN_IMAGE_SIZE_BYTES"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getMinImageSizeInBytes()J

    move-result-wide v6

    invoke-virtual {v0, v4, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 153
    const-string v4, "ARGS_MAX_IMAGE_SIZE_BYTES"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getMaxImageSizeInBytes()J

    move-result-wide v6

    invoke-virtual {v0, v4, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 155
    const-string v4, "ARGS_ALLOWED_FILE_EXTENSIONS_LIST"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getAllowedFileExtensions()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 156
    const-string v4, "ARGS_PROHIBITED_FILE_EXTENSIONS_LIST"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getProhibitedFileExtensions()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 157
    const-string v4, "ARGS_IMAGE_VALITATOR_TYPE"

    invoke-virtual {p1}, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->getImageValidatorType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    .end local v2    # "maxImageDimensions":Lcom/behance/sdk/BehanceSDKImageDimensions;
    .end local v3    # "minImageDimensions":Lcom/behance/sdk/BehanceSDKImageDimensions;
    :goto_7e
    invoke-virtual {v1, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 162
    return-object v1

    .line 159
    :cond_82
    const-string v4, "ARGS_MAX_NUMBER_OF_IMAGES"

    sget v5, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_7e
.end method

.method private handleActionBtnClick()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 341
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 342
    .local v0, "displayedChildIndex":I
    if-ne v0, v2, :cond_32

    .line 343
    iget v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    if-gt v1, v2, :cond_13

    iget v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    sget v2, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    if-ne v1, v2, :cond_2b

    .line 344
    :cond_13
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 345
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnCancel()V

    .line 346
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    .line 359
    :goto_21
    return-void

    .line 348
    :cond_22
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnImageSelection(Ljava/util/List;)V

    .line 349
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    goto :goto_21

    .line 352
    :cond_2b
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnCancel()V

    .line 353
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    goto :goto_21

    .line 356
    :cond_32
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnCancel()V

    .line 357
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    goto :goto_21
.end method

.method private handleBackBtnClick()V
    .registers 3

    .prologue
    .line 331
    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 332
    .local v0, "displayedChildIndex":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_d

    .line 333
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayAlbumsView()V

    .line 338
    :goto_c
    return-void

    .line 335
    :cond_d
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnBackPressed()V

    .line 336
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    goto :goto_c
.end method

.method private hideProgressSpinner()V
    .registers 3

    .prologue
    .line 724
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->progressSpinner:Landroid/view/View;

    if-eqz v0, :cond_b

    .line 725
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->progressSpinner:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 727
    :cond_b
    return-void
.end method

.method private imageMatchesRequirements(Lcom/behance/sdk/project/modules/ImageModule;)Z
    .registers 16
    .param p1, "imageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 399
    invoke-virtual {p1}, Lcom/behance/sdk/project/modules/ImageModule;->getName()Ljava/lang/String;

    move-result-object v1

    .line 400
    .local v1, "fileName":Ljava/lang/String;
    invoke-static {v1}, Lcom/behance/sdk/util/BehanceSDKUtils;->getFileExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 401
    .local v0, "fileExtension":Ljava/lang/String;
    if-eqz v0, :cond_6c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_6c

    .line 402
    iget-object v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->prohibitedFileExtensionsList:Ljava/util/ArrayList;

    if-eqz v8, :cond_3e

    iget-object v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->prohibitedFileExtensionsList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3e

    .line 403
    iget-object v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->prohibitedFileExtensionsList:Ljava/util/ArrayList;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3e

    .line 404
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_file_type_not_allowed_msg:I

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->prohibitedFileExtensionsList:Ljava/util/ArrayList;

    .line 405
    invoke-virtual {v11}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    .line 404
    invoke-virtual {p0, v8, v9}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 406
    .local v6, "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 407
    const/4 v8, 0x0

    .line 471
    .end local v6    # "msgToDisplay":Ljava/lang/String;
    :goto_3d
    return v8

    .line 411
    :cond_3e
    iget-object v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->allowedFileExtensionsList:Ljava/util/ArrayList;

    if-eqz v8, :cond_7d

    iget-object v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->allowedFileExtensionsList:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_7d

    .line 412
    iget-object v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->allowedFileExtensionsList:Ljava/util/ArrayList;

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7d

    .line 413
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_file_type_allowed_msg:I

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->allowedFileExtensionsList:Ljava/util/ArrayList;

    .line 414
    invoke-virtual {v11}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    .line 413
    invoke-virtual {p0, v8, v9}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 415
    .restart local v6    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 416
    const/4 v8, 0x0

    goto :goto_3d

    .line 420
    .end local v6    # "msgToDisplay":Ljava/lang/String;
    :cond_6c
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_file_type_invalid_msg:I

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v1, v9, v10

    invoke-virtual {p0, v8, v9}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 421
    .restart local v6    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 422
    const/4 v8, 0x0

    goto :goto_3d

    .line 425
    .end local v6    # "msgToDisplay":Ljava/lang/String;
    :cond_7d
    invoke-virtual {p1}, Lcom/behance/sdk/project/modules/ImageModule;->getWidth()I

    move-result v3

    .line 426
    .local v3, "imageWidth":I
    invoke-virtual {p1}, Lcom/behance/sdk/project/modules/ImageModule;->getHeight()I

    move-result v2

    .line 427
    .local v2, "imageHeight":I
    invoke-virtual {p1}, Lcom/behance/sdk/project/modules/ImageModule;->getSizeInBytes()J

    move-result-wide v4

    .line 429
    .local v4, "imageSizeInBytes":J
    const-wide/16 v8, 0x0

    cmp-long v8, v4, v8

    if-lez v8, :cond_101

    .line 430
    iget-wide v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageSizeBytes:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_c8

    iget-wide v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageSizeBytes:J

    cmp-long v8, v4, v8

    if-gez v8, :cond_c8

    .line 431
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v10, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageSizeBytes:J

    const-wide/32 v12, 0x100000

    div-long/2addr v10, v12

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " MB"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 432
    .local v7, "sizeInMBStr":Ljava/lang/String;
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_size_less_than_min_required_msg:I

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    invoke-virtual {p0, v8, v9}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 433
    .restart local v6    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 434
    const/4 v8, 0x0

    goto/16 :goto_3d

    .line 437
    .end local v6    # "msgToDisplay":Ljava/lang/String;
    .end local v7    # "sizeInMBStr":Ljava/lang/String;
    :cond_c8
    iget-wide v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageSizeBytes:J

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-lez v8, :cond_10d

    iget-wide v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageSizeBytes:J

    cmp-long v8, v4, v8

    if-lez v8, :cond_10d

    .line 438
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v10, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageSizeBytes:J

    const-wide/32 v12, 0x100000

    div-long/2addr v10, v12

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " MB"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 439
    .restart local v7    # "sizeInMBStr":Ljava/lang/String;
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_size_more_than_max_allowed_msg:I

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    invoke-virtual {p0, v8, v9}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 440
    .restart local v6    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 441
    const/4 v8, 0x0

    goto/16 :goto_3d

    .line 444
    .end local v6    # "msgToDisplay":Ljava/lang/String;
    .end local v7    # "sizeInMBStr":Ljava/lang/String;
    :cond_101
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_size_invalid_msg:I

    invoke-virtual {p0, v8}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 445
    .restart local v6    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 446
    const/4 v8, 0x0

    goto/16 :goto_3d

    .line 449
    .end local v6    # "msgToDisplay":Ljava/lang/String;
    :cond_10d
    if-lez v3, :cond_192

    if-lez v2, :cond_192

    .line 450
    iget v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageWidth:I

    if-lez v8, :cond_150

    iget v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageHeight:I

    if-lez v8, :cond_150

    .line 451
    iget v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageWidth:I

    if-lt v3, v8, :cond_121

    iget v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageHeight:I

    if-ge v2, v8, :cond_150

    .line 452
    :cond_121
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_dimensions_less_than_min_required_msg:I

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget v11, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageWidth:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    iget v11, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageHeight:I

    .line 453
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    .line 452
    invoke-virtual {p0, v8, v9}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 454
    .restart local v6    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 455
    const/4 v8, 0x0

    goto/16 :goto_3d

    .line 459
    .end local v6    # "msgToDisplay":Ljava/lang/String;
    :cond_150
    iget v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageWidth:I

    if-lez v8, :cond_18f

    iget v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageHeight:I

    if-lez v8, :cond_18f

    .line 460
    iget v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageWidth:I

    if-gt v3, v8, :cond_160

    iget v8, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageHeight:I

    if-le v2, v8, :cond_18f

    .line 461
    :cond_160
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_dimensions_more_than_max_allowed_msg:I

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget v11, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageWidth:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    iget v11, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageHeight:I

    .line 462
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    .line 461
    invoke-virtual {p0, v8, v9}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 463
    .restart local v6    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 464
    const/4 v8, 0x0

    goto/16 :goto_3d

    .line 467
    .end local v6    # "msgToDisplay":Ljava/lang/String;
    :cond_18f
    const/4 v8, 0x1

    goto/16 :goto_3d

    .line 469
    :cond_192
    sget v8, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_image_dimensions_invalid_msg:I

    invoke-virtual {p0, v8}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 470
    .restart local v6    # "msgToDisplay":Ljava/lang/String;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displayToastMessage(Ljava/lang/String;)V

    .line 471
    const/4 v8, 0x0

    goto/16 :goto_3d
.end method

.method private launchCameraToCapturePicture()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 632
    :try_start_2
    invoke-static {}, Lcom/behance/sdk/util/BehanceSDKUtils;->createTempImageFile()Ljava/io/File;

    move-result-object v1

    .line 633
    .local v1, "photoFile":Ljava/io/File;
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 635
    .local v2, "takePictureIntent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/app/FragmentActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v3

    if-eqz v3, :cond_2f

    .line 637
    if-eqz v1, :cond_2e

    .line 639
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedCameraImageUri:Landroid/net/Uri;

    .line 640
    const-string v3, "output"

    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedCameraImageUri:Landroid/net/Uri;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 641
    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 651
    .end local v1    # "photoFile":Ljava/io/File;
    .end local v2    # "takePictureIntent":Landroid/content/Intent;
    :cond_2e
    :goto_2e
    return-void

    .line 644
    .restart local v1    # "photoFile":Ljava/io/File;
    .restart local v2    # "takePictureIntent":Landroid/content/Intent;
    :cond_2f
    sget-object v3, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v4, "Camera intent not found"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 645
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$string;->bsdk_add_wip_pick_source_view_camera_launch_error:I

    const/4 v5, 0x1

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_47} :catch_48

    goto :goto_2e

    .line 647
    .end local v1    # "photoFile":Ljava/io/File;
    .end local v2    # "takePictureIntent":Landroid/content/Intent;
    :catch_48
    move-exception v0

    .line 648
    .local v0, "ex":Ljava/io/IOException;
    sget-object v3, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v4, "Problem creating temp file to capture image"

    new-array v5, v7, [Ljava/lang/Object;

    invoke-interface {v3, v0, v4, v5}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 649
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    sget v4, Lcom/behance/sdk/R$string;->bsdk_add_wip_pick_source_view_camera_launch_error:I

    invoke-static {v3, v4, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_2e
.end method

.method private launchCreativeCloudAssetBrowser()V
    .registers 7

    .prologue
    .line 615
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 616
    .local v1, "context":Landroid/app/Activity;
    new-instance v2, Landroid/content/Intent;

    const-class v4, Lcom/behance/sdk/ui/activities/BehanceSDKCCLauncherActivity;

    invoke-direct {v2, v1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 617
    .local v2, "detailsIntent":Landroid/content/Intent;
    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->allowedFileExtensionsList:Ljava/util/ArrayList;

    invoke-static {v4}, Lcom/behance/sdk/util/BehanceSDKUtils;->getAdobeAssetMimeTypes(Ljava/util/List;)Ljava/util/EnumSet;

    move-result-object v3

    .line 618
    .local v3, "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    if-eqz v3, :cond_18

    .line 619
    const-string v4, "ARGS_ALLOWED_MIME_TYPES"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 621
    :cond_18
    iget v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_2a

    .line 622
    sget-object v4, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->ENABLE_MULTI_SELECT:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;->SHOW_MULTI_SELECT_ON_POPUP:Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;

    invoke-static {v4, v5}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    .line 623
    .local v0, "browserOptions":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;>;"
    const-string v4, "ARGS_ASSET_BROWSER_OPTIONS"

    invoke-virtual {v2, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 625
    .end local v0    # "browserOptions":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeUXAssetBrowserOption;>;"
    :cond_2a
    iget-object v4, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->imageValidatorType:Ljava/lang/String;

    if-eqz v4, :cond_35

    .line 626
    const-string v4, "ARGS_IMAGE_VALIDATOR_TYPE"

    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->imageValidatorType:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 627
    :cond_35
    const/16 v4, 0x1a85

    invoke-virtual {p0, v2, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 628
    return-void
.end method

.method private loadAlbums()V
    .registers 2

    .prologue
    .line 282
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->getAlbumsList()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    invoke-virtual {v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->getAlbumsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 283
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setAlbumsGridAdapter()V

    .line 284
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->hideProgressSpinner()V

    .line 288
    :goto_1a
    return-void

    .line 286
    :cond_1b
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->loadAlbumsFromDevice()V

    goto :goto_1a
.end method

.method private loadAlbumsFromDevice()V
    .registers 4

    .prologue
    .line 291
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->showProgressSpinner()V

    .line 292
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-boolean v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->showImageSelectionSources:Z

    invoke-virtual {v0, v1, v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->loadAlbums(Landroid/content/Context;Z)V

    .line 293
    return-void
.end method

.method private notifyCallbacksOnBackPressed()V
    .registers 3

    .prologue
    .line 521
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->clearAlbumsCache()V

    .line 522
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

    if-eqz v0, :cond_11

    .line 523
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$5;

    invoke-direct {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$5;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->post(Ljava/lang/Runnable;)Z

    .line 531
    :cond_11
    return-void
.end method

.method private notifyCallbacksOnCameraImageCaptureSuccess(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 3
    .param p1, "imageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 482
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 483
    .local v0, "modulesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 484
    invoke-direct {p0, v0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnImageSelection(Ljava/util/List;)V

    .line 485
    return-void
.end method

.method private notifyCallbacksOnCancel()V
    .registers 3

    .prologue
    .line 508
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->clearAlbumsCache()V

    .line 509
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

    if-eqz v0, :cond_11

    .line 510
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$4;

    invoke-direct {v1, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$4;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->post(Ljava/lang/Runnable;)Z

    .line 518
    :cond_11
    return-void
.end method

.method private notifyCallbacksOnError(Ljava/lang/Exception;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 534
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->clearAlbumsCache()V

    .line 535
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

    if-eqz v0, :cond_11

    .line 536
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$6;

    invoke-direct {v1, p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$6;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;Ljava/lang/Exception;)V

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->post(Ljava/lang/Runnable;)Z

    .line 544
    :cond_11
    return-void
.end method

.method private notifyCallbacksOnImageSelection(Ljava/util/List;)V
    .registers 4
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
    .line 488
    .local p1, "imageModulesList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->clearAlbumsCache()V

    .line 489
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

    if-eqz v0, :cond_11

    .line 490
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    new-instance v1, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$3;

    invoke-direct {v1, p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$3;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->post(Ljava/lang/Runnable;)Z

    .line 498
    :cond_11
    return-void
.end method

.method private onAlbumGridItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 10
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 547
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v1

    .line 548
    .local v1, "selectedItemObject":Ljava/lang/Object;
    instance-of v2, v1, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    if-eqz v2, :cond_21

    .line 549
    iput p3, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->lastDisplayedAlbumIndex:I

    .line 550
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    .line 551
    .local v0, "selectedImageAlbum":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getAlbumType()Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    move-result-object v2

    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->DEVICE_ALBUM:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    if-ne v2, v3, :cond_22

    .line 552
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 553
    const/4 v2, 0x1

    invoke-direct {p0, v0, v2}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displaySelectedAlbumImagesView(Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;Z)V

    .line 560
    .end local v0    # "selectedImageAlbum":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    :cond_21
    :goto_21
    return-void

    .line 554
    .restart local v0    # "selectedImageAlbum":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    :cond_22
    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getAlbumType()Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    move-result-object v2

    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CAMERA:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    if-ne v2, v3, :cond_2e

    .line 555
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->launchCameraToCapturePicture()V

    goto :goto_21

    .line 556
    :cond_2e
    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getAlbumType()Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    move-result-object v2

    sget-object v3, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CREATIVE_CLOUD:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    if-ne v2, v3, :cond_21

    .line 557
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->launchCreativeCloudAssetBrowser()V

    goto :goto_21
.end method

.method private onAlbumImageGridItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 13
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 362
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v4

    .line 363
    .local v4, "selectedItemObject":Ljava/lang/Object;
    instance-of v5, v4, Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v5, :cond_5e

    move-object v3, v4

    .line 364
    check-cast v3, Lcom/behance/sdk/project/modules/ImageModule;

    .line 365
    .local v3, "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-direct {p0, v3}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->imageMatchesRequirements(Lcom/behance/sdk/project/modules/ImageModule;)Z

    move-result v5

    if-eqz v5, :cond_5e

    .line 366
    invoke-virtual {v3}, Lcom/behance/sdk/project/modules/ImageModule;->getFile()Ljava/io/File;

    move-result-object v2

    .line 367
    .local v2, "imageFile":Ljava/io/File;
    if-eqz v2, :cond_5e

    .line 368
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5f

    .line 369
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 374
    :goto_24
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v0

    .line 375
    .local v0, "adapterObject":Landroid/widget/Adapter;
    instance-of v5, v0, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;

    if-eqz v5, :cond_37

    move-object v1, v0

    .line 376
    check-cast v1, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;

    .line 377
    .local v1, "albumImageAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v1, v5}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->setSelectedImageModulesList(Ljava/util/List;)V

    .line 378
    invoke-virtual {v1}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;->notifyDataSetChanged()V

    .line 381
    .end local v1    # "albumImageAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumImageGridArrayAdapter;
    :cond_37
    iget v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    sget v6, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    if-eq v5, v6, :cond_4f

    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    .line 382
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    iget v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    if-lt v5, v6, :cond_4f

    .line 383
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-direct {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnImageSelection(Ljava/util/List;)V

    .line 384
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    .line 387
    :cond_4f
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_65

    .line 388
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v6, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_multiple_photos_done_label:I

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    .line 395
    .end local v0    # "adapterObject":Landroid/widget/Adapter;
    .end local v2    # "imageFile":Ljava/io/File;
    .end local v3    # "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_5e
    :goto_5e
    return-void

    .line 371
    .restart local v2    # "imageFile":Ljava/io/File;
    .restart local v3    # "imageModule":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_5f
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_24

    .line 390
    .restart local v0    # "adapterObject":Landroid/widget/Adapter;
    :cond_65
    iget-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v6, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_multiple_photos_cancel_label:I

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    goto :goto_5e
.end method

.method private setAlbumsGridAdapter()V
    .registers 4

    .prologue
    .line 314
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    invoke-virtual {v2}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->getAlbumsList()Ljava/util/List;

    move-result-object v0

    .line 315
    .local v0, "albumsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;>;"
    if-eqz v0, :cond_16

    .line 316
    new-instance v1, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;

    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 317
    .local v1, "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;
    iget-object v2, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->albumsGridView:Landroid/widget/GridView;

    invoke-virtual {v2, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 319
    .end local v1    # "arrayAdapter":Lcom/behance/sdk/ui/adapters/BehanceSDKAlbumGridArrayAdapter;
    :cond_16
    return-void
.end method

.method private showProgressSpinner()V
    .registers 3

    .prologue
    .line 718
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->progressSpinner:Landroid/view/View;

    if-eqz v0, :cond_a

    .line 719
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->progressSpinner:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 721
    :cond_a
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 16
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v9, 0x1

    const/4 v11, 0x0

    const/4 v7, -0x1

    .line 656
    sparse-switch p1, :sswitch_data_98

    .line 694
    :cond_6
    :goto_6
    return-void

    .line 658
    :sswitch_7
    if-ne p2, v7, :cond_42

    .line 659
    sget-object v7, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v8, "Camera Activity returned with ok result. [Photo Uri - %s]"

    new-array v9, v9, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedCameraImageUri:Landroid/net/Uri;

    aput-object v10, v9, v11

    invoke-interface {v7, v8, v9}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 660
    iget-object v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedCameraImageUri:Landroid/net/Uri;

    if-eqz v7, :cond_6

    .line 661
    new-instance v1, Ljava/io/File;

    iget-object v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedCameraImageUri:Landroid/net/Uri;

    invoke-virtual {v7}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v1, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 662
    .local v1, "cameraImageFile":Ljava/io/File;
    new-instance v5, Lcom/behance/sdk/project/modules/ImageModule;

    invoke-direct {v5, v1}, Lcom/behance/sdk/project/modules/ImageModule;-><init>(Ljava/io/File;)V

    .line 663
    .local v5, "selectedCameraImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-direct {p0, v5}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnCameraImageCaptureSuccess(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 665
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v7

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/behance/sdk/util/BehanceSDKUtils;->addImageToGallery(Landroid/content/Context;Ljava/lang/String;)V

    .line 666
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->clearAlbumsCache()V

    .line 667
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->loadAlbums()V

    .line 668
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    goto :goto_6

    .line 671
    .end local v1    # "cameraImageFile":Ljava/io/File;
    .end local v5    # "selectedCameraImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_42
    sget-object v7, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v8, "Camera Activity returned with not ok result. [Result - %s]"

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-interface {v7, v8, v9}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_6

    .line 675
    :sswitch_52
    if-ne p2, v7, :cond_6

    .line 676
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 677
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v7, "ACTIVITY_CC_SUCCESSFULLY_DOWNLOADED_FILES"

    invoke-virtual {v0, v7}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 678
    .local v2, "downloadedFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    if-eqz v2, :cond_93

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_93

    .line 679
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 680
    .local v4, "modules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_75
    :goto_75
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_90

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    .line 681
    .local v3, "file":Ljava/io/File;
    new-instance v6, Lcom/behance/sdk/project/modules/CreativeCloudAssetModule;

    invoke-direct {v6, v3}, Lcom/behance/sdk/project/modules/CreativeCloudAssetModule;-><init>(Ljava/io/File;)V

    .line 682
    .local v6, "selectedImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-direct {p0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->imageMatchesRequirements(Lcom/behance/sdk/project/modules/ImageModule;)Z

    move-result v8

    if-eqz v8, :cond_75

    .line 683
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_75

    .line 685
    .end local v3    # "file":Ljava/io/File;
    .end local v6    # "selectedImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    :cond_90
    invoke-direct {p0, v4}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnImageSelection(Ljava/util/List;)V

    .line 687
    .end local v4    # "modules":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    :cond_93
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    goto/16 :goto_6

    .line 656
    :sswitch_data_98
    .sparse-switch
        0x1 -> :sswitch_7
        0x1a85 -> :sswitch_52
    .end sparse-switch
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 323
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewTitlebarActionBtnTxtView:I

    if-ne v0, v1, :cond_c

    .line 324
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->handleActionBtnClick()V

    .line 328
    :cond_b
    :goto_b
    return-void

    .line 325
    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewBackBtnImageView:I

    if-ne v0, v1, :cond_b

    .line 326
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->handleBackBtnClick()V

    goto :goto_b
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 167
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 168
    const/4 v0, 0x2

    sget v1, Lcom/behance/sdk/R$style;->BsdkImageSelectorViewTheme:I

    invoke-virtual {p0, v0, v1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setStyle(II)V

    .line 169
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 14
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 174
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/DialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    .line 175
    sget v6, Lcom/behance/sdk/R$layout;->bsdk_dialog_fragment_image_selector:I

    const/4 v7, 0x0

    invoke-virtual {p1, v6, p2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 177
    .local v4, "rootView":Landroid/view/View;
    const/4 v6, 0x0

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->lastDisplayedAlbumIndex:I

    .line 178
    const/4 v3, 0x0

    .line 179
    .local v3, "childIndexToDisplay":I
    if-eqz p3, :cond_38

    .line 180
    const-string v6, "BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX"

    const/4 v7, 0x0

    invoke-virtual {p3, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 181
    const-string v6, "BUNDLE_KEY_LAST_DISPLAYED_ALBUM_INDEX"

    const/4 v7, 0x0

    invoke-virtual {p3, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->lastDisplayedAlbumIndex:I

    .line 182
    const-string v6, "BUNDLE_KEY_SELECTED_IMAGE_MODULES_LIST"

    invoke-virtual {p3, v6}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v5

    .line 183
    .local v5, "serializedImageModulesList":Ljava/io/Serializable;
    instance-of v6, v5, Ljava/util/ArrayList;

    if-eqz v6, :cond_2e

    .line 184
    check-cast v5, Ljava/util/ArrayList;

    .end local v5    # "serializedImageModulesList":Ljava/io/Serializable;
    iput-object v5, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    .line 186
    :cond_2e
    const-string v6, "BUNDLE_KEY_CAMERA_IMAGE_URI"

    invoke-virtual {p3, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/net/Uri;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedCameraImageUri:Landroid/net/Uri;

    .line 189
    :cond_38
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    if-nez v6, :cond_43

    .line 190
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    .line 193
    :cond_43
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    .line 194
    .local v1, "arguments":Landroid/os/Bundle;
    sget v6, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    .line 195
    const/4 v6, -0x1

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageHeight:I

    .line 196
    const/4 v6, -0x1

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageWidth:I

    .line 197
    const/4 v6, -0x1

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageHeight:I

    .line 198
    const/4 v6, -0x1

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageWidth:I

    .line 199
    const-wide/16 v6, -0x1

    iput-wide v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageSizeBytes:J

    .line 200
    const-wide/16 v6, -0x1

    iput-wide v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageSizeBytes:J

    .line 201
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->imageValidatorType:Ljava/lang/String;

    .line 202
    if-eqz v1, :cond_c7

    .line 203
    const-string v6, "ARGS_MAX_NUMBER_OF_IMAGES"

    sget v7, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    .line 204
    const-string v6, "ARGS_MIN_IMAGE_WIDTH"

    const/4 v7, -0x1

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageWidth:I

    .line 205
    const-string v6, "ARGS_MIN_IMAGE_HEIGHT"

    const/4 v7, -0x1

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageHeight:I

    .line 206
    const-string v6, "ARGS_MAX_IMAGE_WIDTH"

    const/4 v7, -0x1

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageWidth:I

    .line 207
    const-string v6, "ARGS_MAX_IMAGE_HEIGHT"

    const/4 v7, -0x1

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageHeight:I

    .line 208
    const-string v6, "ARGS_ALBUMS_WITH_IMAGE_SELECTION_SOURCES"

    const/4 v7, 0x1

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    iput-boolean v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->showImageSelectionSources:Z

    .line 209
    const-string v6, "ARGS_MIN_IMAGE_SIZE_BYTES"

    const-wide/16 v8, -0x1

    invoke-virtual {v1, v6, v8, v9}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->minImageSizeBytes:J

    .line 210
    const-string v6, "ARGS_MAX_IMAGE_SIZE_BYTES"

    const-wide/16 v8, -0x1

    invoke-virtual {v1, v6, v8, v9}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxImageSizeBytes:J

    .line 211
    const-string v6, "ARGS_ALLOWED_FILE_EXTENSIONS_LIST"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->allowedFileExtensionsList:Ljava/util/ArrayList;

    .line 212
    const-string v6, "ARGS_PROHIBITED_FILE_EXTENSIONS_LIST"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->prohibitedFileExtensionsList:Ljava/util/ArrayList;

    .line 213
    const-string v6, "ARGS_IMAGE_VALITATOR_TYPE"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->imageValidatorType:Ljava/lang/String;

    .line 217
    :cond_c7
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    const-string v7, "IMAGE_SELECTOR_FRAGMENT_HEADLESS_FRAGMENT_TAG_SELECT_IMAGES"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    check-cast v6, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    .line 219
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    if-nez v6, :cond_fb

    .line 220
    new-instance v6, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    invoke-direct {v6}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;-><init>()V

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    .line 221
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v6

    iget-object v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    const-string v8, "IMAGE_SELECTOR_FRAGMENT_HEADLESS_FRAGMENT_TAG_SELECT_IMAGES"

    invoke-virtual {v6, v7, v8}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 223
    :cond_fb
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    invoke-virtual {v6, p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;)V

    .line 225
    sget v6, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewFlipper:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ViewFlipper;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    .line 226
    sget v6, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewProgressSpinner:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->progressSpinner:Landroid/view/View;

    .line 228
    sget v6, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewBackBtnImageView:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 229
    .local v2, "backBtn":Landroid/view/View;
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    sget v6, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewTitlebarActionBtnTxtView:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    .line 232
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    invoke-virtual {v6, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 234
    sget v6, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewTitlebarTitleTxtView:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarTitleTxtView:Landroid/widget/TextView;

    .line 236
    sget v6, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewAlbumsGridView:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/GridView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->albumsGridView:Landroid/widget/GridView;

    .line 237
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->albumsGridView:Landroid/widget/GridView;

    new-instance v7, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$1;

    invoke-direct {v7, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$1;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 245
    sget v6, Lcom/behance/sdk/R$id;->bsdkImageSelectorViewAlbumImagesGridView:I

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/GridView;

    iput-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->albumImagesGridView:Landroid/widget/GridView;

    .line 246
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->albumImagesGridView:Landroid/widget/GridView;

    new-instance v7, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$2;

    invoke-direct {v7, p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$2;-><init>(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 254
    iget v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->maxNumberOfImages:I

    sget v7, Lcom/behance/sdk/BehanceSDKImageSelectorOptions;->UNLIMITED_NUM_OF_IMAGES:I

    if-ne v6, v7, :cond_19b

    .line 255
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v7, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_multiple_photos_cancel_label:I

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    .line 260
    :goto_169
    iget v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->lastDisplayedAlbumIndex:I

    if-ltz v6, :cond_1aa

    const/4 v6, 0x1

    if-ne v3, v6, :cond_1aa

    .line 261
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v6

    iget v7, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->lastDisplayedAlbumIndex:I

    invoke-static {v6, v7}, Lcom/behance/sdk/files/LocalImageLoader;->getFromAlbumWithImageSelectionSources(Landroid/content/Context;I)Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;

    move-result-object v0

    .line 262
    .local v0, "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    if-eqz v0, :cond_1a3

    invoke-virtual {v0}, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->getAlbumType()Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    move-result-object v6

    sget-object v7, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->DEVICE_ALBUM:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    if-ne v6, v7, :cond_1a3

    .line 263
    const/4 v6, 0x0

    invoke-direct {p0, v0, v6}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->displaySelectedAlbumImagesView(Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;Z)V

    .line 271
    .end local v0    # "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    :goto_188
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    invoke-virtual {v6, p0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 273
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    invoke-virtual {v6}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->isAlbumsLoadingInProgress()Z

    move-result v6

    if-eqz v6, :cond_1b0

    .line 274
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->showProgressSpinner()V

    .line 278
    :goto_19a
    return-object v4

    .line 257
    :cond_19b
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->titleBarActionBtnTxtView:Landroid/widget/TextView;

    sget v7, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_titlebar_action_btn_cancel_label:I

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(I)V

    goto :goto_169

    .line 265
    .restart local v0    # "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    :cond_1a3
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    goto :goto_188

    .line 268
    .end local v0    # "albumDTO":Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
    :cond_1aa
    iget-object v6, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v6, v3}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    goto :goto_188

    .line 276
    :cond_1b0
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->loadAlbums()V

    goto :goto_19a
.end method

.method public onDetach()V
    .registers 3

    .prologue
    .line 297
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDetach()V

    .line 298
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    if-eqz v0, :cond_d

    .line 299
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->headlessFragment:Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment;->setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKImageSelectorHeadlessFragment$Callbacks;)V

    .line 301
    :cond_d
    return-void
.end method

.method public onGetAlbumsFailure(Ljava/lang/Exception;)V
    .registers 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 739
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_27

    .line 740
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->hideProgressSpinner()V

    .line 741
    sget-object v0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v1, "Problem loading albums"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, p1, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 742
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sget v1, Lcom/behance/sdk/R$string;->bsdk_image_selector_view_error_loading_albums_msg:I

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 743
    invoke-direct {p0, p1}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->notifyCallbacksOnError(Ljava/lang/Exception;)V

    .line 744
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->closeThisDialog()V

    .line 746
    :cond_27
    return-void
.end method

.method public onGetAlbumsSuccess()V
    .registers 2

    .prologue
    .line 731
    invoke-virtual {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 732
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->setAlbumsGridAdapter()V

    .line 733
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->hideProgressSpinner()V

    .line 735
    :cond_c
    return-void
.end method

.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 710
    const/4 v0, 0x4

    if-ne p2, v0, :cond_e

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_e

    .line 711
    invoke-direct {p0}, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->handleBackBtnClick()V

    .line 712
    const/4 v0, 0x1

    .line 714
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 305
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 306
    const-string v0, "BUNDLE_KEY_LAST_DISPLAYED_CHILD_INDEX"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->viewFlipper:Landroid/widget/ViewFlipper;

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 307
    const-string v0, "BUNDLE_KEY_LAST_DISPLAYED_ALBUM_INDEX"

    iget v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->lastDisplayedAlbumIndex:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 308
    const-string v0, "BUNDLE_KEY_SELECTED_IMAGE_MODULES_LIST"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedImageModulesList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 309
    iget-object v0, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedCameraImageUri:Landroid/net/Uri;

    if-eqz v0, :cond_27

    .line 310
    const-string v0, "BUNDLE_KEY_CAMERA_IMAGE_URI"

    iget-object v1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->selectedCameraImageUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 311
    :cond_27
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

    .prologue
    .line 701
    iput-object p1, p0, Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment;->callbacks:Lcom/behance/sdk/ui/fragments/BehanceSDKImageSelectorDialogFragment$Callbacks;

    .line 702
    return-void
.end method
