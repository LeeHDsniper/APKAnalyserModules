.class public interface abstract Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$OnHiresListener;
.super Ljava/lang/Object;
.source "HiResBackgroundService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnHiresListener"
.end annotation


# virtual methods
.method public abstract onHiresComplete()V
.end method

.method public abstract onHiresError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V
.end method

.method public abstract onHiresProgress(II)V
.end method
