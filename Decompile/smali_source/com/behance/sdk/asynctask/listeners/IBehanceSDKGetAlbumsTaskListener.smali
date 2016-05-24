.class public interface abstract Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetAlbumsTaskListener;
.super Ljava/lang/Object;
.source "IBehanceSDKGetAlbumsTaskListener.java"


# virtual methods
.method public abstract onGetAlbumsTaskFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onGetAlbumsTaskSuccess(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;)V"
        }
    .end annotation
.end method
