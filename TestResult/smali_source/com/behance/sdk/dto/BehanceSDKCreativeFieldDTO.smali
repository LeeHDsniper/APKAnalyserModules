.class public Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
.super Ljava/lang/Object;
.source "BehanceSDKCreativeFieldDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4a01851c8e44b41cL


# instance fields
.field private category:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

.field private id:Ljava/lang/String;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->id:Ljava/lang/String;

    .line 40
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->NONE:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    iput-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->category:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 70
    if-ne p0, p1, :cond_5

    .line 96
    :cond_4
    :goto_4
    return v1

    .line 72
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 73
    goto :goto_4

    .line 74
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 75
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 76
    check-cast v0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    .line 77
    .local v0, "objCFDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    iget-object v3, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->id:Ljava/lang/String;

    if-eqz v3, :cond_28

    .line 79
    iget-object v3, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->id:Ljava/lang/String;

    iget-object v4, v0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    move v1, v2

    .line 80
    goto :goto_4

    .line 82
    :cond_28
    iget-object v3, v0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->id:Ljava/lang/String;

    if-eqz v3, :cond_2e

    move v1, v2

    .line 83
    goto :goto_4

    .line 85
    :cond_2e
    iget-object v3, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->name:Ljava/lang/String;

    if-eqz v3, :cond_3e

    .line 86
    iget-object v3, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->name:Ljava/lang/String;

    iget-object v4, v0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_44

    move v1, v2

    .line 87
    goto :goto_4

    .line 89
    :cond_3e
    iget-object v3, v0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->name:Ljava/lang/String;

    if-eqz v3, :cond_44

    move v1, v2

    .line 90
    goto :goto_4

    .line 93
    :cond_44
    iget-object v3, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->category:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    iget-object v4, v0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->category:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 94
    goto :goto_4
.end method

.method public getCategory()Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->category:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setCategory(Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;)V
    .registers 2
    .param p1, "category"    # Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->category:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    .line 60
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .registers 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->id:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->name:Ljava/lang/String;

    .line 52
    return-void
.end method
