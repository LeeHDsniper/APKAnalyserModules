.class public interface abstract Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;
.super Ljava/lang/Object;
.source "IGetCountriesAsyncTaskListener.java"


# virtual methods
.method public abstract onGetCountriesFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onGetCountriesSuccess(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;",
            ">;)V"
        }
    .end annotation
.end method
