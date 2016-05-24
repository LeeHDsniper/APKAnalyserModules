.class public Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;
.super Landroid/os/Binder;
.source "BehanceSDKPublishWIPBinder.java"


# instance fields
.field private cancelledRequestIdsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    return-void
.end method


# virtual methods
.method public isUploadCancelled(Ljava/lang/String;)Z
    .registers 3
    .param p1, "publishRequestId"    # Ljava/lang/String;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;->cancelledRequestIdsList:Ljava/util/List;

    if-eqz v0, :cond_10

    if-eqz p1, :cond_10

    iget-object v0, p0, Lcom/behance/sdk/services/binders/BehanceSDKPublishWIPBinder;->cancelledRequestIdsList:Ljava/util/List;

    .line 37
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 38
    const/4 v0, 0x1

    .line 40
    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method
