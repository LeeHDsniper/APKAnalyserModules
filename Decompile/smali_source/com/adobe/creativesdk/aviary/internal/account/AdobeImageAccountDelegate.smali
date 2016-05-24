.class public interface abstract Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;
.super Ljava/lang/Object;
.source "AdobeImageAccountDelegate.java"


# virtual methods
.method public abstract getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
.end method

.method public abstract isContentServiceConnected()Z
.end method

.method public abstract tryConnectToContentService()Lrx/Observable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/Observable",
            "<",
            "Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;",
            ">;"
        }
    .end annotation
.end method
