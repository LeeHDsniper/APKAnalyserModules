.class public Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;
.super Ljava/lang/Object;
.source "BehanceSDKLocationDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x22fc9b98d42f6f8bL


# instance fields
.field private displayName:Ljava/lang/String;

.field private id:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;->id:Ljava/lang/String;

    return-object v0
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .registers 2
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;->displayName:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .registers 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;->id:Ljava/lang/String;

    .line 49
    return-void
.end method
