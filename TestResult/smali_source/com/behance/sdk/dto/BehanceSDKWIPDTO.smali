.class public Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
.super Ljava/lang/Object;
.source "BehanceSDKWIPDTO.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;
    }
.end annotation


# instance fields
.field private id:I

.field private latestRevisionImageUrlsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    return-void
.end method


# virtual methods
.method public getId()I
    .registers 2

    .prologue
    .line 45
    iget v0, p0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->id:I

    return v0
.end method

.method public getLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;)Ljava/lang/String;
    .registers 4
    .param p1, "imageType"    # Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->latestRevisionImageUrlsMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->title:Ljava/lang/String;

    return-object v0
.end method

.method public setId(I)V
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 49
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->id:I

    .line 50
    return-void
.end method

.method public setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V
    .registers 5
    .param p1, "imageType"    # Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;
    .param p2, "imageUrl"    # Ljava/lang/String;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->latestRevisionImageUrlsMap:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->latestRevisionImageUrlsMap:Ljava/util/Map;

    .line 72
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->latestRevisionImageUrlsMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->title:Ljava/lang/String;

    .line 42
    return-void
.end method
