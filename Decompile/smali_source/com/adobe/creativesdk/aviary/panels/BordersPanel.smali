.class public Lcom/adobe/creativesdk/aviary/panels/BordersPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "BordersPanel.java"

# interfaces
.implements Landroid/support/v4/content/Loader$OnLoadCompleteListener;
.implements Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/BordersPanel$GenerateResultTask;,
        Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;",
        "Landroid/support/v4/content/Loader$OnLoadCompleteListener",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;",
        "Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;"
    }
.end annotation


# instance fields
.field protected loaderView:Landroid/view/View;

.field protected mAccentColor:I

.field protected mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

.field protected mCache:Lit/sephiroth/android/library/picasso/LruCache;

.field protected mCellWidth:I

.field protected mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

.field protected mContentObserver:Landroid/database/ContentObserver;

.field private mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

.field protected mCursorLoader:Landroid/support/v4/content/CursorLoader;

.field protected mDefaultPackTextBackgroundColor:I

.field protected mEnableFastPreview:Z

.field protected mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

.field protected mFirstTime:Z

.field protected final mInitialIntensityValue:F

.field private final mInstalledPacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field protected volatile mIsAnimating:Z

.field protected volatile mIsRendering:Ljava/lang/Boolean;

.field protected final mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field protected mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

.field protected mPreferences:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

.field protected mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

.field protected mSliderIntensityTooltip:I

.field protected mThumbWidth:I

.field protected mTooltipManager:Lit/sephiroth/android/library/tooltip/TooltipManager;

.field protected mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

.field protected recyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 4
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 246
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    .line 247
    return-void
.end method

.method protected constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V
    .registers 7
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .param p3, "type"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    const/16 v2, 0x50

    const/4 v1, 0x0

    .line 250
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 91
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsRendering:Ljava/lang/Boolean;

    .line 95
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFirstTime:Z

    .line 97
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mEnableFastPreview:Z

    .line 99
    const/high16 v0, 0x437f0000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mInitialIntensityValue:F

    .line 105
    iput v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCellWidth:I

    .line 107
    iput v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mThumbWidth:I

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mInstalledPacks:Ljava/util/List;

    .line 126
    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mSliderIntensityTooltip:I

    .line 251
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 252
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->createTutorialOverlayIfNecessaryDelayed()Z

    move-result v0

    return v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;)Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/BordersPanel;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    return-object p1
.end method

.method private createTutorialOverlayIfNecessary()V
    .registers 5

    .prologue
    .line 652
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "createTutorialOverlayIfNecessary"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 654
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->isActive()Z

    move-result v0

    if-nez v0, :cond_e

    .line 668
    :cond_d
    :goto_d
    return-void

    .line 657
    :cond_e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_d

    .line 661
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$2;-><init>(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_d
.end method

.method private createTutorialOverlayIfNecessaryDelayed()Z
    .registers 13

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 672
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v11, "createTutorialOverlayIfNecessaryDelayed"

    invoke-interface {v8, v11}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 674
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->isActive()Z

    move-result v8

    if-nez v8, :cond_11

    move v8, v9

    .line 723
    :goto_10
    return v8

    .line 678
    :cond_11
    const/4 v4, 0x1

    .line 680
    .local v4, "shouldProceed":Z
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v8}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    .line 681
    .local v0, "count":I
    const/4 v5, -0x1

    .line 682
    .local v5, "validIndex":I
    const/4 v6, 0x0

    .line 683
    .local v6, "validView":Landroid/view/View;
    const/4 v1, 0x0

    .line 685
    .local v1, "free":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1c
    if-ge v3, v0, :cond_37

    .line 686
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v8, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 687
    .local v7, "view":Landroid/view/View;
    if-eqz v7, :cond_5b

    .line 688
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v8, v7}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    .line 689
    .local v2, "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    if-eqz v2, :cond_5b

    .line 690
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemViewType()I

    move-result v8

    if-nez v8, :cond_46

    .line 691
    const/4 v4, 0x0

    .line 706
    .end local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v7    # "view":Landroid/view/View;
    :cond_37
    if-eqz v1, :cond_3e

    const/4 v8, -0x1

    if-le v5, v8, :cond_3e

    if-nez v6, :cond_3f

    .line 707
    :cond_3e
    const/4 v4, 0x0

    .line 710
    :cond_3f
    if-nez v4, :cond_60

    .line 711
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->hideOverlay()V

    move v8, v9

    .line 712
    goto :goto_10

    .line 695
    .restart local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .restart local v7    # "view":Landroid/view/View;
    :cond_46
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemViewType()I

    move-result v8

    if-ne v8, v10, :cond_5b

    move-object v8, v2

    .line 696
    check-cast v8, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    iget v8, v8, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->free:I

    if-ne v8, v10, :cond_5e

    move v1, v10

    .line 697
    :goto_54
    if-eqz v1, :cond_5b

    .line 698
    move v5, v3

    .line 699
    check-cast v2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    .end local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    iget-object v6, v2, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->itemView:Landroid/view/View;

    .line 685
    :cond_5b
    add-int/lit8 v3, v3, 0x1

    goto :goto_1c

    .restart local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    :cond_5e
    move v1, v9

    .line 696
    goto :goto_54

    .line 715
    .end local v2    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    .end local v7    # "view":Landroid/view/View;
    :cond_60
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    if-nez v8, :cond_83

    .line 716
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getTutorialOverlayId()I

    move-result v10

    invoke-static {v8, v10}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->shouldShow(Landroid/content/Context;I)Z

    move-result v8

    if-eqz v8, :cond_88

    .line 717
    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->createTutorialOverlay(Landroid/view/View;)Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    .line 718
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->show()Z

    move-result v8

    goto :goto_10

    .line 721
    :cond_83
    iget-object v8, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v8, v6}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->update(Landroid/view/View;)V

    :cond_88
    move v8, v9

    .line 723
    goto :goto_10
