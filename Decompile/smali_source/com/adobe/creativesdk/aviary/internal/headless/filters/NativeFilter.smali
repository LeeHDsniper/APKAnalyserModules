.class public Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.super Ljava/lang/Object;
.source "NativeFilter.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;


# static fields
.field public static final SEED:I


# instance fields
.field protected mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

.field protected mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    long-to-int v0, v0

    sput v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->SEED:I

    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->action(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 36
    return-void
.end method

.method public varargs constructor <init>([Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # [Ljava/lang/String;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList([Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 45
    return-void
.end method


# virtual methods
.method public execute(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "src"    # Landroid/graphics/Bitmap;
    .param p2, "dst"    # Landroid/graphics/Bitmap;
    .param p3, "w"    # I
    .param p4, "h"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-static {v1, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;->prepareActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    .line 71
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->execute()V

    .line 72
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    iget-object v0, v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->outputBitmap:Landroid/graphics/Bitmap;

    .line 73
    .local v0, "output":Landroid/graphics/Bitmap;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    .line 74
    return-object v0
.end method

.method public getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    return-object v0
.end method

.method public prepare(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    .registers 6
    .param p1, "src"    # Landroid/graphics/Bitmap;
    .param p2, "dst"    # Landroid/graphics/Bitmap;
    .param p3, "w"    # I
    .param p4, "h"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-static {v0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;->prepareActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-result-object v0

    return-object v0
.end method

.method public setPreviewSize(II)V
    .registers 8
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "previewsize"

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    int-to-float v3, p1

    int-to-float v4, p2

    invoke-direct {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 102
    return-void
.end method

.method public setSeed(I)V
    .registers 4
    .param p1, "seed"    # I

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "seed"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 106
    return-void
.end method

.method public stop()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 93
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    if-eqz v1, :cond_a

    .line 94
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;->mResult:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    iput v0, v1, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->active:I

    .line 95
    const/4 v0, 0x1

    .line 97
    :cond_a
    return v0
.end method
