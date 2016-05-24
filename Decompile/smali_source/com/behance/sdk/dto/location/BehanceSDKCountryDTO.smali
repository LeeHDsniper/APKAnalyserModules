.class public Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
.super Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;
.source "BehanceSDKCountryDTO.java"

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
        "Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;",
        ">;"
    }
.end annotation


# static fields
.field public static final COUNTRY_CODES_FOR_LOAD_STATES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x72339189fa88ea70L


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->COUNTRY_CODES_FOR_LOAD_STATES:Ljava/util/List;

    .line 39
    sget-object v0, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->COUNTRY_CODES_FOR_LOAD_STATES:Ljava/util/List;

    const-string v1, "US"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    sget-object v0, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->COUNTRY_CODES_FOR_LOAD_STATES:Ljava/util/List;

    const-string v1, "CA"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/behance/sdk/dto/location/BehanceSDKLocationDTO;-><init>()V

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;)I
    .registers 4
    .param p1, "another"    # Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .prologue
    .line 46
    if-eqz p1, :cond_1b

    invoke-virtual {p0}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1b

    .line 47
    invoke-virtual {p0}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 49
    :goto_1a
    return v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3

    .prologue
    .line 30
    check-cast p1, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->compareTo(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
