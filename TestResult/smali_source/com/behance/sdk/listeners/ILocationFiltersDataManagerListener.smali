.class public interface abstract Lcom/behance/sdk/listeners/ILocationFiltersDataManagerListener;
.super Ljava/lang/Object;
.source "ILocationFiltersDataManagerListener.java"


# virtual methods
.method public abstract onCitiesLoadingFailure(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/lang/Exception;)V
.end method

.method public abstract onCitiesLoadingSuccess(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onCountriesLoadingFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onCountriesLoadingSuccess(Ljava/util/List;)V
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

.method public abstract onStatesLoadingFailure(Ljava/lang/String;Ljava/lang/Exception;)V
.end method

.method public abstract onStatesLoadingSuccess(Ljava/lang/String;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;",
            ">;)V"
        }
    .end annotation
.end method