.end method

.method private displayIAPDialog(Landroid/os/Bundle;)V
    .registers 3
    .param p1, "data"    # Landroid/os/Bundle;

    .prologue
    .line 746
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->openOrUpdateStoreDialog(Landroid/os/Bundle;)V

    .line 747
    return-void
.end method

.method private getCacheSize()I
    .registers 9

    .prologue
    .line 342
    const/4 v4, 0x3

    new-array v1, v4, [D

    .line 343
    .local v1, "mem":[D
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;->getRuntimeMemory([D)V

    .line 345
    const/4 v4, 0x0

    aget-wide v4, v1, v4

    const-wide/high16 v6, 0x4000000000000000L

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->max(DD)D

    move-result-wide v2

    .line 346
    .local v2, "total":D
    const-wide/high16 v4, 0x4130000000000000L

    mul-double/2addr v4, v2

    double-to-int v0, v4

    .line 348
    .local v0, "maxSize":I
    const/high16 v4, 0x600000

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 349
    return v0
.end method

.method private onEffectListUpdated(IZZ)V
    .registers 10
    .param p1, "firstValidIndex"    # I
    .param p2, "forceSelection"    # Z
    .param p3, "smoothSelection"    # Z

    .prologue
    const/4 v3, 0x0

    .line 616
    if-lez p1, :cond_55

    move v2, p1

    .line 618
    .local v2, "mListFirstValidPosition":I
    :goto_4
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->loaderView:Landroid/view/View;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 619
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v3}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 621
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFirstTime:Z

    if-nez v4, :cond_15

    if-eqz p2, :cond_26

    .line 622
    :cond_15
    if-lez v2, :cond_26

    .line 623
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/LinearLayoutManager;

    .line 625
    .local v1, "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    if-eqz p3, :cond_57

    .line 626
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 633
    .end local v1    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    :cond_26
    :goto_26
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFirstTime:Z

    if-eqz v4, :cond_52

    .line 634
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v4, 0x0

    const/high16 v5, 0x3f800000

    invoke-direct {v0, v4, v5}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 635
    .local v0, "animation":Landroid/view/animation/Animation;
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 636
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x10e0001

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v0, v4, v5}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 637
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v0}, Landroid/support/v7/widget/RecyclerView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 640
    .end local v0    # "animation":Landroid/view/animation/Animation;
    :cond_52
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFirstTime:Z

    .line 641
    return-void

    .end local v2    # "mListFirstValidPosition":I
    :cond_55
    move v2, v3

    .line 616
    goto :goto_4

    .line 628
    .restart local v1    # "layoutManager":Landroid/support/v7/widget/LinearLayoutManager;
    .restart local v2    # "mListFirstValidPosition":I
    :cond_57
    add-int/lit8 v4, v2, -0x1

    iget v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCellWidth:I

    div-int/lit8 v5, v5, 0x2

    invoke-virtual {v1, v4, v5}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_26
.end method

