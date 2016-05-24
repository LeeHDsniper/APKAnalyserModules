.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeUxUtilMainUIThreadHandler;
.super Ljava/lang/Object;
.source "AdobeUxUtilMainUIThreadHandler.java"


# static fields
.field private static mUIThreadHandler:Landroid/os/Handler;


# direct methods
.method public static getHandler()Landroid/os/Handler;
    .registers 2

    .prologue
    .line 32
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeUxUtilMainUIThreadHandler;->mUIThreadHandler:Landroid/os/Handler;

    if-nez v0, :cond_f

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeUxUtilMainUIThreadHandler;->mUIThreadHandler:Landroid/os/Handler;

    .line 35
    :cond_f
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeUxUtilMainUIThreadHandler;->mUIThreadHandler:Landroid/os/Handler;

    return-object v0
.end method
