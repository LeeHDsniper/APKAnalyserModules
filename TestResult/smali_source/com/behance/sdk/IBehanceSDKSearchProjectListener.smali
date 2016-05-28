.class public interface abstract Lcom/behance/sdk/IBehanceSDKSearchProjectListener;
.super Ljava/lang/Object;
.source "IBehanceSDKSearchProjectListener.java"


# virtual methods
.method public abstract onSearchProjectsFailure(Ljava/lang/Exception;)V
.end method

.method public abstract onSearchProjectsSuccess(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;",
            ">;)V"
        }
    .end annotation
.end method
