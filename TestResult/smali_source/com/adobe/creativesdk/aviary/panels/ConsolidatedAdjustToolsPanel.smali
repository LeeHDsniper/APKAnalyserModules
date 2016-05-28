.class public Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;
.source "ConsolidatedAdjustToolsPanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;,
        Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;,
        Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;
    }
.end annotation


# instance fields
.field mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

.field mAdapter:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;

.field mAdjustToolValues:Landroid/util/SparseIntArray;

.field mCurrentSeekBar:Landroid/widget/SeekBar;

.field mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;

.field private mCurrentToolId:I

.field mFirstLaunch:Z

.field volatile mIsRendering:Z

.field final mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field mViewPager:Landroid/support/v4/view/ViewPager;

.field tool1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

.field tool2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

.field tool3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

.field tool4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 44
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mFirstLaunch:Z

    .line 57
    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentToolId:I

    .line 59
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    .line 65
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .line 66
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;I)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;
    .param p1, "x1"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->changeSeekBarToCurrent(I)V

    return-void
.end method

.method private changeSeekBarToCurrent(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentSeekBar:Landroid/widget/SeekBar;

    if-nez v0, :cond_5

    .line 207
    :goto_4
    return-void

    .line 190
    :cond_5
    packed-switch p1, :pswitch_data_3e

    goto :goto_4

    .line 192
    :pswitch_9
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentSeekBar:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_4

    .line 195
    :pswitch_16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentSeekBar:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_4

    .line 198
    :pswitch_23
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentSeekBar:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_4

    .line 201
    :pswitch_30
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentSeekBar:Landroid/widget/SeekBar;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_4

    .line 190
    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_9
        :pswitch_23
        :pswitch_16
        :pswitch_30
    .end packed-switch
.end method

.method private getToolName(I)Ljava/lang/String;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 624
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    if-ne v0, v1, :cond_d

    .line 625
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustExposureFilter;->getToolName(I)Ljava/lang/String;

    move-result-object v0

    .line 632
    :goto_c
    return-object v0

    .line 628
    :cond_d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->COLOR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    if-ne v0, v1, :cond_1a

    .line 629
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustColorFilter;->getToolName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_c

    .line 632
    :cond_1a
    const-string v0, "invalid"

    goto :goto_c
.end method

.method private initializeAdapterTint(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;)V
    .registers 4
    .param p1, "mAdapter"    # Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;

    .prologue
    .line 158
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->hasAccentColor()Z

    move-result v0

    if-nez v0, :cond_b

    .line 162
    :goto_a
    return-void

    .line 161
    :cond_b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getAccentColor(I)I

    move-result v0

    iput v0, p1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;->accentColor:I

    goto :goto_a
.end method

.method private setToolSelected(I)V
    .registers 5
    .param p1, "toolId"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 75
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 77
    packed-switch p1, :pswitch_data_46

    .line 94
    :goto_a
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentToolId:I

    if-eq p1, v0, :cond_13

    .line 95
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentToolId:I

    packed-switch v0, :pswitch_data_52

    .line 113
    :cond_13
    :goto_13
    iput p1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentToolId:I

    .line 115
    return-void

    .line 79
    :pswitch_16
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setChecked(Z)V

    goto :goto_a

    .line 82
    :pswitch_1c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setChecked(Z)V

    goto :goto_a

    .line 85
    :pswitch_22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setChecked(Z)V

    goto :goto_a

    .line 88
    :pswitch_28
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setChecked(Z)V

    goto :goto_a

    .line 97
    :pswitch_2e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setChecked(Z)V

    goto :goto_13

    .line 100
    :pswitch_34
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setChecked(Z)V

    goto :goto_13

    .line 103
    :pswitch_3a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setChecked(Z)V

    goto :goto_13

    .line 106
    :pswitch_40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setChecked(Z)V

    goto :goto_13

    .line 77
    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_16
        :pswitch_1c
        :pswitch_22
        :pswitch_28
    .end packed-switch

    .line 95
    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_34
        :pswitch_3a
        :pswitch_40
    .end packed-switch
.end method

.method private updateToolLabels()V
    .registers 3

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    if-ne v0, v1, :cond_24

    .line 166
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_brightness:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setText(I)V

    .line 167
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_contrast:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setText(I)V

    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_highlight:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setText(I)V

    .line 169
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_shadow:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setText(I)V

    .line 172
    :cond_24
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->COLOR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    if-ne v0, v1, :cond_48

    .line 173
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_saturation:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setText(I)V

    .line 174
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_temperature:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setText(I)V

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_tint:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setText(I)V

    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_fade:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setText(I)V

    .line 178
    :cond_48
    return-void
.end method

.method private updatedToolValue(II)V
    .registers 4
    .param p1, "toolID"    # I
    .param p2, "value"    # I

    .prologue
    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseIntArray;->put(II)V

    .line 182
    return-void
.end method


# virtual methods
.method protected applyFilter(ZZ)V
    .registers 8
    .param p1, "showProgress"    # Z
    .param p2, "isPreview"    # Z

    .prologue
    const/4 v4, 0x1

    .line 359
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    .line 360
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;

    invoke-direct {v0, p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;ZZ)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;

    .line 361
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;

    new-array v1, v4, [Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 362
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setIsChanged(Z)V

    .line 363
    return-void
.end method

.method convertValue(F)D
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 366
    const/high16 v0, 0x42480000

    sub-float v0, p1, v0

    const/high16 v1, 0x40000000

    mul-float/2addr v0, v1

    float-to-double v0, v0

    return-wide v0
.end method

.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 215
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_adjustements:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method killCurrentTask(Z)Z
    .registers 5
    .param p1, "endProgress"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 343
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;

    if-eqz v2, :cond_16

    .line 344
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;->cancel(Z)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 345
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    .line 346
    if-eqz p1, :cond_15

    .line 347
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onProgressEnd()V

    .line 352
    :cond_15
    :goto_15
    return v0

    :cond_16
    move v0, v1

    goto :goto_15
.end method

.method public onActivate()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 230
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onActivate()V

    .line 232
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 233
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setIsChanged(Z)V

    .line 235
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->hasOptions()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 236
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getOptions()Landroid/os/Bundle;

    move-result-object v0

    .line 237
    .local v0, "options":Landroid/os/Bundle;
    const-string v2, "quick-numericValue"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 238
    const-string v2, "quick-numericValue"

    invoke-virtual {v0, v2, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 239
    .local v1, "value":I
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setValue(I)V

    .line 242
    .end local v0    # "options":Landroid/os/Bundle;
    .end local v1    # "value":I
    :cond_2c
    return-void
.end method

.method public onBackPressed()Z
    .registers 2

    .prologue
    .line 331
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->killCurrentTask(Z)Z

    .line 332
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onCancelled()V
    .registers 2

    .prologue
    .line 337
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->killCurrentTask(Z)Z

    .line 338
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    .line 339
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onCancelled()V

    .line 340
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 11
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 533
    if-nez p1, :cond_7

    .line 559
    :cond_6
    :goto_6
    return-void

    .line 537
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 539
    .local v0, "id":I
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->tool1:I

    if-ne v0, v1, :cond_4b

    .line 540
    invoke-direct {p0, v5}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setToolSelected(I)V

    .line 541
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 542
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": option_selected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "name"

    aput-object v4, v3, v5

    invoke-direct {p0, v5}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getToolName(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_6

    .line 543
    :cond_4b
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->tool2:I

    if-ne v0, v1, :cond_8c

    .line 544
    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setToolSelected(I)V

    .line 545
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 547
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "adjust: option_selected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "name"

    aput-object v4, v3, v5

    .line 549
    invoke-direct {p0, v6}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getToolName(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    .line 546
    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_6

    .line 550
    :cond_8c
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->tool3:I

    if-ne v0, v1, :cond_cd

    .line 551
    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setToolSelected(I)V

    .line 552
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 553
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": option_selected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "name"

    aput-object v4, v3, v5

    invoke-direct {p0, v7}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getToolName(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_6

    .line 554
    :cond_cd
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->tool4:I

    if-ne v0, v1, :cond_6

    .line 555
    invoke-direct {p0, v8}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setToolSelected(I)V

    .line 556
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 557
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": option_selected"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-array v3, v7, [Ljava/lang/String;

    const-string v4, "name"

    aput-object v4, v3, v5

    invoke-direct {p0, v8}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getToolName(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_6
.end method

.method protected onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 9
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "editResult"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    .line 313
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {p2, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 314
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {p2, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 316
    const/4 v1, 0x0

    .line 317
    .local v1, "itemsApplied":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    const/4 v2, 0x4

    if-ge v0, v2, :cond_3c

    .line 318
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseIntArray;->get(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->convertValue(F)D

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_30

    .line 319
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mTrackingAttributes:Ljava/util/HashMap;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getToolName(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "true"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    add-int/lit8 v1, v1, 0x1

    .line 317
    :goto_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 322
    :cond_30
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mTrackingAttributes:Ljava/util/HashMap;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getToolName(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "false"

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2d

    .line 325
    :cond_3c
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v3, "item_count"

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 327
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x32

    .line 119
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 121
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;-><init>(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;

    .line 122
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->initializeAdapterTint(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;)V

    .line 124
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->pager:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mViewPager:Landroid/support/v4/view/ViewPager;

    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mViewPager:Landroid/support/v4/view/ViewPager;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdapter:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ViewPagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 126
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mViewPager:Landroid/support/v4/view/ViewPager;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 136
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->tool1:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    .line 137
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->tool2:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    .line 138
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->tool3:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    .line 139
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->tool4:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    .line 141
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->updateToolLabels()V

    .line 143
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 145
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->tool4:Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    invoke-virtual {v0, v3, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 151
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mAdjustToolValues:Landroid/util/SparseIntArray;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->put(II)V

    .line 153
    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->setToolSelected(I)V

    .line 154
    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->changeSeekBarToCurrent(I)V

    .line 155
    return-void
.end method

.method public onDeactivate()V
    .registers 1

    .prologue
    .line 295
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onProgressEnd()V

    .line 296
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onDeactivate()V

    .line 297
    return-void
.end method

.method protected onGenerateResult()V
    .registers 5

    .prologue
    .line 301
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onGenerateResult: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 303
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mIsRendering:Z

    if-eqz v1, :cond_2a

    .line 304
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;)V

    .line 305
    .local v0, "task":Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 309
    .end local v0    # "task":Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$GenerateResultTask;
    :goto_29
    return-void

    .line 307
    :cond_2a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onComplete(Landroid/graphics/Bitmap;)V

    goto :goto_29
.end method

.method public final onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 251
    invoke-virtual {p0, p2, p3}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onSliderChanged(IZ)V

    .line 252
    return-void
.end method

.method protected onSliderChanged(IZ)V
    .registers 7
    .param p1, "value"    # I
    .param p2, "fromUser"    # Z

    .prologue
    const/4 v1, 0x1

    .line 282
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSliderChanged: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", fromUser: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 284
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mViewPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->updatedToolValue(II)V

    .line 287
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel$ApplyFilterTask;

    if-nez v0, :cond_36

    .line 288
    if-nez p2, :cond_37

    move v0, v1

    :goto_33
    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->applyFilter(ZZ)V

    .line 291
    :cond_36
    return-void

    .line 288
    :cond_37
    const/4 v0, 0x0

    goto :goto_33
.end method

.method protected onSliderEnd(I)V
    .registers 6
    .param p1, "value"    # I

    .prologue
    const/4 v3, 0x0

    .line 271
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSliderEnd: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 274
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->killCurrentTask(Z)Z

    .line 275
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onProgressEnd()V

    .line 278
    invoke-virtual {p0, v3, v3}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->applyFilter(ZZ)V

    .line 279
    return-void
.end method

.method protected onSliderStart(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 266
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onProgressStart()V

    .line 268
    return-void
.end method

.method public final onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 256
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onSliderStart(I)V

    .line 257
    return-void
.end method

.method public final onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 3
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 261
    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->onSliderEnd(I)V

    .line 262
    return-void
.end method

.method public bridge synthetic setEnabled(Z)V
    .registers 2

    .prologue
    .line 39
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->setEnabled(Z)V

    return-void
.end method

.method protected setValue(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;->mCurrentSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 211
    return-void
.end method
