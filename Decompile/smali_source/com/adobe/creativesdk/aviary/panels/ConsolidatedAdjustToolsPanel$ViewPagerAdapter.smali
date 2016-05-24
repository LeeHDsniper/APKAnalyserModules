.class Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "ConsolidatedAdjustToolsPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewPagerAdapter"
.end annotation


# instance fields
.field accentColor:I

.field final inflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;Landroid/content/Context;)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 565
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    .line 566
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->inflater:Landroid/view/LayoutInflater;

    .line 567
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .registers 4
    .param p1, "collection"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "view"    # Ljava/lang/Object;

    .prologue
    .line 581
    check-cast p3, Landroid/view/View;

    .end local p3    # "view":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 582
    return-void
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 571
    const/4 v0, 0x4

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .registers 8
    .param p1, "collection"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    const/4 v4, 0x0

    .line 586
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->inflater:Landroid/view/LayoutInflater;

    sget v3, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_adjustement_slider_layout:I

    invoke-virtual {v2, v3, p1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 587
    .local v1, "view":Landroid/view/View;
    sget v2, Lcom/aviary/android/feather/sdk/R$id;->seekbar:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    .line 590
    .local v0, "seekBar":Landroid/widget/SeekBar;
    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->accentColor:I

    if-eqz v2, :cond_1a

    .line 591
    iget v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->accentColor:I

    invoke-static {v0, v2}, Lcom/adobe/android/ui/utils/UIUtils;->setSeekBarProgressTint(Landroid/widget/SeekBar;I)Z

    .line 594
    :cond_1a
    packed-switch p2, :pswitch_data_6e

    .line 615
    :cond_1d
    :goto_1d
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 616
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setTag(Ljava/lang/Object;)V

    .line 617
    invoke-virtual {p1, v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 618
    return-object v1

    .line 596
    :pswitch_2d
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 597
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-boolean v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mFirstLaunch:Z

    if-eqz v2, :cond_1d

    .line 598
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iput-object v0, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentSeekBar:Landroid/widget/SeekBar;

    .line 599
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iput-boolean v4, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mFirstLaunch:Z

    goto :goto_1d

    .line 603
    :pswitch_47
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_1d

    .line 606
    :pswitch_54
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_1d

    .line 609
    :pswitch_61
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->this$0:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_1d

    .line 594
    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_54
        :pswitch_47
        :pswitch_61
    .end packed-switch
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 576
    if-ne p1, p2, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method
