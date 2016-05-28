.class public Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;
.source "EnhanceEffectPanel.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$GenerateResultTask;,
        Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;
    }
.end annotation


# instance fields
.field enableFastPreview:Z

.field private mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

.field private mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

.field private mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

.field volatile mIsRendering:Z


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .param p3, "type"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 31
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mIsRendering:Z

    .line 34
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->enableFastPreview:Z

    .line 42
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 43
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;)Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mFilterType:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    return-object v0
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;)Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    return-object p1
.end method

.method private buttonClick(Ljava/lang/String;Z)V
    .registers 12
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v8, 0x0

    const/4 v4, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 138
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "buttonClick: %s, %b"

    new-array v6, v4, [Ljava/lang/Object;

    aput-object p1, v6, v2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v6, v3

    invoke-interface {v1, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 139
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->HiDef:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    .line 140
    .local v0, "type":Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->killCurrentTask()V

    .line 142
    const/4 v1, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_a6

    :cond_22
    :goto_22
    packed-switch v1, :pswitch_data_b4

    .line 151
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->ColorFix:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    .line 155
    :goto_27
    if-nez p2, :cond_6c

    .line 157
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-static {v1, v4}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 158
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onPreviewChanged(Landroid/graphics/Bitmap;ZZ)V

    .line 159
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v1, v8}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 160
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v1, v8}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 161
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mTrackingAttributes:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 162
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->setIsChanged(Z)V

    .line 173
    :goto_47
    return-void

    .line 142
    :sswitch_48
    const-string v5, "enhance_hi_def"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    move v1, v2

    goto :goto_22

    :sswitch_52
    const-string v5, "enhance_illuminate"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    move v1, v3

    goto :goto_22

    :sswitch_5c
    const-string v5, "enhance_color_fix"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_22

    move v1, v4

    goto :goto_22

    .line 144
    :pswitch_66
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->HiDef:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    .line 145
    goto :goto_27

    .line 147
    :pswitch_69
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->Illuminate:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    .line 148
    goto :goto_27

    .line 164
    :cond_6c
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->setIsChanged(Z)V

    .line 166
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mIsRendering:Z

    .line 167
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    .line 168
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    new-array v5, v3, [Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;

    aput-object v0, v5, v2

    invoke-virtual {v1, v5}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 170
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v5, "name"

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    const-string v5, "enhance: option_selected"

    new-array v4, v4, [Ljava/lang/String;

    const-string v6, "name"

    aput-object v6, v4, v2

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter$Types;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v3

    invoke-virtual {v1, v5, v4}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_47

    .line 142
    :sswitch_data_a6
    .sparse-switch
        -0x39a72d88 -> :sswitch_48
        -0x6f0ade3 -> :sswitch_52
        0x27713ce8 -> :sswitch_5c
    .end sparse-switch

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_66
        :pswitch_69
    .end packed-switch
.end method

.method private killCurrentTask()V
    .registers 4

    .prologue
    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    if-eqz v0, :cond_1e

    .line 219
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    monitor-enter v1

    .line 220
    :try_start_7
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->cancel(Z)Z

    .line 221
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;->renderFilter:Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;->stop()Z

    .line 222
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onProgressEnd()V

    .line 223
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_7 .. :try_end_18} :catchall_1f

    .line 224
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mIsRendering:Z

    .line 225
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$RenderTask;

    .line 227
    :cond_1e
    return-void

    .line 223
    :catchall_1f
    move-exception v0

    :try_start_20
    monitor-exit v1
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw v0
.end method


# virtual methods
.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 195
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_enhance:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 72
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onActivate()V

    .line 73
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 75
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->fastPreviewEnabled()Z

    move-result v3

    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->enableFastPreview:Z

    .line 77
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->hasOptions()Z

    move-result v3

    if-eqz v3, :cond_4f

    .line 78
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->getOptions()Landroid/os/Bundle;

    move-result-object v1

    .line 79
    .local v1, "options":Landroid/os/Bundle;
    const-string v3, "quick-stringValue"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 80
    .local v2, "stringValue":Ljava/lang/String;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "stringValue: %s"

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v2, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 81
    if-eqz v2, :cond_4f

    .line 83
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 84
    .local v0, "button":Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    if-eqz v0, :cond_4f

    .line 85
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "button found: %s"

    new-array v5, v6, [Ljava/lang/Object;

    aput-object v0, v5, v7

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 86
    invoke-virtual {v0, v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(Z)V

    .line 87
    invoke-direct {p0, v2, v6}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->buttonClick(Ljava/lang/String;Z)V

    .line 91
    .end local v0    # "button":Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    .end local v1    # "options":Landroid/os/Bundle;
    .end local v2    # "stringValue":Ljava/lang/String;
    :cond_4f
    return-void
.end method

.method public onBackPressed()Z
    .registers 2

    .prologue
    .line 200
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->killCurrentTask()V

    .line 201
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onCancel()Z
    .registers 2

    .prologue
    .line 213
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->killCurrentTask()V

    .line 214
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onCancel()Z

    move-result v0

    return v0
.end method

.method public onCancelled()V
    .registers 2

    .prologue
    .line 206
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->killCurrentTask()V

    .line 207
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mIsRendering:Z

    .line 208
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onCancelled()V

    .line 209
    return-void
.end method

.method public onCheckedChanged(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;ZZ)V
    .registers 11
    .param p1, "buttonView"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    .param p2, "isChecked"    # Z
    .param p3, "fromUser"    # Z

    .prologue
    const/4 v6, 0x0

    .line 121
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "onCheckedChanged: %b, fromUser: %b"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v6

    const/4 v4, 0x1

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 123
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    if-eqz v1, :cond_29

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    .line 124
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(Z)V

    .line 127
    :cond_29
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 129
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->isActive()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_39

    if-nez p3, :cond_3a

    .line 135
    :cond_39
    :goto_39
    return-void

    .line 133
    :cond_3a
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 134
    .local v0, "tag":Ljava/lang/String;
    invoke-direct {p0, v0, p2}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->buttonClick(Ljava/lang/String;Z)V

    goto :goto_39
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 47
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 49
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    .line 51
    .local v0, "panel":Landroid/view/ViewGroup;
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 52
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 53
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 54
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 57
    :cond_22
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 58
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 59
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 60
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 63
    :cond_3d
    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button3:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 64
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 65
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_58

    .line 66
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mCurrent:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    .line 68
    :cond_58
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onDeactivate()V

    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton1:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 98
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton2:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 99
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mButton3:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setOnCheckedChangeListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton$OnCheckedChangeListener;)V

    .line 100
    return-void
.end method

.method protected onGenerateResult()V
    .registers 3

    .prologue
    .line 308
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mIsRendering:Z

    if-eqz v1, :cond_10

    .line 309
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$GenerateResultTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;)V

    .line 310
    .local v0, "task":Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$GenerateResultTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 314
    .end local v0    # "task":Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel$GenerateResultTask;
    :goto_f
    return-void

    .line 312
    :cond_10
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onComplete(Landroid/graphics/Bitmap;)V

    goto :goto_f
.end method

.method protected onProgressEnd()V
    .registers 2

    .prologue
    .line 186
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->enableFastPreview:Z

    if-nez v0, :cond_8

    .line 187
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onProgressModalEnd()V

    .line 191
    :goto_7
    return-void

    .line 190
    :cond_8
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onProgressEnd()V

    goto :goto_7
.end method

.method protected onProgressStart()V
    .registers 2

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->enableFastPreview:Z

    if-nez v0, :cond_8

    .line 178
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;->onProgressModalStart()V

    .line 182
    :goto_7
    return-void

    .line 181
    :cond_8
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->onProgressStart()V

    goto :goto_7
.end method

.method public bridge synthetic setEnabled(Z)V
    .registers 2

    .prologue
    .line 27
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/AbstractOptionPanel;->setEnabled(Z)V

    return-void
.end method
