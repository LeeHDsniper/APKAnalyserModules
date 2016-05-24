.class public Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;
.super Ljava/lang/Object;
.source "BehanceSDKProjectCopyrightDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private licenseDescription:Ljava/lang/String;

.field private licenseType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setLicenseDescription(Ljava/lang/String;)V
    .registers 2
    .param p1, "licenseDescription"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;->licenseDescription:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setLicenseType(Ljava/lang/String;)V
    .registers 2
    .param p1, "licenseType"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;->licenseType:Ljava/lang/String;

    .line 37
    return-void
.end method