.method private openStorePanelIfRequired(J)Z
    .registers 16
    .param p1, "id"    # J

    .prologue
    const-wide/16 v10, -0x1

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 255
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "openStorePanelIfRequired: %d"

    new-array v8, v5, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v4

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 257
    const-wide/16 v2, -0x1

    .line 258
    .local v2, "iapPackageId":J
    const-string v6, "quick-packId"

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->hasOption(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_21

    cmp-long v6, p1, v10

    if-lez v6, :cond_6c

    .line 259
    :cond_21
    cmp-long v6, p1, v10

    if-lez v6, :cond_6d

    .line 260
    move-wide v2, p1

    .line 267
    :cond_26
    :goto_26
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "iapPackageId: %d"

    new-array v8, v5, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v4

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 270
    cmp-long v6, v2, v10

    if-lez v6, :cond_6c

    .line 271
    new-instance v4, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    invoke-direct {v4}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;-><init>()V

    invoke-virtual {v4, v2, v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    .line 272
    invoke-virtual {v4, v2, v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setFeaturedPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    const-string v6, "shop_details: opened"

    .line 273
    invoke-virtual {v4, v6}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setEvent(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 274
    invoke-virtual {v4, v6}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    const-string v6, "pack"

    .line 275
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    const-string v6, "from"

    const-string v7, "message"

    .line 276
    invoke-virtual {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v4

    .line 277
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->build()Landroid/os/Bundle;

    move-result-object v0

    .line 279
    .local v0, "iapData":Landroid/os/Bundle;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->displayIAPDialog(Landroid/os/Bundle;)V

    move v4, v5

    .line 283
    .end local v0    # "iapData":Landroid/os/Bundle;
    :cond_6c
    return v4

    .line 261
    :cond_6d
    const-string v6, "quick-packId"

    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->hasOption(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_26

    .line 262
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getOptions()Landroid/os/Bundle;

    move-result-object v1

    .line 263
    .local v1, "options":Landroid/os/Bundle;
    const-string v6, "quick-packId"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 264
    const-string v6, "quick-packId"

    invoke-virtual {v1, v6}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_26
.end method

.method private removeIapDialog()Z
    .registers 2

    .prologue
    .line 750
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->closeStoreDialog()Z

    move-result v0

    return v0
.end method


# virtual methods
.method backHandled()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 831
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsAnimating:Z

    if-eqz v1, :cond_6

    .line 842
    :cond_5
    :goto_5
    return v0

    .line 835
    :cond_6
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    if-eqz v1, :cond_12

    .line 836
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->onBackPressed()Z

    move-result v1

    if-nez v1, :cond_5

    .line 841
    :cond_12
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->killCurrentTask()Z

    .line 842
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected createListAdapter(Landroid/content/Context;Landroid/database/Cursor;I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "accentColor"    # I

    .prologue
    .line 602
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    invoke-direct {v0, p1, p0, p2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$OnItemClickListener;Landroid/database/Cursor;)V

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCellWidth:I

    .line 603
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setCellWidth(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_content_item:I

    .line 604
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setContentResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_supplies:I

    .line 605
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setSupplyResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_external_pack:I

    .line 606
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setExternalResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_content_frames_item_header_pack:I

    .line 607
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setDividerResId(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mDefaultPackTextBackgroundColor:I

    .line 608
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setDefaultPackTextBackgroundColor(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 609
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCache:Lit/sephiroth/android/library/picasso/LruCache;

    .line 610
    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setPicasso(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Cache;)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    .line 611
    invoke-virtual {v0, p3}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->setTintColor(I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;

    move-result-object v0

    .line 612
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$Builder;->build()Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    move-result-object v0

    return-object v0
.end method

.method protected createRenderTask(IF)Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;
    .registers 4
    .param p1, "position"    # I
    .param p2, "intensity"    # F

    .prologue
    .line 783
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;IF)V

    return-object v0
.end method

.method protected createTutorialOverlay(Landroid/view/View;)Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;
    .registers 8
    .param p1, "validView"    # Landroid/view/View;

    .prologue
    .line 731
    new-instance v0, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    .line 732
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v1

    sget v2, Lcom/aviary/android/feather/sdk/R$attr;->com_adobe_image_editor_frames_overlay_style:I

    .line 735
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v4

    .line 736
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getTutorialOverlayId()I

    move-result v5

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;-><init>(Landroid/content/Context;ILandroid/view/View;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;I)V

    .line 737
    .local v0, "result":Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->getToolDisplayName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->setTitle(I)V

    .line 738
    return-object v0
.end method

.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 548
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_frames:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 542
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_content_frames:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method protected getIntensityIsManaged()Z
    .registers 2

    .prologue
    .line 143
    const/4 v0, 0x1

    return v0
.end method

.method protected getIntensitySliderEnabled()Z
    .registers 2

    .prologue
    .line 135
    const/4 v0, 0x0

    return v0
.end method

.method public getIsChanged()Z
    .registers 2

    .prologue
    .line 537
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->getIsChanged()Z

    move-result v0

    if-nez v0, :cond_e

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsRendering:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method protected getTutorialOverlayId()I
    .registers 2

    .prologue
    .line 727
    const/4 v0, 0x3

    return v0
.end method

.method protected hideOverlay()V
    .registers 2

    .prologue
    .line 754
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    if-eqz v0, :cond_9

    .line 755
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->hide()V

    .line 757
    :cond_9
    return-void
.end method

.method protected isContentTutorialNeeded()Z
    .registers 2

    .prologue
    .line 648
    const/4 v0, 0x1

    return v0
.end method

.method killCurrentTask()Z
    .registers 3

    .prologue
    .line 787
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    if-eqz v0, :cond_15

    .line 788
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-eq v0, v1, :cond_d

    .line 789
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onProgressEnd()V

    .line 791
    :cond_d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->cancel(Z)Z

    move-result v0

    .line 793
    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method protected loadNativeFilter(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IZF)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
    .registers 17
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    .param p2, "position"    # I
    .param p3, "hires"    # Z
    .param p4, "intensity"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 799
    if-eqz p1, :cond_8d

    const/4 v0, -0x1

    if-le p2, v0, :cond_8d

    .line 800
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FRAMES:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;

    .line 801
    .local v7, "filter":Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 802
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 805
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pack/content/item/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 806
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getId()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 804
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 803
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 807
    .local v6, "cursor":Landroid/database/Cursor;
    const-wide/16 v8, 0x0

    .line 809
    .local v8, "frameWidth":D
    if-eqz v6, :cond_68

    .line 810
    :try_start_48
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_68

    .line 811
    const-string v0, "item_options"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v11

    .line 812
    .local v11, "options":[B
    new-instance v10, Lorg/json/JSONObject;

    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v11}, Ljava/lang/String;-><init>([B)V

    invoke-direct {v10, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 813
    .local v10, "object":Lorg/json/JSONObject;
    const-string v0, "width"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D
    :try_end_67
    .catchall {:try_start_48 .. :try_end_67} :catchall_88

    move-result-wide v8

    .line 817
    .end local v10    # "object":Lorg/json/JSONObject;
    .end local v11    # "options":[B
    :cond_68
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 820
    invoke-virtual {v7, p3}, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->setHiRes(Z)V

    .line 821
    invoke-virtual {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->setSize(D)V

    .line 822
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->setIdentifier(Ljava/lang/CharSequence;)V

    .line 823
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->setSourceDir(Ljava/lang/CharSequence;)V

    .line 824
    const/high16 v0, 0x437f0000

    div-float v0, p4, v0

    float-to-double v0, v0

    invoke-virtual {v7, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->setIntensity(D)V

    .line 827
    .end local v6    # "cursor":Landroid/database/Cursor;
    .end local v7    # "filter":Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;
    .end local v8    # "frameWidth":D
    :goto_87
    return-object v7

    .line 817
    .restart local v6    # "cursor":Landroid/database/Cursor;
    .restart local v7    # "filter":Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;
    .restart local v8    # "frameWidth":D
    :catchall_88
    move-exception v0

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    throw v0

    .line 827
    .end local v6    # "cursor":Landroid/database/Cursor;
    .end local v7    # "filter":Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;
    .end local v8    # "frameWidth":D
    :cond_8d
    const/4 v7, 0x0

    goto :goto_87
.end method

.method public onActivate()V
    .registers 1

    .prologue
    .line 354
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 355
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onSetupImageView()V

    .line 356
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onAddCustomRequestHandlers()V

    .line 357
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onPostActivate()V

    .line 358
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->contentReady()V

    .line 359
    return-void
.end method

.method protected onAddCustomRequestHandlers()V
    .registers 1

    .prologue
    .line 362
    return-void
.end method

.method public onBackPressed()Z
    .registers 2

    .prologue
    .line 525
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->backHandled()Z

    move-result v0

    if-nez v0, :cond_c

    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public onCancelled()V
    .registers 2

    .prologue
    .line 530
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->killCurrentTask()Z

    .line 531
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsRendering:Ljava/lang/Boolean;

    .line 532
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCancelled()V

    .line 533
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V
    .registers 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;
    .param p2, "oldConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 465
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 466
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->finishIntensityChanging()V

    .line 469
    :cond_d
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onConfigurationChanged(Landroid/content/res/Configuration;Landroid/content/res/Configuration;)V

    .line 470
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 10
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 289
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 291
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lit/sephiroth/android/library/picasso/Picasso;->with(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPicasso:Lit/sephiroth/android/library/picasso/Picasso;

    .line 292
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mInstalledPacks:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 294
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getCacheSize()I

    move-result v1

    .line 295
    .local v1, "maxSize":I
    new-instance v2, Lit/sephiroth/android/library/picasso/LruCache;

    invoke-direct {v2, v1}, Lit/sephiroth/android/library/picasso/LruCache;-><init>(I)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCache:Lit/sephiroth/android/library/picasso/LruCache;

    .line 298
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 299
    .local v0, "mThumbnailOptions":Landroid/graphics/BitmapFactory$Options;
    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v2, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 301
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    const-class v3, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 302
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreferences:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    .line 303
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v2

    invoke-static {v2}, Lit/sephiroth/android/library/tooltip/TooltipManager;->getInstance(Landroid/app/Activity;)Lit/sephiroth/android/library/tooltip/TooltipManager;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTooltipManager:Lit/sephiroth/android/library/tooltip/TooltipManager;

    .line 305
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->fastPreviewEnabled()Z

    move-result v2

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mEnableFastPreview:Z

    .line 306
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$id;->recyclerView:I

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 307
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v3, Landroid/support/v7/widget/LinearLayoutManager;

    .line 308
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, v5, v5}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 307
    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 309
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v6}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 311
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$id;->loader:I

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->loaderView:Landroid/view/View;

    .line 313
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v3, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_editor_content_item_width:I

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCellWidth:I

    .line 314
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v3, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_editor_content_item_image_width:I

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getDimensionPixelSize(I)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mThumbWidth:I

    .line 315
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$attr;->colorPrimaryDark:I

    invoke-static {v2, v3}, Lcom/adobe/android/ui/utils/UIUtils;->getThemeColor(Landroid/content/Context;I)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mDefaultPackTextBackgroundColor:I

    .line 317
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 319
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContentView()Landroid/view/View;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 320
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v3, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v2, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 321
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v2

    if-eqz v2, :cond_e4

    .line 322
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setVaryTipStroke(Z)V

    .line 323
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v2, v6}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setVaryTipHue(Z)V

    .line 326
    :cond_e4
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreferences:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 327
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "intensity.slider.tooltip"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 326
    invoke-virtual {v2, v3, v5}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->containsSingleTimeKey(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_125

    .line 328
    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mSliderIntensityTooltip:I

    .line 333
    :goto_10b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->hasAccentColor()Z

    move-result v2

    if-eqz v2, :cond_128

    .line 334
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getAccentColor(I)I

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAccentColor:I

    .line 335
    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAccentColor:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onSetupUiTint(I)V

    .line 339
    :goto_124
    return-void

    .line 330
    :cond_125
    iput v6, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mSliderIntensityTooltip:I

    goto :goto_10b

    .line 337
    :cond_128
    iput v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAccentColor:I

    goto :goto_124
.end method

.method public onDeactivate()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 432
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-eq v1, v2, :cond_a

    .line 433
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onProgressEnd()V

    .line 435
    :cond_a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/RecyclerView;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 437
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->removeIapDialog()Z

    .line 439
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    if-eqz v1, :cond_1d

    .line 440
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;->dismiss()V

    .line 441
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTutorialOverlay:Lcom/adobe/creativesdk/aviary/overlays/StickersOverlay;

    .line 444
    :cond_1d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v1

    if-eqz v1, :cond_2a

    .line 445
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setOnIntensityChangeListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;)V

    .line 448
    :cond_2a
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    .line 450
    .local v0, "context":Landroid/content/Context;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mContentObserver:Landroid/database/ContentObserver;

    if-eqz v1, :cond_3f

    .line 451
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 454
    :cond_3f
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    if-eqz v1, :cond_52

    .line 455
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v1, p0}, Landroid/support/v4/content/CursorLoader;->unregisterListener(Landroid/support/v4/content/Loader$OnLoadCompleteListener;)V

    .line 456
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v1}, Landroid/support/v4/content/CursorLoader;->stopLoading()V

    .line 457
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v1}, Landroid/support/v4/content/CursorLoader;->abandon()V

    .line 460
    :cond_52
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 461
    return-void
.end method

.method public onDestroy()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 405
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mConfigService:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 407
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 409
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    if-eqz v1, :cond_15

    .line 410
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    .line 411
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/database/Cursor;)V

    .line 414
    .end local v0    # "cursor":Landroid/database/Cursor;
    :cond_15
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .line 415
    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    .line 417
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 418
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    const/high16 v2, 0x437f0000

    invoke-virtual {v1, v3, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setPreviewBitmap(Landroid/graphics/Bitmap;F)V

    .line 422
    :cond_28
    :try_start_28
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCache:Lit/sephiroth/android/library/picasso/LruCache;

    invoke-virtual {v1}, Lit/sephiroth/android/library/picasso/LruCache;->clear()V
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_2d} :catch_31

    .line 427
    :goto_2d
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 428
    return-void

    .line 423
    :catch_31
    move-exception v1

    goto :goto_2d
.end method

.method protected onDispose()V
    .registers 3

    .prologue
    .line 474
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 475
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onRemoveCustomRequestHandlers()V

    .line 476
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDispose()V

    .line 477
    return-void
.end method

.method protected onGenerateFinalBitmap()V
    .registers 8

    .prologue
    const/high16 v6, 0x437f0000

    .line 491
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v2

    if-eqz v2, :cond_5d

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensityIsManaged()Z

    move-result v2

    if-nez v2, :cond_5d

    .line 493
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getIntensity()F

    move-result v0

    .line 495
    .local v0, "intensity":F
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    if-eqz v2, :cond_26

    .line 496
    cmpg-float v2, v0, v6

    if-gez v2, :cond_30

    .line 497
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    div-float v3, v0, v6

    float-to-double v4, v3

    invoke-virtual {v2, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;->setIntensity(D)V

    .line 505
    :cond_26
    :goto_26
    cmpl-float v2, v0, v6

    if-nez v2, :cond_38

    .line 506
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 517
    .local v1, "resultBitmap":Landroid/graphics/Bitmap;
    :goto_2c
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onComplete(Landroid/graphics/Bitmap;)V

    .line 521
    .end local v0    # "intensity":F
    .end local v1    # "resultBitmap":Landroid/graphics/Bitmap;
    :goto_2f
    return-void

    .line 499
    .restart local v0    # "intensity":F
    :cond_30
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    const-wide/high16 v4, 0x3ff0000000000000L

    invoke-virtual {v2, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;->setIntensity(D)V

    goto :goto_26

    .line 507
    :cond_38
    const/4 v2, 0x0

    cmpl-float v2, v0, v2

    if-nez v2, :cond_40

    .line 508
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mBitmap:Landroid/graphics/Bitmap;

    .restart local v1    # "resultBitmap":Landroid/graphics/Bitmap;
    goto :goto_2c

    .line 510
    .end local v1    # "resultBitmap":Landroid/graphics/Bitmap;
    :cond_40
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mBitmap:Landroid/graphics/Bitmap;

    .line 511
    .restart local v1    # "resultBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isMutable()Z

    move-result v2

    if-nez v2, :cond_55

    .line 512
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 514
    :cond_55
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v2, v1, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->generateBitmap(Landroid/graphics/Bitmap;F)V

    goto :goto_2c

    .line 519
    .end local v0    # "intensity":F
    .end local v1    # "resultBitmap":Landroid/graphics/Bitmap;
    :cond_5d
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onComplete(Landroid/graphics/Bitmap;)V

    goto :goto_2f
.end method

.method protected onGenerateResult()V
    .registers 5

    .prologue
    .line 481
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onGenerateResult. isRendering: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsRendering:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 482
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsRendering:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 483
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$GenerateResultTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;)V

    .line 484
    .local v0, "task":Lcom/adobe/creativesdk/aviary/panels/BordersPanel$GenerateResultTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 488
    .end local v0    # "task":Lcom/adobe/creativesdk/aviary/panels/BordersPanel$GenerateResultTask;
    :goto_2d
    return-void

    .line 486
    :cond_2e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onGenerateFinalBitmap()V

    goto :goto_2d
.end method

.method public onIntensityInit()V
    .registers 6

    .prologue
    .line 867
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    if-eqz v0, :cond_53

    .line 868
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 870
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": intensity_initiated"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "pack"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    .line 872
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPackageName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "item"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    .line 874
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 869
    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    .line 876
    :cond_53
    return-void
.end method

.method public onIntensitySwipeChanged(F)V
    .registers 2
    .param p1, "intensity"    # F

    .prologue
    .line 863
    return-void
.end method

.method public onIntensitySwipeChanging(F)V
    .registers 3
    .param p1, "intensity"    # F

    .prologue
    .line 855
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensityIsManaged()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 856
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onIntensitySwipeChanged(F)V

    .line 858
    :cond_9
    return-void
.end method

.method public onIntensitySwipeStarted(F)V
    .registers 2
    .param p1, "intensity"    # F

    .prologue
    .line 851
    return-void
.end method

.method public onItemClick(Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/view/View;)V
    .registers 16
    .param p1, "adapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    const/4 v11, 0x6

    const/4 v9, 0x1

    const/high16 v12, 0x437f0000

    .line 880
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v10, p2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;

    .line 881
    .local v3, "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemViewType()I

    move-result v8

    .line 882
    .local v8, "type":I
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getAdapterPosition()I

    move-result v6

    .line 884
    .local v6, "position":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->hideOverlay()V

    .line 886
    if-nez v8, :cond_37

    .line 887
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->removeIapDialog()Z

    .line 889
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItemCheckedPosition()I

    move-result v1

    .line 890
    .local v1, "checkedPosition":I
    if-ne v1, v6, :cond_31

    .line 891
    const/4 v10, 0x0

    const/4 v11, -0x1

    invoke-virtual {p0, v10, v11, v12}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->renderEffect(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IF)V

    .line 896
    :goto_29
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    if-eq v1, v6, :cond_35

    :goto_2d
    invoke-virtual {v10, v6, v9}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->setItemCheckedPosition(IZ)V

    .line 926
    .end local v1    # "checkedPosition":I
    .end local v3    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    :cond_30
    :goto_30
    return-void

    .line 893
    .restart local v1    # "checkedPosition":I
    .restart local v3    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    :cond_31
    invoke-virtual {p0, v6, v12}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->renderEffect(IF)V

    goto :goto_29

    .line 896
    :cond_35
    const/4 v9, 0x0

    goto :goto_2d

    .line 897
    .end local v1    # "checkedPosition":I
    :cond_37
    if-ne v8, v9, :cond_7e

    .line 899
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;->getItemId()J

    move-result-wide v4

    .line 901
    .local v4, "packId":J
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 902
    .local v2, "extras":Landroid/os/Bundle;
    const-string v9, "extra-click-from-position"

    invoke-virtual {v2, v9, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 904
    new-instance v9, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    invoke-direct {v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;-><init>()V

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 906
    invoke-virtual {v9, v10}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    .line 907
    invoke-virtual {v9, v4, v5}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    .line 908
    invoke-virtual {v9, v4, v5}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setFeaturedPackId(J)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    const-string v10, "shop_details: opened"

    .line 909
    invoke-virtual {v9, v10}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setEvent(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    const-string v10, "pack"

    check-cast v3, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;

    .end local v3    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    iget-object v11, v3, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$ExternalPackViewHolder;->identifier:Ljava/lang/String;

    .line 910
    invoke-virtual {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    const-string v10, "from"

    const-string v11, "featured"

    .line 911
    invoke-virtual {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    .line 912
    invoke-virtual {v9, v2}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setExtras(Landroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->build()Landroid/os/Bundle;

    move-result-object v0

    .line 914
    .local v0, "builder":Landroid/os/Bundle;
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->displayIAPDialog(Landroid/os/Bundle;)V

    goto :goto_30

    .line 916
    .end local v0    # "builder":Landroid/os/Bundle;
    .end local v2    # "extras":Landroid/os/Bundle;
    .end local v4    # "packId":J
    .restart local v3    # "holder":Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter$BaseViewHolder;
    :cond_7e
    const/4 v9, 0x5

    if-eq v8, v9, :cond_83

    if-ne v8, v11, :cond_30

    .line 918
    :cond_83
    if-ne v8, v11, :cond_bb

    const-string v7, "right"

    .line 919
    .local v7, "side":Ljava/lang/String;
    :goto_87
    new-instance v9, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    invoke-direct {v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;-><init>()V

    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 920
    invoke-virtual {v9, v10}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setPackType(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    const-string v10, "shop_list: opened"

    .line 921
    invoke-virtual {v9, v10}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->setEvent(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    const-string v10, "from"

    .line 922
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v11

    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v11

    sget-object v12, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v11, v12}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    const-string v10, "side"

    .line 923
    invoke-virtual {v9, v10, v7}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->addEventAttributes(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;

    move-result-object v9

    .line 924
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment$Builder;->build()Landroid/os/Bundle;

    move-result-object v9

    .line 919
    invoke-direct {p0, v9}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->displayIAPDialog(Landroid/os/Bundle;)V

    goto/16 :goto_30

    .line 918
    .end local v7    # "side":Ljava/lang/String;
    :cond_bb
    const-string v7, "left"

    goto :goto_87
.end method

.method public onLoadComplete(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .registers 31
    .param p2, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 149
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v23, v0

    const-string v24, "onLoadComplete"

    invoke-interface/range {v23 .. v24}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 151
    const-wide/16 v20, -0x1

    .line 152
    .local v20, "storeFeaturedPackId":J
    const/4 v12, -0x1

    .line 153
    .local v12, "lastInstalledPackIndex":I
    const/4 v5, -0x1

    .line 154
    .local v5, "firstValidIndex":I
    const-wide/16 v14, -0x1

    .line 156
    .local v14, "optionsPackId":J
    const/16 v18, 0x0

    .line 157
    .local v18, "smoothSelection":Z
    const/4 v8, 0x0

    .line 159
    .local v8, "forceUpdate":Z
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v23

    if-nez v23, :cond_1b

    .line 243
    :cond_1a
    :goto_1a
    return-void

    .line 163
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getStoreFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    move-result-object v9

    .line 164
    .local v9, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFirstTime:Z

    move/from16 v23, v0

    if-nez v23, :cond_1b4

    if-eqz v9, :cond_1b4

    const/4 v4, 0x1

    .line 166
    .local v4, "checkFromIap":Z
    :goto_2e
    if-eqz v4, :cond_5d

    .line 167
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v23

    if-eqz v23, :cond_5d

    .line 168
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v23

    const-string v24, "featured_pack_id"

    invoke-virtual/range {v23 .. v24}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 169
    .local v6, "featuredPackId":J
    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v23

    const-string v24, "extra-pack-id"

    invoke-virtual/range {v23 .. v24}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v16

    .line 171
    .local v16, "packId":J
    cmp-long v23, v6, v16

    if-nez v23, :cond_5d

    const-wide/16 v24, -0x1

    cmp-long v23, v6, v24

    if-lez v23, :cond_5d

    .line 172
    move-wide/from16 v20, v6

    .line 173
    const-wide/16 v24, -0x1

    cmp-long v23, v20, v24

    if-lez v23, :cond_1b7

    const/4 v4, 0x1

    .line 178
    .end local v6    # "featuredPackId":J
    .end local v16    # "packId":J
    :cond_5d
    :goto_5d
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->hasOptions()Z

    move-result v23

    if-eqz v23, :cond_8b

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFirstTime:Z

    move/from16 v23, v0

    if-eqz v23, :cond_8b

    if-nez v4, :cond_8b

    .line 179
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getOptions()Landroid/os/Bundle;

    move-result-object v13

    .line 180
    .local v13, "options":Landroid/os/Bundle;
    const-string v23, "quick-packId"

    const-wide/16 v24, -0x1

    move-object/from16 v0, v23

    move-wide/from16 v1, v24

    invoke-virtual {v13, v0, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    .line 181
    const-string v23, "quick-packId"

    move-object/from16 v0, v23

    invoke-virtual {v13, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 182
    const-string v23, "quick-contentId"

    move-object/from16 v0, v23

    invoke-virtual {v13, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 185
    .end local v13    # "options":Landroid/os/Bundle;
    :cond_8b
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 187
    .local v19, "tmpList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    if-eqz p2, :cond_14f

    .line 188
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getPosition()I

    move-result v11

    .line 189
    .local v11, "index":I
    :cond_96
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v23

    if-eqz v23, :cond_14a

    .line 190
    const/16 v23, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v22

    .line 192
    .local v22, "type":I
    if-nez v22, :cond_96

    .line 193
    const/16 v23, 0x9

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 194
    .restart local v16    # "packId":J
    const/16 v23, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 196
    .local v10, "identifier":Ljava/lang/String;
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 198
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFirstTime:Z

    move/from16 v23, v0

    if-nez v23, :cond_1ba

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mInstalledPacks:Ljava/util/List;

    move-object/from16 v23, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v24

    invoke-interface/range {v23 .. v24}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v23

    if-nez v23, :cond_96

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v23, v0

    const-string v24, "adding %d (%s) to new packs"

    const/16 v25, 0x2

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    aput-object v27, v25, v26

    const/16 v26, 0x1

    aput-object v10, v25, v26

    invoke-interface/range {v23 .. v25}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v23, v0

    const-string v24, "iapDialogFeaturedId: %d, pack_id: %d"

    const/16 v25, 0x2

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    aput-object v27, v25, v26

    const/16 v26, 0x1

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-interface/range {v23 .. v25}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 203
    if-eqz v4, :cond_96

    cmp-long v23, v20, v16

    if-nez v23, :cond_96

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v23, v0

    const-string v24, "setting new position based on featured: %d"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-interface/range {v23 .. v25}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 205
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getPosition()I

    move-result v23

    add-int/lit8 v12, v23, 0x1

    .line 206
    const/16 v18, 0x1

    .line 216
    .end local v10    # "identifier":Ljava/lang/String;
    .end local v16    # "packId":J
    .end local v22    # "type":I
    :cond_14a
    :goto_14a
    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 219
    .end local v11    # "index":I
    :cond_14f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mInstalledPacks:Ljava/util/List;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->clear()V

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mInstalledPacks:Ljava/util/List;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v23, v0

    const-string v24, "lastInstalledPackIndex: %d"

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    aput-object v27, v25, v26

    invoke-interface/range {v23 .. v25}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 227
    if-ltz v12, :cond_194

    .line 228
    const/4 v8, 0x1

    .line 229
    move v5, v12

    .line 230
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->removeIapDialog()Z

    .line 233
    :cond_194
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v5, v8, v1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onEffectListUpdated(IZZ)V

    .line 236
    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->openStorePanelIfRequired(J)Z

    move-result v23

    if-nez v23, :cond_1a

    .line 240
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->isContentTutorialNeeded()Z

    move-result v23

    if-eqz v23, :cond_1a

    const/16 v23, -0x1

    move/from16 v0, v23

    if-ne v5, v0, :cond_1a

    .line 241
    invoke-direct/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->createTutorialOverlayIfNecessary()V

    goto/16 :goto_1a

    .line 164
    .end local v4    # "checkFromIap":Z
    .end local v19    # "tmpList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    :cond_1b4
    const/4 v4, 0x0

    goto/16 :goto_2e

    .line 173
    .restart local v4    # "checkFromIap":Z
    .restart local v6    # "featuredPackId":J
    .restart local v16    # "packId":J
    :cond_1b7
    const/4 v4, 0x0

    goto/16 :goto_5d

    .line 211
    .end local v6    # "featuredPackId":J
    .restart local v10    # "identifier":Ljava/lang/String;
    .restart local v11    # "index":I
    .restart local v19    # "tmpList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Long;>;"
    .restart local v22    # "type":I
    :cond_1ba
    invoke-interface/range {p2 .. p2}, Landroid/database/Cursor;->getPosition()I

    move-result v5

    .line 212
    goto :goto_14a
.end method

.method public bridge synthetic onLoadComplete(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 76
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onLoadComplete(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method protected onPostActivate()V
    .registers 1

    .prologue
    .line 400
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->updateInstalledPacks()V

    .line 401
    return-void
.end method

.method protected onRemoveCustomRequestHandlers()V
    .registers 1

    .prologue
    .line 365
    return-void
.end method

.method protected onSetupImageView()V
    .registers 6

    .prologue
    const/high16 v4, 0x437f0000

    const/4 v3, 0x0

    const/high16 v2, 0x3f800000

    .line 374
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v0

    if-eqz v0, :cond_38

    .line 375
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setOnIntensityChangeListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$OnIntensityChange;)V

    .line 377
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensityIsManaged()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 378
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v3, v2, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 379
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setIntensity(F)V

    .line 388
    :goto_26
    return-void

    .line 381
    :cond_27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v3, v2, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 382
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setPreviewBitmap(Landroid/graphics/Bitmap;F)V

    goto :goto_26

    .line 385
    :cond_38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setSwipeGestureEnabled(Z)V

    .line 386
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v3, v2, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    goto :goto_26
.end method

.method protected onSetupUiTint(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 368
    if-eqz p1, :cond_f

    .line 369
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->loaderView:Landroid/view/View;

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->progress:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    invoke-static {v0, p1}, Lcom/adobe/android/ui/utils/UIUtils;->setIndeterminateProgressBarTint(Landroid/widget/ProgressBar;I)Z

    .line 371
    :cond_f
    return-void
.end method

.method protected renderEffect(IF)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "intensity"    # F

    .prologue
    .line 760
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    if-nez v2, :cond_5

    .line 774
    :cond_4
    :goto_4
    return-void

    .line 763
    :cond_5
    if-ltz p1, :cond_4

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItemCount()I

    move-result v2

    if-ge p1, v2, :cond_4

    .line 767
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v2, p1}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 768
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_4

    .line 769
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    move-result-object v1

    .line 770
    .local v1, "item":Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    if-eqz v1, :cond_4

    .line 771
    invoke-virtual {p0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->renderEffect(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IF)V

    goto :goto_4
.end method

.method protected renderEffect(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IF)V
    .registers 7
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    .param p2, "position"    # I
    .param p3, "intensity"    # F

    .prologue
    .line 777
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->killCurrentTask()Z

    .line 778
    invoke-virtual {p0, p2, p3}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->createRenderTask(IF)Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    .line 779
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 780
    return-void
.end method

.method protected updateInstalledPacks()V
    .registers 15

    .prologue
    const/4 v13, 0x4

    const/4 v12, 0x3

    const/4 v11, 0x1

    const/4 v3, 0x0

    const/4 v10, 0x0

    .line 556
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->loaderView:Landroid/view/View;

    invoke-virtual {v0, v10}, Landroid/view/View;->setVisibility(I)V

    .line 557
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v13}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    .line 559
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    iget v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAccentColor:I

    invoke-virtual {p0, v0, v3, v4}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->createListAdapter(Landroid/content/Context;Landroid/database/Cursor;I)Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    .line 560
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v0, v11}, Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;->setHasStableIds(Z)V

    .line 561
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 563
    new-instance v7, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/PacksListAdapter;

    invoke-direct {v7, v0}, Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;-><init>(Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersAdapter;)V

    .line 564
    .local v7, "headersDecor":Lcom/timehop/stickyheadersrecyclerview/StickyRecyclerHeadersDecoration;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v7}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 566
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    .line 568
    .local v1, "context":Landroid/content/Context;
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "packTray/%d/%d/%d/%d/%d/%s"

    const/4 v5, 0x6

    new-array v5, v5, [Ljava/lang/Object;

    .line 569
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v11

    const/4 v6, 0x2

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v12

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v13

    const/4 v6, 0x5

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v9}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v6

    .line 568
    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 570
    .local v8, "uri":Ljava/lang/String;
    invoke-static {v1, v8}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 572
    .local v2, "baseUri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    if-nez v0, :cond_c5

    .line 573
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    .line 574
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0, v11, p0}, Landroid/support/v4/content/CursorLoader;->registerListener(ILandroid/support/v4/content/Loader$OnLoadCompleteListener;)V

    .line 576
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mContentObserver:Landroid/database/ContentObserver;

    if-nez v0, :cond_bf

    .line 577
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;

    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v3}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mContentObserver:Landroid/database/ContentObserver;

    .line 588
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "packTray/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 590
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getCDSProviderContentUri(Landroid/content/Context;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mContentObserver:Landroid/database/ContentObserver;

    .line 589
    invoke-virtual {v0, v3, v10, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 594
    :cond_bf
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0}, Landroid/support/v4/content/CursorLoader;->startLoading()V

    .line 599
    :goto_c4
    return-void

    .line 596
    :cond_c5
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0, v2}, Landroid/support/v4/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    .line 597
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCursorLoader:Landroid/support/v4/content/CursorLoader;

    invoke-virtual {v0}, Landroid/support/v4/content/CursorLoader;->forceLoad()V

    goto :goto_c4
.end method
