.class public Lcom/behance/sdk/files/ImageAlbum;
.super Ljava/lang/Object;
.source "ImageAlbum.java"


# instance fields
.field private albumName:Ljava/lang/String;

.field private images:Ljava/util/List;
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
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "albumName"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/behance/sdk/files/ImageAlbum;->albumName:Ljava/lang/String;

    .line 42
    return-void
.end method


# virtual methods
.method public addImage(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 3
    .param p1, "localImage"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/behance/sdk/files/ImageAlbum;->images:Ljava/util/List;

    if-nez v0, :cond_b

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/files/ImageAlbum;->images:Ljava/util/List;

    .line 50
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/files/ImageAlbum;->images:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    return-void
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
    .line 76
    iget-object v0, p0, Lcom/behance/sdk/files/ImageAlbum;->images:Ljava/util/List;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/behance/sdk/files/ImageAlbum;->albumName:Ljava/lang/String;

    return-object v0
.end method
