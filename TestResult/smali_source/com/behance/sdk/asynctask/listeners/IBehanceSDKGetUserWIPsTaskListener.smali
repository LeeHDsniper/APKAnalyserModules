.class public interface abstract Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;
.super Ljava/lang/Object;
.source "IBehanceSDKGetUserWIPsTaskListener.java"


# virtual methods
.method public abstract onGetUserWIPsTaskFailure(Ljava/lang/Exception;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;)V
.end method

.method public abstract onGetUserWIPsTaskSuccess(Ljava/util/List;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;",
            ")V"
        }
    .end annotation
.end method
