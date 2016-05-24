.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;
.super Ljava/lang/Object;
.source "BehanceSDKGetAlbumsTaskResult.java"


# instance fields
.field private albumsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;"
        }
    .end annotation
.end field

.field private exception:Ljava/lang/Exception;

.field private exceptionOccurred:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlbumsList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;"
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->albumsList:Ljava/util/List;

    return-object v0
.end method

.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public isExceptionOccurred()Z
    .registers 2

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->exceptionOccurred:Z

    return v0
.end method

.method public setAlbumsList(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "albumsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;>;"
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->albumsList:Ljava/util/List;

    .line 58
    return-void
.end method

.method public setException(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->exception:Ljava/lang/Exception;

    .line 42
    return-void
.end method

.method public setExceptionOccurred(Z)V
    .registers 2
    .param p1, "exceptionOccurred"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetAlbumsTaskResult;->exceptionOccurred:Z

    .line 50
    return-void
.end method
