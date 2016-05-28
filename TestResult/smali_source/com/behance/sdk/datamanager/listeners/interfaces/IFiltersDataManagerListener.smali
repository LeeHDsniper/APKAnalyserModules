.class public interface abstract Lcom/behance/sdk/datamanager/listeners/interfaces/IFiltersDataManagerListener;
.super Ljava/lang/Object;
.source "IFiltersDataManagerListener.java"


# virtual methods
.method public abstract onCreativeFieldsLoadingFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onCreativeFieldsLoadingSuccess(Ljava/util/List;)V
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
