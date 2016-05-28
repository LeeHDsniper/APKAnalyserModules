.class public Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
.super Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;
.source "BehanceSDKCityDTO.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3e562f8917e83afeL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;-><init>()V

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;)I
    .registers 4
    .param p1, "another"    # Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .prologue
    .line 38
    if-eqz p1, :cond_1b

    invoke-virtual {p0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 39
    invoke-virtual {p0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 41
    :goto_1a
    return v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 28
    check-cast p1, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->compareTo(Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
