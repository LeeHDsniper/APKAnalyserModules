.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
.super Ljava/lang/Object;
.source "MoaJavaUndo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MoaUndoBitmap"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MoaUndoBitmap"


# instance fields
.field public bitmap:Landroid/graphics/Bitmap;

.field public ptr:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isEmpty()Z
    .registers 9

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 19
    const-string v2, "MoaUndoBitmap"

    const-string v3, "ptr: 0x%x, bitmap: %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->ptr:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v1

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->bitmap:Landroid/graphics/Bitmap;

    aput-object v5, v4, v0

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->bitmap:Landroid/graphics/Bitmap;

    if-nez v2, :cond_21

    :goto_20
    return v0

    :cond_21
    move v0, v1

    goto :goto_20
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 26
    const-string v0, "MoaUndoBitmap{ptr:0x%x, bitmap:%s}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->ptr:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->bitmap:Landroid/graphics/Bitmap;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
