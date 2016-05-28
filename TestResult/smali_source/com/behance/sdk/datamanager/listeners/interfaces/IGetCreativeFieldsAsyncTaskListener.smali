.class public interface abstract Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;
.super Ljava/lang/Object;
.source "IGetCreativeFieldsAsyncTaskListener.java"


# virtual methods
.method public abstract onLoadCreativeFieldsFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onLoadCreativeFieldsSuccess(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;)V"
        }
    .end annotation
.end method
