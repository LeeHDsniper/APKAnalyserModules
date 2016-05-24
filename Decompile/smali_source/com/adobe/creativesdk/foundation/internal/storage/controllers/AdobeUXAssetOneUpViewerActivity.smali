.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;
.source "AdobeUXAssetOneUpViewerActivity.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$5;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerPageChangeListener;
    }
.end annotation


# instance fields
.field private _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field private _commentsCountView:Landroid/widget/TextView;

.field private _commentsMenuIcon:Landroid/widget/ImageView;

.field private _commentsMenuView:Landroid/view/View;

.field private _reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

.field private mCommentsItem:Landroid/view/MenuItem;

.field private mFileInfo:Landroid/view/MenuItem;

.field private mImageSelectbtn:Landroid/widget/ImageButton;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;-><init>()V

    .line 680
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->showMenuItems()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->hideMenuItems()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->updateSelectionBtn()V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->setShareIntent()V

    return-void
.end method

.method static synthetic access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .prologue
    .line 88
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->action_showCommentsScreen()V

    return-void
.end method

.method static synthetic access$500(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)Landroid/widget/ImageButton;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .prologue
    .line 88
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$700(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;
    .param p1, "x1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getUniqueNameForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private action_showCommentsScreen()V
    .registers 7

    .prologue
    .line 635
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;->getCurrentFragment()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    move-result-object v3

    if-eqz v3, :cond_40

    .line 636
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;->getCurrentFragment()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    move-result-object v3

    iget v2, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->mNum:I

    .line 637
    .local v2, "num":I
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->count()I

    move-result v3

    if-ge v2, v3, :cond_37

    .line 638
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 647
    .end local v2    # "num":I
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :goto_16
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsTargetAssetController;->setTargetAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 648
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 649
    .local v1, "intent":Landroid/content/Intent;
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 650
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->startActivity(Landroid/content/Intent;)V

    .line 651
    return-void

    .line 640
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "num":I
    :cond_37
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedIndex()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    goto :goto_16

    .line 644
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v2    # "num":I
    :cond_40
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedIndex()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    goto :goto_16
.end method

.method private action_showCommentsScreenWithReply()V
    .registers 7

    .prologue
    .line 655
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;->getCurrentFragment()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    move-result-object v3

    if-eqz v3, :cond_46

    .line 656
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;->getCurrentFragment()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    move-result-object v3

    iget v2, v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->mNum:I

    .line 657
    .local v2, "num":I
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->count()I

    move-result v3

    if-ge v2, v3, :cond_3d

    .line 658
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 667
    .end local v2    # "num":I
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :goto_16
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsTargetAssetController;->setTargetAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 668
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsActivity;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 669
    .local v1, "intent":Landroid/content/Intent;
    const-string v3, "OPEN_REPLY_WINDOW"

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 670
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 671
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->startActivity(Landroid/content/Intent;)V

    .line 672
    return-void

    .line 660
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "num":I
    :cond_3d
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedIndex()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    goto :goto_16

    .line 664
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .end local v2    # "num":I
    :cond_46
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedIndex()I

    move-result v3

    invoke-static {v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    goto :goto_16
.end method

.method private getAdobeString(Ljava/lang/String;)Landroid/text/SpannableString;
    .registers 10
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x21

    const/4 v6, 0x0

    .line 435
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 436
    .local v0, "adobeString":Landroid/text/SpannableString;
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypeFace;->getTypeface(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 437
    .local v1, "font":Landroid/graphics/Typeface;
    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v1}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;)V

    .line 438
    .local v2, "typefaceSpan":Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKTypefaceSpan;
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result v3

    invoke-virtual {v0, v2, v6, v3, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 440
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    sget v5, Lcom/adobe/creativesdk/foundation/assets/R$color;->asset_browser_dark_text:I

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    move-result v4

    invoke-virtual {v0, v3, v6, v4, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 442
    return-object v0
.end method

.method private getUniqueNameForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;
    .registers 7
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 473
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v0

    .line 475
    .local v0, "guid":Ljava/lang/String;
    if-eqz v0, :cond_c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_19

    .line 476
    :cond_c
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "."

    const-string v4, "_"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 483
    :goto_18
    return-object v2

    .line 479
    :cond_19
    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 480
    .local v1, "outGuid":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x1

    if-le v2, v3, :cond_29

    .line 481
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v1, v2

    goto :goto_18

    .line 483
    :cond_29
    const/4 v2, 0x0

    aget-object v2, v1, v2

    goto :goto_18
.end method

.method private hideMenuItems()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 152
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mFileInfo:Landroid/view/MenuItem;

    if-eqz v0, :cond_a

    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mFileInfo:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 154
    :cond_a
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->handleVisibilityOfCommentsMenu(Z)V

    .line 155
    return-void
.end method

.method private onViewFileDetailsPressed()V
    .registers 4

    .prologue
    .line 676
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;->newInstance(I)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetDetailsFragment;

    move-result-object v0

    .line 677
    .local v0, "newFragment":Landroid/support/v4/app/DialogFragment;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "dialog"

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 678
    return-void
.end method

.method private setShareIntent()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 495
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    .line 496
    .local v1, "assetIndex":I
    iget v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 497
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;

    invoke-direct {v3, p0, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;ILcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 595
    .local v3, "rendDelegate":Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;, "Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback<[BLcom/adobe/creativesdk/foundation/storage/AdobeAssetException;>;"
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getUniqueNameForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;

    move-result-object v2

    .line 596
    .local v2, "baseName":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".png"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 597
    .local v4, "renditionFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_45

    .line 599
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v5

    if-eqz v5, :cond_40

    .line 601
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getFileProvideAuthority()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5, v4}, Landroid/support/v4/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    .line 612
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :goto_3f
    return-void

    .line 603
    .restart local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :cond_40
    const/4 v5, 0x1

    invoke-virtual {p0, v1, v5}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->enableOrDisableOpenBtn(IZ)V

    goto :goto_3f

    .line 608
    :cond_45
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    sget-object v5, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    new-instance v6, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v6, v8, v8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    invoke-virtual {v0, v5, v6, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    goto :goto_3f
.end method

.method private showMenuItems()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 158
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mFileInfo:Landroid/view/MenuItem;

    if-eqz v0, :cond_a

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mFileInfo:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 160
    :cond_a
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->handleVisibilityOfCommentsMenu(Z)V

    .line 161
    return-void
.end method

.method private updateSelectionBtn()V
    .registers 4

    .prologue
    .line 386
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 387
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    if-eqz v1, :cond_18

    .line 388
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->containsAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 389
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setSelected(Z)V

    .line 394
    :cond_18
    :goto_18
    return-void

    .line 391
    :cond_19
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setSelected(Z)V

    goto :goto_18
.end method


# virtual methods
.method public enableOrDisableOpenBtn(IZ)V
    .registers 6
    .param p1, "assetIndex"    # I
    .param p2, "enable"    # Z

    .prologue
    .line 354
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtn:Landroid/view/View;

    if-eqz v1, :cond_36

    .line 355
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    if-ne p1, v1, :cond_36

    .line 356
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtn:Landroid/view/View;

    invoke-virtual {v1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 357
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    invoke-virtual {v1, p2}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 358
    if-nez p2, :cond_2d

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->isSelected()Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 359
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 360
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setSelected(Z)V

    .line 361
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->removeSelectedAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    .line 363
    :cond_2d
    if-eqz p2, :cond_37

    .line 364
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtn:Landroid/view/View;

    const/high16 v2, 0x3f800000

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 370
    :cond_36
    :goto_36
    return-void

    .line 366
    :cond_37
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtn:Landroid/view/View;

    const/high16 v2, 0x3f000000

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    goto :goto_36
.end method

.method public fetchCurrentPageIndex()I
    .registers 2

    .prologue
    .line 381
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    return v0
.end method

.method getItemPageChangeListener()Landroid/support/v4/view/ViewPager$SimpleOnPageChangeListener;
    .registers 3

    .prologue
    .line 317
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerPageChangeListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerPageChangeListener;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$1;)V

    return-object v0
.end method

.method public getReusableBitmapCacheWorker()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    return-object v0
.end method

.method getShareFile()Ljava/io/File;
    .registers 7

    .prologue
    .line 331
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 332
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getUniqueNameForAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Ljava/lang/String;

    move-result-object v1

    .line 333
    .local v1, "baseName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".png"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2
.end method

.method public handleAssetCollectionChanged()V
    .registers 2

    .prologue
    .line 350
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentStatePagerAdapter;->notifyDataSetChanged()V

    .line 351
    return-void
.end method

.method public handleAssetSelectionChanged()V
    .registers 6

    .prologue
    const/4 v3, 0x1

    .line 419
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedAssetCount()I

    move-result v0

    .line 422
    .local v0, "count":I
    if-ge v0, v3, :cond_13

    .line 423
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->storage_open_files:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    .line 431
    .local v1, "openFileString":Ljava/lang/String;
    :goto_d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenFileText:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 432
    return-void

    .line 424
    .end local v1    # "openFileString":Ljava/lang/String;
    :cond_13
    const/16 v2, 0x63

    if-le v0, v2, :cond_1e

    .line 425
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->storage_open_multiple_files_99:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "openFileString":Ljava/lang/String;
    goto :goto_d

    .line 428
    .end local v1    # "openFileString":Ljava/lang/String;
    :cond_1e
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->storage_open_multiple_files:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    .line 429
    .restart local v1    # "openFileString":Ljava/lang/String;
    new-array v2, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method public handleVisibilityOfCommentsMenu(Z)V
    .registers 4
    .param p1, "visibilityOfCommentsMenu"    # Z

    .prologue
    .line 374
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mCommentsItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_12

    .line 376
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mCommentsItem:Landroid/view/MenuItem;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->isNetworkAvailable()Z

    move-result v0

    if-eqz v0, :cond_13

    if-eqz p1, :cond_13

    const/4 v0, 0x1

    :goto_f
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 378
    :cond_12
    return-void

    .line 376
    :cond_13
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public hideOrShowActionsBar()V
    .registers 1

    .prologue
    .line 398
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->hideOrShowBaseActivityActionsBar()V

    .line 399
    return-void
.end method

.method public onBackPressed()V
    .registers 2

    .prologue
    .line 978
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;->getCurrentFragment()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;->getCurrentFragment()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter$AdobeUXAssetViewerAssetFragment;->handleBackPressed()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 983
    :goto_10
    return-void

    .line 981
    :cond_11
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onBackPressed()V

    goto :goto_10
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v11, 0x0

    const v8, 0x1020002

    const/16 v10, 0x8

    const/4 v7, -0x2

    const/4 v9, 0x0

    .line 163
    invoke-super {p0, v11}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onCreate(Landroid/os/Bundle;)V

    .line 165
    if-eqz p1, :cond_19

    .line 166
    const-string v6, "ASSET_ONE_UP_ACTIVITY"

    invoke-virtual {p1, v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 167
    .local v5, "value":I
    if-eq v5, v7, :cond_19

    .line 175
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->finish()V

    .line 293
    .end local v5    # "value":I
    :cond_18
    :goto_18
    return-void

    .line 180
    :cond_19
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;

    invoke-direct {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;-><init>()V

    .line 181
    .local v1, "cacheParams":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;
    const v6, 0x3dcccccd

    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;->setMemCacheSizePercent(F)V

    .line 183
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-direct {v6, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .line 184
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v7

    invoke-virtual {v6, v7, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->addImageCache(Landroid/support/v4/app/FragmentManager;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapCache$ImageCacheParams;)V

    .line 186
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->setApplicationContext(Landroid/content/Context;)V

    .line 188
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetMainBrowserConfiguration;->ADOBE_CLOUD_KEY:Ljava/lang/String;

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 191
    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$id;->actionbar_toolbar:I

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/Toolbar;

    .line 192
    .local v4, "toolbar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v6

    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$layout;->adobe_comment_icon_view:I

    invoke-virtual {v6, v7, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuView:Landroid/view/View;

    .line 193
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuView:Landroid/view/View;

    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$id;->comment_icon:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuIcon:Landroid/widget/ImageView;

    .line 194
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuView:Landroid/view/View;

    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_comment_count:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsCountView:Landroid/widget/TextView;

    .line 195
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuView:Landroid/view/View;

    if-eqz v6, :cond_9f

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isPrivateCloud()Z

    move-result v6

    if-eqz v6, :cond_9f

    .line 197
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuIcon:Landroid/widget/ImageView;

    sget v7, Lcom/adobe/creativesdk/foundation/assets/R$drawable;->ic_forum_black_24dp_disabled:I

    invoke-virtual {v6, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 198
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuView:Landroid/view/View;

    invoke-virtual {v6, v9}, Landroid/view/View;->setEnabled(Z)V

    .line 199
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsCountView:Landroid/widget/TextView;

    if-eqz v6, :cond_9f

    .line 200
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsCountView:Landroid/widget/TextView;

    const/4 v7, 0x4

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 203
    :cond_9f
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuView:Landroid/view/View;

    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$1;

    invoke-direct {v7, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const-string v7, "Yes"

    invoke-static {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    .line 212
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isDataSourceValidForAssetViewerLaunch()Z

    move-result v6

    if-nez v6, :cond_bd

    .line 214
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->finish()V

    goto/16 :goto_18

    .line 218
    :cond_bd
    invoke-static {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->setCurrentAssetViewerActivity(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAssetViewerActivity;)V

    .line 219
    new-instance v6, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$AdobeUXAssetViewerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    .line 221
    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_item_pager:I

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/support/v4/view/ViewPager;

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    .line 222
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mAdapter:Landroid/support/v4/app/FragmentStatePagerAdapter;

    invoke-virtual {v6, v7}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 224
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedIndex()I

    move-result v6

    iput v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    .line 225
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    iget v7, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-virtual {v6, v7, v9}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 226
    iget v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 227
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeCSDKActionBarController;->setTitle(Landroid/view/View;Ljava/lang/String;)V

    .line 228
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPager:Landroid/support/v4/view/ViewPager;

    const/4 v7, 0x1

    new-instance v8, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDepthPageTransformer;

    invoke-direct {v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDepthPageTransformer;-><init>()V

    invoke-virtual {v6, v7, v8}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 230
    new-instance v6, Ljava/io/File;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getFilesDir()Ljava/io/File;

    move-result-object v7

    const-string v8, "adobeassetviewerimages"

    invoke-direct {v6, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    .line 231
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_11f

    .line 233
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 236
    :cond_11f
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtn:Landroid/view/View;

    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$2;

    invoke-direct {v7, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$2;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 251
    sget v6, Lcom/adobe/creativesdk/foundation/assets/R$id;->library_items_image_selectbtn:I

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageButton;

    iput-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    .line 254
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPhotoNumber:Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget v8, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ASSET_VIEWER_OF:I

    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->count()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v6

    if-nez v6, :cond_1ae

    .line 257
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    invoke-virtual {v6, v9}, Landroid/view/View;->setVisibility(I)V

    .line 262
    :goto_172
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v6

    if-nez v6, :cond_1b4

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMultiSelectModeActive()Z

    move-result v6

    if-eqz v6, :cond_1b4

    .line 263
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    invoke-virtual {v6, v9}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 268
    :goto_183
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->updateSelectionBtn()V

    .line 270
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$3;

    invoke-direct {v7, p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$3;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V

    invoke-virtual {v6, v7}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->handleAssetSelectionChanged()V

    .line 287
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "START_WITH_COMMENT_WINDOW"

    invoke-virtual {v6, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    .line 288
    .local v3, "startWithCommentScreen":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getIntent()Landroid/content/Intent;

    move-result-object v6

    const-string v7, "START_WITH_COMMENT_REPLY_WINDOW"

    invoke-virtual {v6, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 289
    .local v2, "openReplyWithComment":Z
    if-eqz v3, :cond_1ba

    .line 290
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->action_showCommentsScreen()V

    goto/16 :goto_18

    .line 259
    .end local v2    # "openReplyWithComment":Z
    .end local v3    # "startWithCommentScreen":Z
    :cond_1ae
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    invoke-virtual {v6, v10}, Landroid/view/View;->setVisibility(I)V

    goto :goto_172

    .line 265
    :cond_1b4
    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    invoke-virtual {v6, v10}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_183

    .line 291
    .restart local v2    # "openReplyWithComment":Z
    .restart local v3    # "startWithCommentScreen":Z
    :cond_1ba
    if-eqz v2, :cond_18

    .line 292
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->action_showCommentsScreenWithReply()V

    goto/16 :goto_18
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 6
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 447
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isDataSourceValidForAssetViewerLaunch()Z

    move-result v1

    if-nez v1, :cond_b

    .line 449
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    .line 469
    :goto_a
    return v1

    .line 451
    :cond_b
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v1

    if-eqz v1, :cond_64

    .line 453
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 454
    .local v0, "inflater":Landroid/view/MenuInflater;
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$menu;->adobe_ccfiles_assetviewer_menu:I

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 456
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_asset_one_up_view_comments_menu:I

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mCommentsItem:Landroid/view/MenuItem;

    .line 458
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuView:Landroid/view/View;

    if-eqz v1, :cond_2d

    .line 460
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mCommentsItem:Landroid/view/MenuItem;

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsMenuView:Landroid/view/View;

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 463
    :cond_2d
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->action_view_file_details:I

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mFileInfo:Landroid/view/MenuItem;

    .line 464
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mFileInfo:Landroid/view/MenuItem;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ACTION_VIEW_FILE_DETAILS:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 465
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mFileInfo:Landroid/view/MenuItem;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/foundation/assets/R$string;->IDS_ACTION_VIEW_FILE_DETAILS:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getAdobeString(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 466
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mFileInfo:Landroid/view/MenuItem;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->isNetworkAvailable()Z

    move-result v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 467
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->handleVisibilityOfCommentsMenu(Z)V

    .line 469
    .end local v0    # "inflater":Landroid/view/MenuInflater;
    :cond_64
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    goto :goto_a
.end method

.method public onDestroy()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 128
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->destorySharedInstance()V

    .line 129
    sput-object v2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_network_reachbility_obj:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .line 132
    :try_start_6
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    if-eqz v1, :cond_f

    .line 133
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImagePath:Ljava/io/File;

    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_f} :catch_21

    .line 139
    :cond_f
    :goto_f
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onDestroy()V

    .line 140
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    if-eqz v1, :cond_1b

    .line 141
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;->clearCache()V

    .line 142
    :cond_1b
    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_reusableBitmapCacheWorker:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/common/ReusableImageBitmapWorker;

    .line 143
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->resetCurrentAdobeUXAssetViewerActivity()V

    .line 144
    return-void

    .line 135
    :catch_21
    move-exception v0

    .line 137
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_f
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 616
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 617
    .local v0, "id":I
    const v2, 0x102002c

    if-ne v0, v2, :cond_e

    .line 618
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->onBackPressed()V

    .line 627
    :goto_d
    return v1

    .line 621
    :cond_e
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$id;->action_view_file_details:I

    if-ne v0, v2, :cond_1b

    .line 622
    const-string v2, "Show File Info"

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSDKReporter;->trackAssetBrowserAction(Ljava/lang/String;)V

    .line 623
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->onViewFileDetailsPressed()V

    goto :goto_d

    .line 627
    :cond_1b
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_d
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 308
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->setSelectedIndex(I)V

    .line 309
    const-string v0, "ASSET_ONE_UP_ACTIVITY"

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 312
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 313
    return-void
.end method

.method protected onStart()V
    .registers 4

    .prologue
    .line 297
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareBaseOneUpActivity;->onStart()V

    .line 298
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getSelectedIndex()I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    .line 299
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1b

    .line 300
    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mPos:I

    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->getAssetAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-result-object v0

    .line 301
    .local v0, "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getGUID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->setCommentCount(Ljava/lang/String;)V

    .line 303
    .end local v0    # "asset":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    :cond_1b
    return-void
.end method

.method public setCommentCount(Ljava/lang/String;)V
    .registers 6
    .param p1, "guid"    # Ljava/lang/String;

    .prologue
    .line 961
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/controller/AdobeNotificationManager;->getAssetCommentCount(Ljava/lang/String;)I

    move-result v0

    .line 962
    .local v0, "count":I
    if-lez v0, :cond_29

    .line 963
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsCountView:Landroid/widget/TextView;

    if-eqz v1, :cond_28

    .line 964
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsCountView:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 965
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsCountView:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 973
    :cond_28
    :goto_28
    return-void

    .line 970
    :cond_29
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsCountView:Landroid/widget/TextView;

    if-eqz v1, :cond_28

    .line 971
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->_commentsCountView:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_28
.end method

.method public showActionsBar()V
    .registers 3

    .prologue
    .line 411
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 412
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 415
    :goto_a
    return-void

    .line 414
    :cond_b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->hideOrShowBaseActivityActionsBar()V

    goto :goto_a
.end method

.method updateOpenBtnContainerVisibility()V
    .registers 3

    .prologue
    .line 322
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v0

    if-nez v0, :cond_d

    .line 323
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 327
    :goto_c
    return-void

    .line 325
    :cond_d
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mOpenBtnContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_c
.end method

.method updateSelectionBtnVisibility(Z)V
    .registers 4
    .param p1, "bVisible"    # Z

    .prologue
    .line 338
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMenuEnabled()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetViewerController;->isMultiSelectModeActive()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 340
    if-eqz p1, :cond_15

    .line 341
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 345
    :cond_14
    :goto_14
    return-void

    .line 343
    :cond_15
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->mImageSelectbtn:Landroid/widget/ImageButton;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_14
.end method
