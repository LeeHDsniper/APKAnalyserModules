.class public Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "BordersPanel.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/BordersPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "RenderTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;",
        "Landroid/graphics/Bitmap;",
        "Landroid/graphics/Bitmap;",
        ">;",
        "Landroid/content/DialogInterface$OnCancelListener;"
    }
.end annotation


# instance fields
.field currentEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

.field filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

.field intensity:F

.field mError:Ljava/lang/String;

.field mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

.field mPosition:I

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;IF)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/BordersPanel;
    .param p2, "position"    # I
    .param p3, "intensity"    # F

    .prologue
    .line 948
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    .line 949
    iput p2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mPosition:I

    .line 950
    iput p3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->intensity:F

    .line 951
    return-void
.end method

.method private initFilter(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IF)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;
    .registers 12
    .param p1, "item"    # Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    .param p2, "position"    # I
    .param p3, "intensity"    # F

    .prologue
    const/4 v4, 0x0

    .line 967
    :try_start_1
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    const/4 v5, 0x1

    invoke-virtual {v3, p1, p2, v5, p3}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->loadNativeFilter(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IZF)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_a} :catch_e

    .line 973
    .local v2, "tempFilter":Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;
    if-nez v2, :cond_14

    move-object v2, v4

    .line 988
    .end local v2    # "tempFilter":Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;
    :goto_d
    return-object v2

    .line 968
    :catch_e
    move-exception v1

    .line 969
    .local v1, "t":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    move-object v2, v4

    .line 970
    goto :goto_d

    .line 977
    .end local v1    # "t":Ljava/lang/Throwable;
    .restart local v2    # "tempFilter":Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;
    :cond_14
    instance-of v3, v2, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;

    if-eqz v3, :cond_1f

    move-object v3, v2

    .line 978
    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;->setHiRes(Z)V

    .line 982
    :cond_1f
    :try_start_1f
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v6, 0x1

    const/4 v7, 0x1

    invoke-virtual {v2, v3, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;->prepare(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    :try_end_2f
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_2f} :catch_30

    goto :goto_d

    .line 983
    :catch_30
    move-exception v0

    .line 984
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 985
    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-object v2, v4

    .line 986
    goto :goto_d
.end method


# virtual methods
.method public varargs doInBackground([Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "params"    # [Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    .prologue
    const/4 v2, 0x0

    .line 994
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1026
    :cond_7
    :goto_7
    return-object v2

    .line 998
    :cond_8
    const/4 v3, 0x0

    aget-object v1, p1, v3

    .line 999
    .local v1, "item":Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;
    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->currentEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    .line 1001
    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mPosition:I

    iget v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->intensity:F

    invoke-direct {p0, v1, v3, v4}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->initFilter(Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;IF)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    .line 1003
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    if-nez v3, :cond_1e

    .line 1004
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->currentEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    goto :goto_7

    .line 1008
    :cond_1e
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsRendering:Ljava/lang/Boolean;

    .line 1010
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_7

    .line 1016
    :try_start_2d
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->execute()V
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_32} :catch_3d

    .line 1023
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_7

    .line 1024
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->outputBitmap:Landroid/graphics/Bitmap;

    goto :goto_7

    .line 1017
    :catch_3d
    move-exception v0

    .line 1018
    .local v0, "exception":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mError:Ljava/lang/String;

    .line 1019
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_7
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 939
    check-cast p1, [Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->doInBackground([Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public doPostExecute(Landroid/graphics/Bitmap;)V
    .registers 10
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 1033
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    iput-object v3, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    .line 1034
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iput-boolean v7, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsAnimating:Z

    .line 1036
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->isActive()Z

    move-result v2

    if-nez v2, :cond_15

    .line 1087
    :goto_14
    return-void

    .line 1040
    :cond_15
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iput-object p1, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 1042
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->currentEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    iput-object v3, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    .line 1044
    if-eqz p1, :cond_2b

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    if-eqz v2, :cond_2b

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->active:I

    if-nez v2, :cond_5c

    .line 1045
    :cond_2b
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->onRestoreOriginalBitmap()V

    .line 1047
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mError:Ljava/lang/String;

    if-eqz v2, :cond_3c

    .line 1048
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mError:Ljava/lang/String;

    const v4, 0x104000a

    invoke-virtual {v2, v3, v4, v6}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onGenericError(Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)V

    .line 1050
    :cond_3c
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2, v7}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->setIsChanged(Z)V

    .line 1081
    :goto_41
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-eq v2, v3, :cond_4e

    .line 1082
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onProgressEnd()V

    .line 1085
    :cond_4e
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsRendering:Ljava/lang/Boolean;

    .line 1086
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    # setter for: Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mCurrentTask:Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;
    invoke-static {v2, v6}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->access$102(Lcom/adobe/creativesdk/aviary/panels/BordersPanel;Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;)Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;

    goto :goto_14

    .line 1052
    :cond_5c
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->onApplyNewBitmap(Landroid/graphics/Bitmap;)V

    .line 1054
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    if-eqz v2, :cond_11a

    .line 1055
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1056
    .local v0, "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "pack"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1057
    const-string v2, "item"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1058
    const-string v2, "intensity_adjusted"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;->getIntensity()D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1059
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    .line 1060
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getName()Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": item_previewed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 1063
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    .line 1064
    .local v1, "toolAction":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setPackIdentifier(Ljava/lang/String;)V

    .line 1065
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setContentIdentifier(Ljava/lang/String;)V

    .line 1067
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/IntensityNativeFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 1068
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 1070
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v3, "item"

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1071
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v3, "pack"

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v4, v4, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_41

    .line 1073
    .end local v0    # "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "toolAction":Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;, "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO<Ljava/lang/String;>;"
    :cond_11a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v2, v6}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 1074
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v2, v6}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 1076
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v3, "item"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1077
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTrackingAttributes:Ljava/util/HashMap;

    const-string v3, "pack"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_41
.end method

.method public bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 939
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->doPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected doPreExecute()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 955
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPackType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->FRAME:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    if-eq v0, v2, :cond_e

    .line 956
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->onProgressStart()V

    .line 958
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsAnimating:Z

    .line 960
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensityIsManaged()Z

    move-result v2

    if-eqz v2, :cond_2c

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v2

    if-eqz v2, :cond_2c

    :goto_28
    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setSwipeGestureEnabled(Z)V

    .line 961
    return-void

    .line 960
    :cond_2c
    const/4 v1, 0x0

    goto :goto_28
.end method

.method protected onApplyNewBitmap(Landroid/graphics/Bitmap;)V
    .registers 14
    .param p1, "result"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1090
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensityIsManaged()Z

    move-result v2

    if-nez v2, :cond_12

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v2

    if-nez v2, :cond_f8

    .line 1091
    :cond_12
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    .line 1096
    :goto_19
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v5

    invoke-virtual {v2, v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setSwipeGestureEnabled(Z)V

    .line 1098
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mRenderedEffect:Lcom/adobe/creativesdk/aviary/internal/cds/TrayColumns$TrayCursorWrapper;

    if-eqz v2, :cond_105

    move v2, v3

    :goto_31
    invoke-virtual {v5, v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->setIsChanged(Z)V

    .line 1100
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget v5, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mSliderIntensityTooltip:I

    add-int/lit8 v6, v5, 0x1

    iput v6, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mSliderIntensityTooltip:I

    if-nez v5, :cond_f7

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v2

    if-eqz v2, :cond_f7

    .line 1102
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    .line 1103
    .local v0, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->playDemo()Landroid/graphics/PointF;

    move-result-object v1

    .line 1105
    .local v1, "pointf":Landroid/graphics/PointF;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mTooltipManager:Lit/sephiroth/android/library/tooltip/TooltipManager;

    invoke-virtual {v2, v4}, Lit/sephiroth/android/library/tooltip/TooltipManager;->create(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    .line 1106
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getActionBarSize()I

    move-result v5

    invoke-virtual {v2, v5}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->actionBarSize(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    new-instance v5, Landroid/graphics/Point;

    iget v6, v1, Landroid/graphics/PointF;->x:F

    float-to-double v6, v6

    .line 1109
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getTooltipSize()I

    move-result v8

    int-to-double v8, v8

    const-wide v10, 0x3ffd99999999999aL

    mul-double/2addr v8, v10

    sub-double/2addr v6, v8

    double-to-int v6, v6

    iget v7, v1, Landroid/graphics/PointF;->y:F

    float-to-int v7, v7

    .line 1110
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getTooltipSize()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v7, v8

    invoke-direct {v5, v6, v7}, Landroid/graphics/Point;-><init>(II)V

    sget-object v6, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .line 1107
    invoke-virtual {v2, v5, v6}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->anchor(Landroid/graphics/Point;Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    .line 1111
    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/aviary/android/feather/sdk/R$string;->feather_effect_intensity_tooltip:I

    invoke-virtual {v2, v5, v6}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->text(Landroid/content/res/Resources;I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    sget-object v5, Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;->None:Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;

    const-wide/16 v6, 0x9c4

    .line 1112
    invoke-virtual {v2, v5, v6, v7}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->closePolicy(Lit/sephiroth/android/library/tooltip/TooltipManager$ClosePolicy;J)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    .line 1113
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->getWidth()I

    move-result v5

    int-to-double v6, v5

    const-wide/high16 v8, 0x4004000000000000L

    div-double/2addr v6, v8

    double-to-int v5, v6

    invoke-virtual {v2, v5}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->maxWidth(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    const-wide/16 v6, 0x64

    .line 1114
    invoke-virtual {v2, v6, v7}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->showDelay(J)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    sget v5, Lcom/aviary/android/feather/sdk/R$style;->AdobeImageWidget_ContentPanelsTooltip:I

    .line 1115
    invoke-virtual {v2, v5}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->withStyleId(I)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    .line 1116
    invoke-virtual {v2, v4}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->toggleArrow(Z)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    sget v5, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_tooltip:I

    .line 1117
    invoke-virtual {v2, v5, v4}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->withCustomView(IZ)Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    move-result-object v2

    .line 1118
    invoke-virtual {v2}, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->show()Z

    .line 1120
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreferences:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    .line 1121
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "intensity.slider.tooltip"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1120
    invoke-virtual {v2, v4, v3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->containsSingleTimeKey(Ljava/lang/String;Z)Z

    .line 1124
    .end local v0    # "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
    .end local v1    # "pointf":Landroid/graphics/PointF;
    :cond_f7
    return-void

    .line 1093
    :cond_f8
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    const/high16 v5, 0x437f0000

    invoke-virtual {v2, p1, v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setPreviewBitmap(Landroid/graphics/Bitmap;F)V

    goto/16 :goto_19

    :cond_105
    move v2, v4

    .line 1098
    goto/16 :goto_31
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1158
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->cancel(Z)Z

    .line 1159
    return-void
.end method

.method public onCancelled()V
    .registers 3

    .prologue
    .line 1148
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->onCancelled()V

    .line 1150
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    if-eqz v0, :cond_c

    .line 1151
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->mMoaMainExecutor:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->cancel()V

    .line 1153
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mIsRendering:Ljava/lang/Boolean;

    .line 1154
    return-void
.end method

.method protected onRestoreOriginalBitmap()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    const/high16 v4, 0x437f0000

    const/high16 v3, 0x3f800000

    .line 1128
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 1130
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensitySliderEnabled()Z

    move-result v0

    if-eqz v0, :cond_55

    .line 1131
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->getIntensityIsManaged()Z

    move-result v0

    if-eqz v0, :cond_47

    .line 1132
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v6, v3, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 1136
    :goto_2f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setIntensity(F)V

    .line 1137
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setSwipeGestureEnabled(Z)V

    .line 1143
    :goto_41
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->setIsChanged(Z)V

    .line 1144
    return-void

    .line 1134
    :cond_47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->setPreviewBitmap(Landroid/graphics/Bitmap;F)V

    goto :goto_2f

    .line 1139
    :cond_55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BordersPanel$RenderTask;->this$0:Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v6, v3, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    goto :goto_41
.end method
