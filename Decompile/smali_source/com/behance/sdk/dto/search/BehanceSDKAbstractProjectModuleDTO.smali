.class public abstract Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
.super Ljava/lang/Object;
.source "BehanceSDKAbstractProjectModuleDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4e9fffae3f49d2a2L


# instance fields
.field private id:Ljava/lang/String;

.field private type:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setId(Ljava/lang/String;)V
    .registers 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;->id:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setType(Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;)V
    .registers 2
    .param p1, "type"    # Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;->type:Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    .line 53
    return-void
.end method
