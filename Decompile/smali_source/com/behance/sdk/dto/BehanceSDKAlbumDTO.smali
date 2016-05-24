.class public Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;
.super Ljava/lang/Object;
.source "BehanceSDKAlbumDTO.java"


# instance fields
.field private albumName:Ljava/lang/String;

.field private albumType:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

.field private imagesList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/behance/sdk/enums/BehanceSDKAlbumType;)V
    .registers 4
    .param p1, "albumName"    # Ljava/lang/String;
    .param p2, "albumType"    # Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->albumName:Ljava/lang/String;

    .line 43
    if-nez p2, :cond_c

    .line 44
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->DEVICE_ALBUM:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    iput-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->albumType:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    .line 48
    :goto_b
    return-void

    .line 46
    :cond_c
    iput-object p2, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->albumType:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    goto :goto_b
.end method


# virtual methods
.method public getAlbumType()Lcom/behance/sdk/enums/BehanceSDKAlbumType;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->albumType:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    return-object v0
.end method

.method public getCoverBitmap(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    iget-object v1, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->imagesList:Ljava/util/List;

    if-eqz v1, :cond_12

    .line 56
    iget-object v1, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->imagesList:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/project/modules/ImageModule;

    .line 57
    .local v0, "localImage":Lcom/behance/sdk/project/modules/ImageModule;
    invoke-virtual {v0, p1}, Lcom/behance/sdk/project/modules/ImageModule;->getThumbNail(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 59
    .end local v0    # "localImage":Lcom/behance/sdk/project/modules/ImageModule;
    :goto_11
    return-object v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public getImages()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->imagesList:Ljava/util/List;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->albumName:Ljava/lang/String;

    return-object v0
.end method

.method public setImages(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/project/modules/ImageModule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "value":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/project/modules/ImageModule;>;"
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->imagesList:Ljava/util/List;

    if-nez v0, :cond_b

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->imagesList:Ljava/util/List;

    .line 73
    :cond_b
    if-eqz p1, :cond_12

    .line 74
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKAlbumDTO;->imagesList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 76
    :cond_12
    return-void
.end method
