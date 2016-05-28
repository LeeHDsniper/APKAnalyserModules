.class public Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;
.source "NativeEffectRangePanel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$GenerateResultTask;,
        Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;
    }
.end annotation


# instance fields
.field private mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

.field private mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

.field volatile mIsRendering:Z

.field private mPreviewSmallBitmap:Landroid/graphics/Bitmap;

.field private mPreviewSmallDrawable:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;

.field private final mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .param p3, "type"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mIsRendering:Z

    .line 39
    invoke-static {p3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    .line 40
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .line 41
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Landroid/graphics/Bitmap;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    return-object v0
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    return-object p1
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallDrawable:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;

    return-object v0
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;)Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;
    .param p1, "x1"    # Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    return-object p1
.end method

.method private acquireBitmap(I)Landroid/graphics/Bitmap;
    .registers 6
    .param p1, "ratio"    # I

    .prologue
    .line 193
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    div-int/2addr v1, p1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/2addr v2, p1

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 194
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 195
    return-object v0
.end method


# virtual methods
.method protected applyFilter(FZZ)V
    .registers 9
    .param p1, "value"    # F
    .param p2, "showProgress"    # Z
    .param p3, "isPreview"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "applyFilter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 173
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_45

    .line 174
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->killCurrentTask(Z)Z

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    .line 176
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallDrawable:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;->updateBitmap(Landroid/graphics/Bitmap;II)V

    .line 177
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onPreviewUpdated()V

    .line 178
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mIsRendering:Z

    .line 179
    invoke-virtual {p0, v4}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->setIsChanged(Z)V

    .line 189
    :goto_44
    return-void

    .line 184
    :cond_45
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mIsRendering:Z

    .line 185
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;FZZ)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    new-array v1, v3, [Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 187
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->setIsChanged(Z)V

    goto :goto_44
.end method

.method killCurrentTask(Z)Z
    .registers 5
    .param p1, "endProgress"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 158
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    if-eqz v2, :cond_16

    .line 159
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    invoke-virtual {v2, v0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;->cancel(Z)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 160
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mIsRendering:Z

    .line 161
    if-eqz p1, :cond_15

    .line 162
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onProgressEnd()V

    .line 167
    :cond_15
    :goto_15
    return v0

    :cond_16
    move v0, v1

    goto :goto_15
.end method

.method public onActivate()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 60
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onActivate()V

    .line 62
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    .line 63
    const/4 v2, 0x3

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->acquireBitmap(I)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;

    .line 65
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;-><init>(Landroid/graphics/Bitmap;II)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallDrawable:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;

    .line 66
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallDrawable:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FakeBitmapDrawable;

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v6, v3}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onPreviewChanged(Landroid/graphics/drawable/Drawable;ZZ)V

    .line 67
    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->setIsChanged(Z)V

    .line 69
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->hasOptions()Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 70
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->getOptions()Landroid/os/Bundle;

    move-result-object v0

    .line 71
    .local v0, "options":Landroid/os/Bundle;
    const-string v2, "quick-numericValue"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4e

    .line 72
    const-string v2, "quick-numericValue"

    invoke-virtual {v0, v2, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 73
    .local v1, "value":I
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->setValue(I)V

    .line 76
    .end local v0    # "options":Landroid/os/Bundle;
    .end local v1    # "value":I
    :cond_4e
    return-void
.end method

.method public onBackPressed()Z
    .registers 2

    .prologue
    .line 146
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->killCurrentTask(Z)Z

    .line 147
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onCancelled()V
    .registers 2

    .prologue
    .line 152
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->killCurrentTask(Z)Z

    .line 153
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mIsRendering:Z

    .line 154
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onCancelled()V

    .line 155
    return-void
.end method

.method protected onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "editResult"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    .line 139
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {p2, v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 140
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {p2, v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 141
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onComplete(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 142
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 3
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 45
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 46
    return-void
.end method

.method public onDeactivate()V
    .registers 1

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onProgressEnd()V

    .line 112
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onDeactivate()V

    .line 113
    return-void
.end method

.method protected onDispose()V
    .registers 2

    .prologue
    .line 117
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractSeekbarOptionPanel;->onDispose()V

    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_17

    .line 120
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 121
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreviewSmallBitmap:Landroid/graphics/Bitmap;

    .line 123
    :cond_17
    return-void
.end method

.method protected onGenerateResult()V
    .registers 5

    .prologue
    .line 127
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onGenerateResult: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mIsRendering:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 129
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mIsRendering:Z

    if-eqz v1, :cond_2a

    .line 130
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$GenerateResultTask;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$GenerateResultTask;-><init>(Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;)V

    .line 131
    .local v0, "task":Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$GenerateResultTask;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$GenerateResultTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 135
    .end local v0    # "task":Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$GenerateResultTask;
    :goto_29
    return-void

    .line 133
    :cond_2a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onComplete(Landroid/graphics/Bitmap;)V

    goto :goto_29
.end method

.method protected onSliderChanged(IZ)V
    .registers 7
    .param p1, "value"    # I
    .param p2, "fromUser"    # Z

    .prologue
    const/4 v1, 0x1

    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

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

    .line 103
    add-int/lit8 v0, p1, -0x32

    mul-int/lit8 p1, v0, 0x2

    .line 104
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel$ApplyFilterTask;

    if-nez v0, :cond_32

    .line 105
    int-to-float v2, p1

    if-nez p2, :cond_33

    move v0, v1

    :goto_2f
    invoke-virtual {p0, v2, v0, v1}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->applyFilter(FZZ)V

    .line 107
    :cond_32
    return-void

    .line 105
    :cond_33
    const/4 v0, 0x0

    goto :goto_2f
.end method

.method protected onSliderEnd(I)V
    .registers 6
    .param p1, "value"    # I

    .prologue
    const/4 v3, 0x0

    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

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

    .line 92
    invoke-virtual {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->killCurrentTask(Z)Z

    .line 93
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onProgressEnd()V

    .line 95
    add-int/lit8 v0, p1, -0x32

    mul-int/lit8 p1, v0, 0x2

    .line 96
    int-to-float v0, p1

    invoke-virtual {p0, v0, v3, v3}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->applyFilter(FZZ)V

    .line 97
    return-void
.end method

.method protected onSliderStart(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;->onProgressStart()V

    .line 86
    return-void
.end method
